const router = require('express').Router()

// import controllers
const { user_controller } = require('../controllers')

// define route
router.post('/users', user_controller.register)
router.get('/users', user_controller.getUsers)
router.get('/users/:uid', user_controller.getUserById)
router.get('/auth/verify', user_controller.verifyAccount)
router.post('/auth/refresh', user_controller.refreshToken)

// export * module
module.exports = router