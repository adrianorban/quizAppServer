const mysql = require("mysql");

const { testCreationValidation } = require("../schema/schema");
const { read } = require('../utils/secrets');

const db = mysql.createConnection({
    host: read('mysql-host'),
    user: read('mysql-user'),
    password: read('mysql-password'),
    database: read('mysql-database')
});

// createRoom
exports.createTest = (req, res) => {
    if (testCreationValidation(req.body).error) {
        res.status(400).send(`Schema error: ${testCreationValidation(req.body).error}`);
        return;
    }
    const { name, difficulty, time, chapters } = req.body;
    
    //TODO generate questions here
    const questions = "[]";

    db.query("INSERT INTO tests SET ?", {
        name: name,
        userId: req.user._id, 
        createdOn: new Date().toISOString().split('T')[0],
        finishedOn: null,
        score: 0,
        questions: questions,
        chapters: chapters,
        time: time,
        difficulty: difficulty
    }, (error, results) => {
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