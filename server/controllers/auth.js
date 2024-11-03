const mysql = require("mysql");
const jwt = require("jsonwebtoken");
const bcrypt = require("bcryptjs");

const { registerValidation, registerProValidation, loginValidation } = require("../schema/schema");
const { read } = require('../utils/secrets');

const db = mysql.createConnection({
    host: read('mysql-host'),
    user: read('mysql-user'),
    password: read('mysql-password'),
    database: read('mysql-database')
});

exports.userDetails = (req, res) => {
    const { _id } = req.user;

    db.query('SELECT email, name, isPro, isActive, streamUrl, coins FROM users WHERE id = ?', [_id],  (error, results) => {
        if(error) {
            res.status(200).json({
                success: false,
                errorMsg: "An DB error occurred. " + error
            });
        }
        if(results.length > 0) {
            res.json({ 
                name: results[0].name,
                email: results[0].email,
                isPro: results[0].isPro,
                isActive: results[0].isActive,
                streamUrl: results[0].streamUrl,
                coins: results[0].coins,
                loggedIn: true 
            })
        } else {
            res.status(200).json({
                success: false,
                errorMsg: "error getting user details"
            });
        }
    });
}

exports.login = (req, res) => {
    if (loginValidation(req.body).error) {
        res.status(400).json({
            success: false,
            errorMsg: `Schema error: ${loginValidation(req.body).error}`
        });
        return;
    }
    const { name, password } = req.body;

    db.query('SELECT password, id FROM users WHERE name = ?', [name],  (error, results) => {
        if(error || !results) {
            res.status(200).json({
                success: false,
                errorMsg: "An error occured. Try again later"
            });
        }
        if(results.length > 0) {
            let passwordMatch = bcrypt.compareSync(password, results[0].password);
            if(passwordMatch) {
                //create and assign jwt 
                const token = jwt.sign({ _id: results[0].id}, read('jwt-token'));
                res.cookie("authToken", token, {
                    maxAge: 1000 * 60 * 60 * 24,
                    httpOnly: true,
                    secure: process.env.NODE_ENV === "production"
                });

                res.status(200).json({
                    success: true
                });
            } else {
                res.status(200).json({
                    success: false,
                    errorMsg: "Wrong password"
                });
            }
        } else {
            res.status(200).json({
                success: false,
                errorMsg: "Wrong username"
            });
        }
    });
}

exports.register = (req, res) => {
    if (registerValidation(req.body).error) {
        res.status(400).send(`Schema error: ${registerValidation(req.body).error}`);
        return;
    }
    const { name, email, password, passwordConfirm } = req.body;

    db.query('SELECT email FROM users WHERE email = ?', [email], async (error, results) => {
        if(error) {
            res.status(200).json({
                success: false,
                errorMsg: "DB error"
            });
        }

        if(results.length > 0) {
            res.status(200).json({
                success: false,
                errorMsg: "Email used"
            });
        } else {
            if(password !== passwordConfirm) {
                res.status(200).json({
                    success: false,
                    errorMsg: "Password missmatch"
                });
            } else {
                let salt = bcrypt.genSaltSync(10);
                let hashedPassword = await bcrypt.hashSync(password, salt);

                db.query("INSERT INTO users SET ?", {
                    name: name, 
                    email: email, 
                    password: hashedPassword,
                    isActive: true,
                    coins: 0
                }, (error, results) => {
                    if(error) {
                        res.status(500).json({
                            success: false,
                            errorMsg: "DB INSERT ERROR"
                        });
                    } else {
                        res.status(200).json({
                            success: true
                        });
                    }
                })
            }
        }
    });
}

exports.registerPro = (req, res) => {
    if (registerProValidation(req.body).error) {
        res.status(400).send(`Schema error: ${registerProValidation(req.body).error}`);
        return;
    }
    const { name, email, password, passwordConfirm, streamUrl } = req.body;

    db.query('SELECT email FROM users WHERE email = ?', [email], async (error, results) => {
        if(error) {
            res.status(200).json({
                success: false,
                errorMsg: "DB error"
            });
        }

        if(results.length > 0) {
            res.status(200).json({
                success: false,
                errorMsg: "Email used"
            });
        } else {
            if(password !== passwordConfirm) {
                res.status(200).json({
                    success: false,
                    errorMsg: "Password missmatch"
                });
            } else {
                let salt = bcrypt.genSaltSync(10);
                let hashedPassword = await bcrypt.hashSync(password, salt);

                db.query("INSERT INTO users SET ?", {
                    name: name, 
                    email: email, 
                    password: hashedPassword, 
                    isActive: false, 
                    isPro: true, 
                    streamUrl: streamUrl
                }, (error, results) => {
                    if(error) {
                        res.status(500).json({
                            success: false
                        });
                    } else {
                        res.status(200).json({
                            success: true
                        });
                    }
                })
            }
        }
    });
}

exports.checkPass = (req, res) => {
    res.send("check pass");
}