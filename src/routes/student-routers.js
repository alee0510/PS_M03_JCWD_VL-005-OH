const router = require('express').Router()

// import controllers
const { student_controllers } = require('../controllers')

// define routers
router.get('/students', student_controllers.getStudents)
router.get('/students/:student_id', student_controllers.getStudentById)
router.post('/students', student_controllers.postStudent)

// export * router
module.exports = router