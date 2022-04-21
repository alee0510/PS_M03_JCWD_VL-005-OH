const uuid = require('uuid')
const bcrypt = require('bcrypt')
const { totp } = require('otplib')
const jwt = require('jsonwebtoken')
const { transporter } = require('../helpers/transporter')
const database = require('../config').promise()
const createError = require('../helpers/create-error')
const createRespond = require('../helpers/create-respond')
const http_status = require('../helpers/http-status')
const { registerSchema, loginSchema } = require('../helpers/validation-schema')

module.exports.register = async (req, res) => {
    const { username, email, password, repeat_password } = req.body
    try {
        // 1. validate -> match password with repeat password
        if (password !== repeat_password) {
            throw new createError(http_status.BAD_REQUEST, `password doesn't match.`)
        }

        // 2. validate value of req.body -> according to our schema
        const { error } = registerSchema.validate(req.body)
        if (error) {
            throw new createError(http_status.BAD_REQUEST, error.details[0].message)
        }

        // 3. check if username and email is unique?
        const CHECK_USER = `SELECT id FROM users WHERE username = ? OR email = ?;`
        const [ USER ] = await database.execute(CHECK_USER, [username, email])
        if (USER.length) {
            throw new createError(http_status.BAD_REQUEST, 'username and email must be unique.')
        }

        // 4. create UID
        const uid = uuid.v4()
        console.log('uid : ', uid)

        // 5. HASH password
        const salt = await bcrypt.genSalt(10)
        const hashed_password = await bcrypt.hash(password, salt)
        console.log('plain : ', password)
        console.log('hashed :', hashed_password)

        // 6. store data into our database
        const INSERT_USER = `
            INSERT INTO users (uid, username, email, password)
            VALUES(${database.escape(uid)}, ${database.escape(username)}, ${database.escape(email)}, ${database.escape(hashed_password)});
        `
        const [ INFO ] = await database.execute(INSERT_USER)

        // 7. geneate TOKEN -> OTP
        // totp.options = { epoch : 0, step : 300 }
        const OTP = totp.generate(uid)
        console.log('OTP : ', OTP)
        
        // store otp to database
        const INSERT_TOKEN = `INSERT INTO token (uid, token) VALUES (${database.escape(uid)}, ${database.escape(OTP)});`
        const [ INFO_TOKEN ] = await database.execute(INSERT_TOKEN) 

        // 8. send otp to client -> via email        
        const TRANSPORTER_INFO = await transporter.sendMail({
            from : 'admin <ali.muksin0510@gmail.com>',
            to : `${email}`,
            subject : 'OTP Verification',
            html: 
            `
                <p>This is your verify code, do not share to others.</p>
                <p>TOKEN : ${OTP}</p>
            `
        })

        // create respond
        const respond = new createRespond(
            http_status.CREATED, 'register', true, 1, 1, 
            // { id: INFO.insertId, uid : uid, username : username, email : email }
            // TRANSPORTER_INFO
            'register success and please verify your account.'
        )   
        res.header('uid', uid).status(respond.status).send(respond)
    } catch (error) {
        const isTrusted = error instanceof createError
        if (!isTrusted) {
            error = new createError(http_status.INTERNAL_SERVER_ERROR, error.sqlMessage)
        }
        res.status(error.status).send(error)
    }
}

// verify account
module.exports.verifyAccount = async (req, res) => {
    const uid = req.header('uid')
    const token = req.body.token
    console.log(token, uid)
    try {
        // verify token
        // console.log(totp.timeRemaining())
        // const isValid = totp.check(token, uid)
        // console.log('isValid : ', isValid)

        const CHECK_TOKEN = `SELECT createdAt FROM token WHERE token = ? AND uid = ?;`
        const [ TOKEN ] = await database.execute(CHECK_TOKEN, [token, uid])
        if (!TOKEN.length) {
            throw new createError(http_status.BAD_REQUEST, 'token invalid.')
        }
        const created = new Date(TOKEN[0].createdAt).getTime()
        const now = new Date().getTime()
        console.log('created : ', created)
        console.log('now : ', now)

        // validate token
        const step = now - created // miliseconds
        if (step >= 30000) { // 30 seconds
            throw new createError(http_status.BAD_REQUEST, 'token expired.')
        }

        // change status
        const UPDATE_STATUS = `UPDATE users SET status = 1 WHERE uid = ?;`
        const [ INFO ] = await database.execute(UPDATE_STATUS, [uid])

        // delete token
        const DELETE_TOKEN = `DELETE FROM token WHERE uid = ?;`
        const [ INFO_DELETE ] = await database.execute(DELETE_TOKEN, [uid])

        // create respond
        const respond = new createRespond(http_status.OK, 'verify', true, 1, 1, INFO.info)
        res.status(respond.status).send(respond)
    } catch (error) {
        const isTrusted = error instanceof createError
        if (!isTrusted) {
            error = new createError(http_status.INTERNAL_SERVER_ERROR, error.sqlMessage)
        }
        res.status(error.status).send(error) 
    }
}

// REFRESH TOKEN
// capture uid -> validasi kalau uid valid -> check data di token
// update value token -> generate new token and update created-at
// send token to client -> via email and UID via headers
module.exports.refreshToken = async (req, res) => {
    // capture UID and token
    const token = req.body.token
    const UID = req.header('uid')
    try {
        // validate token 
        const CHECK_TOKEN = `SELECT token, createdAt FROM token WHERE uid = ? AND token = ?;`
        const [ TOKEN ] = await database.execute(CHECK_TOKEN, [UID, token])
        if (!TOKEN.length) {
            throw new createError(http_status.BAD_REQUEST, 'invalid token.')
        }

        // if token exist -> check if token still valid or not
        const created = new Date(TOKEN[0].createdAt).getTime()
        const now = new Date().getTime()
        const step = now - created
        const remaining_time = Math.floor((30000 - step) / 1000)
        // if token still valid and not yet expired
        if (step <= 30000) {
            throw new createError(http_status.BAD_REQUEST, `please wait for ${remaining_time}s to refresh your token.`)
        }

        // get email
        const GET_EMAIL = `SELECT email FROM users WHERE uid = ?;`
        const [ EMAIL ] = await database.execute(GET_EMAIL, [UID])

        // if token has been expired -> update token
        const otp = totp.generate(UID)
        const UPDATE_TOKEN = `UPDATE token SET token = ?, createdAt = ? WHERE uid = ?;`
        const [ INFO ] = await database.execute(UPDATE_TOKEN, [otp, new Date(), UID])

        // send token to client email
        await transporter.sendMail({
            from : 'admin <ali.muksin0510@gmail.com>',
            to : `${EMAIL[0].email}`,
            subject : 'OTP Verification',
            html: 
            `
                <p>This is your verify code, do not share to others.</p>
                <p>TOKEN : ${otp}</p>
            `
        })

        // create respond
        const respond = new createRespond(http_status.OK, 'refresh token', true, 1, 1, INFO.info)
        res.status(respond.status).send(respond)
    } catch (error) {
        const isTrusted = error instanceof createError
        if (!isTrusted) {
            error = new createError(http_status.INTERNAL_SERVER_ERROR, error.sqlMessage)
        }
        res.status(error.status).send(error) 
    }
}

// GET USER + GET USER by ID
module.exports.getUsers = async (req, res) => {
    try {
        // define query
        const GET_USERS = `SELECT * FROM users LIMIT 5;`
        const [ USERS ] = await database.execute(GET_USERS)

        // create respond
        const respond = new createRespond(http_status.OK, 'get', true, 5, 5, USERS)
        res.status(respond.status).send(respond)
    } catch (error) {
        const isTrusted = error instanceof createError
        if (!isTrusted) {
            error = new createError(http_status.INTERNAL_SERVER_ERROR, error.sqlMessage)
        }
        res.status(error.status).send(error)
    }
}

module.exports.getUserById = async (req, res) => {
    const uid = req.params.uid
    try {
        // define query
        const GET_USER_BY_ID = `SELECT * FROM users WHERE uid = ?;`
        const [ USER ] = await database.execute(GET_USER_BY_ID, [uid])

        // create respond
        const respond = new createRespond(http_status.OK, 'get', true, 1, 1, USER[0])
        res.status(respond.status).send(respond)
    } catch (error) {
        const isTrusted = error instanceof createError
        if (!isTrusted) {
            error = new createError(http_status.INTERNAL_SERVER_ERROR, error.sqlMessage)
        }
        res.status(error.status).send(error)
    }
}

// LOGIN
module.exports.login = async (req, res) => {
    const { username, password } = req.body // { username & password }
    try {
        // 1.validate req.body
        const { error } = loginSchema.validate(req.body)
        if (error) {
            throw new createError(http_status.BAD_REQUEST, error.details[0].message)
        }

        // 2. validate username in our database
        const CHECK_USER = `SELECT * FROM users WHERE username = ?;`
        const [ USER ] = await database.execute(CHECK_USER, [username])
        if (!USER.length) {
            throw new createError(http_status.NOT_FOUND, 'user has not been register.')
        }

        // 3. if user already resgitered => validate password
        const isValid = await bcrypt.compare(password, USER[0].password)
        if(!isValid) {
            throw new createError(http_status.BAD_REQUEST, 'invalid password.')
        }

        // 4. if password valid, -> create token using JWT
        const token = jwt.sign({ uid : USER[0].uid }, process.env.SECRET_KEY)
        console.log('login token:', token)

        // 5. create respond and sent token to client
        delete USER[0].password
        const respond = new createRespond(http_status.OK, 'login', true, 1, 1, USER[0])
        res.header('Auth-Token', `Bearer ${token}`).status(respond.status).send(respond)
    } catch (error) {
        console.log(error)
        const isTrusted = error instanceof createError
        if (!isTrusted) {
            error = new createError(http_status.INTERNAL_SERVER_ERROR, error.sqlMessage)
        }
        res.status(error.status).send(error)
    }
}

// KEEPLOGIN -> FRONTEND WANT TO RETRIEVE USER'S DATA AFTER PAGE REFRSHED
module.exports.keepLogin = async (req, res) => {
    const token = req.header('Auth-Token')
    try {
        // check token
        if (!token) {
            throw new createError(http_status.UNAUTORIZHED, 'token is required.')
        }

        // if token exist -> validate token
        const { uid } = jwt.verify(token, process.env.SECRET_KEY)
        if (!uid) {
            throw new createError(http_status.BAD_REQUEST, 'invalid token.')
        }

        // if token valid => retrieve user's data
        const GET_USER = `SELECT * FROM users WHERE uid = ?;`
        const [ USER ] = await database.execute(GET_USER, [uid])

        // create respond
        const respond = new createRespond(http_status.OK, 'keeplogin', true, 1, 1, USER[0])
        res.status(respond.status).send(respond)
    } catch (error) {
        console.log(error)
        const isTrusted = error instanceof createError
        if (!isTrusted) {
            error = new createError(http_status.INTERNAL_SERVER_ERROR, error.sqlMessage)
        }
        res.status(error.status).send(error)
    }
}