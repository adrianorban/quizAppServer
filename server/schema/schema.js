const Joi = require("joi");

exports.registerValidation = (data) => {
    console.log(data);
    const schema = Joi.object({
        name: Joi.string().required(),
        email: Joi.string().required().email(),
        password: Joi.string().required(),
        passwordConfirm: Joi.string().required()
    });
    
    return schema.validate(data);
}

exports.registerProValidation = (data) => {
    console.log(data);
    const schema = Joi.object({
        name: Joi.string().required(),
        email: Joi.string().required().email(),
        password: Joi.string().required(),
        passwordConfirm: Joi.string().required(),
        streamUrl: Joi.string().required()
    });
    
    return schema.validate(data);
}

exports.loginValidation = (data) => {
    const schema = Joi.object({
        name: Joi.string().required(),
        password: Joi.string().required()
    });

    return schema.validate(data);
}

exports.roomCreationValidation = (data) => {
    const schema = Joi.object({
        name: Joi.string().required(),
        game: Joi.string().required(),
        hostAccount: Joi.number().required(),
        roomSlots: Joi.number().required(),
        slotPrice: Joi.number().required(),
    });

    return schema.validate(data);
}