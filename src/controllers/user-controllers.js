const uuid = require('uuid')
const bcrypt = require('bcrypt')
const database = require('../config').promise()
const createError = require('../helpers/create-error')
const createRespond = require('../helpers/create-respond')
const http_status = require('../helpers/http-status')
const { registerSchema } = require('../helpers/validation-schema')

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

        // 7. create respond
        const respond = new createRespond(
            http_status.CREATED, 'insert', true, 1, 1, 
            { id: INFO.insertId, uid : uid, username : username, email : email }
        )
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
// PATCH USER -> username and email v
// CHANGE PASSWORD -> verification
// SOFT DELETE v