const mysql = require("mysql2");
const jwt = require("jsonwebtoken");
const bcrypt = require("bcryptjs");

const { registerValidation, registerProValidation, loginValidation } = require("../schema/schema");
const { read } = require('../utils/secrets');

const db = require("../dbConnection")

exports.userDetails = (req, res) => {
    const { _id } = req.user;

    db.connection.query('SELECT email, name, isPro, isActive, streamUrl, coins FROM users WHERE id = ?', [_id],  (error, results) => {
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
    const { email, password } = req.body;

    db.connection.query('SELECT * FROM users WHERE email = ?', [email],  (error, results) => {
        if(error || !results) {
            res.status(200).json({
                success: false,
                errorMsg: "An error occured. Try again later"
            });
        }
        if(results.length > 0) {
            let passwordMatch = bcrypt.compareSync(password, results[0].password);
            if(passwordMatch) {
                console.log(results[0]);
                //create and assign jwt 
                const token = jwt.sign({ _id: results[0].id, _name:results[0].name, _email:results[0].email}, read('jwt-token'));
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
                    errorMsg: "Wrong email or password"
                });
            }
        } else {
            res.status(200).json({
                success: false,
                errorMsg: "Wrong email or password"
            });
        }
    });
}

exports.register = (req, res) => {
    console.log("------register--------")
    if (registerValidation(req.body).error) {
        res.status(400).send(`Schema error: ${registerValidation(req.body).error}`);
        return;
    }
    const { name, email, password, passwordConfirm } = req.body;

    db.connection.query('SELECT email FROM users WHERE email = ?', [email], async (error, results) => {
        if(error) {
            console.log("Error -------");
            console.log(error);
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

                db.connection.query("INSERT INTO users SET ?", {
                    name: name, 
                    google_id: null,
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

exports.checkPass = (req, res) => {
    res.send("check pass");
}