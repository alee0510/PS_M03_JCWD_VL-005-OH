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

module.exports.registerSchema = Joi.object({
    username : Joi.string().min(6).max(13).alphanum().required(),
    email : Joi.string().email().required(),
    password : Joi.string().min(6).max(13).pattern(/[!@#$%^&*_]/).pattern(/[0-9]/).required(),
    repeat_password: Joi.ref('password')
})