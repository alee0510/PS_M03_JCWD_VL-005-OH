const database = require('../config').promise()
const http_status = require('../helpers/http-status')

// callback
// module.exports.getStudents = (req, res) => {
//     // define query
//     const GET_STUDENT = 'SELECT * FROM students;'

//     // execute query
//     database.execute(GET_STUDENT, (error, result) => {
//         // error handling
//         if (error) {
//             console.log('error : ', error)
//             res.status(500).send('Internal service error.')
//         }
//         res.status(200).send(result)
//     })
// }

// promise wrapper
module.exports.getStudents = async (req, res) => {
    // check query params
    const limit = req.query._limit ? req.query._limit : 5
    const page = req.query._page ? req.query._page : 1
    const offset = (page - 1 ) * limit
    console.log(limit, page, offset)

    // define query
    let GET_STUDENT = `SELECT * FROM students LIMIT ${offset}, ${limit};`
    console.log(`query : `, GET_STUDENT)

    try {
        // execute query
        const [ STUDENTS ] = await database.execute(GET_STUDENT)

        res.status(200).send(STUDENTS)
    } catch (error) {
        console.log('error : ', error)
        res.status(500).send('Internal service error.')
    }
}

// GET : get student by ID
// GET : get students -> do limitation or pagination, 
// QUERY : _page ? & _limit ?, deafault limit = 5

module.exports.getStudentById = async (req, res) => {
    const student_id = req.params.student_id
    const GET_STUDENT_BY_ID = `SELECT * FROM students WHERE student_id = ?;`
    try {
        const [ STUDENT ] = await database.execute(GET_STUDENT_BY_ID, [student_id])
        console.log(STUDENT)

        // validate
        if (!STUDENT.length) {
            throw { status : http_status.BAD_REQUEST, message : 'bad request.' }
        } 

        res.status(200).send(STUDENT[0])
    } catch (error) {
        console.log('error : ', error)
        res.status(error.status || 500).send(error.message || 'Internal service error.')
    }
}

// POST & PACTH, DELETE