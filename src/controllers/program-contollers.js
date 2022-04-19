const database = require('../config').promise()
const http_status = require('../helpers/http-status')
const createError = require('../helpers/create-error')
const createRespond = require('../helpers/create-respond')

module.exports.getPrograms = async (req, res) => {
    try {
        // define query
        const GET_PROGRAM = `SELECT * FROM programs;`
        const [ PROGRAM ] = await database.execute(GET_PROGRAM)

        const GET_TOTAL_PROGRAM = `SELECT COUNT(*) AS total FROM programs;`
        const [ TOTAL ] = await database.execute(GET_TOTAL_PROGRAM)

        // create respond
        const respond = new createRespond(http_status.OK, 'get', true, TOTAL[0].total, PROGRAM.length, PROGRAM)
        res.status(respond.status).send(respond)
    } catch (error) {
        const isTrusted = error instanceof createError
        if (!isTrusted) {
            error = new createError(http_status.INTERNAL_SERVER_ERROR, error.sqlMessage)
        }
        res.status(error.status).send(error)
    }
}