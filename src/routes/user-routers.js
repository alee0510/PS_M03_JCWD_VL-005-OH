const router = require('express').Router()

// import controllers
const { user_controller } = require('../controllers')

// define route
router.post('/users', user_controller.register)

// export * module
module.exports = router