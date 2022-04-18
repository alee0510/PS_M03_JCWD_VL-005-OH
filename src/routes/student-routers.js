const router = require('express').Router()

// import controllers
const { student_controllers } = require('../controllers')

// define routers
router.get('/students', student_controllers.getStudents)
router.get('/students/:studentId', student_controllers.getStudentById)
router.post('/students', student_controllers.postStudent)
router.patch('/students/:studentId', student_controllers.patchStudent)
router.delete('/students/hard/:studentId', student_controllers.hardDeleteStudent)
router.delete('/students/soft/:studentId', student_controllers.softDeleteStudent)

// export * router
module.exports = router