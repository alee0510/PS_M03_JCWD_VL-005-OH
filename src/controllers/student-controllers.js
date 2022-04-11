const database = require('../config').promise()

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
    try {
        // define query
        const GET_STUDENT = 'SELECT * FROM students;'

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