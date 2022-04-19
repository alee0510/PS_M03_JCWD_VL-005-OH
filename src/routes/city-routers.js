const router = require('express').Router()

// import controller
const { city_controllers } = require('../controllers')

// define routes
router.get('/cities', city_controllers.getCities)

// export roters
module.exports = router