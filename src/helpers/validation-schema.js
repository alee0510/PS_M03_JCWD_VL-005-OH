const Joi = require('joi')

// post schema
module.exports.postStudentSchema = Joi.object({
    name : Joi.string().min(3).max(15).required(),
    email : Joi.string().email().required(),
    programId : Joi.number().required(),
    cityId : Joi.number().required()
})