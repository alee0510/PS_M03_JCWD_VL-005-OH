const router = require('express').Router()

// import controllers
const { student_controllers } = require('../controllers')

// define routers
router.get('/students', student_controllers.getStudents)

// export * router
module.exports = router