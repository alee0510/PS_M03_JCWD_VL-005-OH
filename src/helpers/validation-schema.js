const Joi = require('joi')

// post schema
module.exports.postStudentSchema = Joi.object({
    name : Joi.string().min(3).max(15).required(),
    email : Joi.string().email().required(),
    programId : Joi.number().required(),
    cityId : Joi.number().required()
})

module.exports.patchStudentSchema = Joi.object({
    name : Joi.string().min(3).max(15),
    email : Joi.string().email(),
    programId : Joi.number(),
    cityId : Joi.number()
})

