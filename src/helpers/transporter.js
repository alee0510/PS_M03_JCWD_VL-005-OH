const nodemaier = require('nodemailer')

module.exports.transporter = nodemaier.createTransport({
    service : 'gmail',
    auth : {
        user : 'ali.muksin0510@gmail.com',
        pass : process.env.APP_PASS
    },
    tls : {
        rejectUnauthorized : false
    }
})