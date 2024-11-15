const mysql = require("mysql2");

const { testCreationValidation } = require("../schema/schema");
const { read } = require('../utils/secrets');

const db = require("../dbConnection")

// createTest
exports.createTest = (req, res) => {
    if (testCreationValidation(req.body).error) {
        res.status(400).send(`Schema error: ${testCreationValidation(req.body).error}`);
        return;
    }
    const { name, difficulty, time, chapters, questionsNr } = req.body;
    
    //TODO generate questions here base on questionsNr
    const questions = "[]";

    const sqlQuery = "CALL createTest(?,?,?,?,?,?,?,?,?)"

    db.connection.query(sqlQuery, [
        name,
        req.user._id, 
        new Date().toISOString().split('T')[0],
        null,
        0,
        questions,
        chapters,
        time,
        difficulty
    ], (error, results) => {
        if(error) {
            res.status(500).json({
                success: false,
                errorMsg: "DB INSERT ERROR" + JSON.stringify(error)
            });
        } else {
            res.status(200).json({
                success: true
            });
        }
    })
}

//readTests
exports.readTests = (req, res) => {
    const user = req.user._id;
    //TODO optimize query, dont select *
    // const sqlQuery =  "SELECT * FROM tests WHERE userID=" + req.user._id;
    const sqlQuery = "CALL getUserTests(?)"

    db.connection.query(sqlQuery, [req.user._id], (error, results) => {
        console.log(results);
        if(error) {
            res.status(500).json({
                success: false,
                errorMsg: "DB INSERT ERROR" + JSON.stringify(error)
            });
        } else {
            res.status(200).json({
                tests: results[0]
            });
        }
    })
}