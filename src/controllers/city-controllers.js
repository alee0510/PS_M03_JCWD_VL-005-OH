const database = require('../config').promise()
const http_status = require('../helpers/http-status')
const createError = require('../helpers/create-error')
const createRespond = require('../helpers/create-respond')

module.exports.getCities = async (req, res) => {
    try {
        // define query
        const GET_CITIES = `SELECT * FROM city;`
        const [ CITIES ] = await database.execute(GET_CITIES)

        const GET_TOTAL_CITIES = `SELECT COUNT(*) AS total FROM city;`
        const [ TOTAL ] = await database.execute(GET_TOTAL_CITIES)

        // create respond
        const respond = new createRespond(http_status.OK, 'get', true, TOTAL[0].total, CITIES.length, CITIES)
        res.status(respond.status).send(respond)
    } catch (error) {
        const isTrusted = error instanceof createError
        if (!isTrusted) {
            error = new createError(http_status.INTERNAL_SERVER_ERROR, error.sqlMessage)
        }
        res.status(error.status).send(error)
    }
}