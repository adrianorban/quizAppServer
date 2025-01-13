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
        passwordConfirm: Joi.string().required()
    });
    
    return schema.validate(data);
}

exports.loginValidation = (data) => {
    const schema = Joi.object({
        email: Joi.string().required().email(),
        password: Joi.string().required()
    });

    return schema.validate(data);
}

exports.testCreationValidation = (data) => {
    const schema = Joi.object({
        name: Joi.string().required(),
        chapters: Joi.string().required(),
        difficulty: Joi.number().required(),
        time: Joi.number().required(),
        questionsNr: Joi.number().required()
    });

    return schema.validate(data);
}

exports.testQuestionsValidation = (data) => {
    const schema = Joi.object({
        testId: Joi.number().required()
    });

    return schema.validate(data);
}