const router = require('express').Router()

// import controllers
const { program_controllers } = require('../controllers')

// define routes
router.get('/programs', program_controllers.getPrograms)

// export * routes
module.exports = router