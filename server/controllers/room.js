const mysql = require("mysql");

const { roomCreationValidation } = require("../schema/schema");
const { read } = require('../utils/secrets');

const db = mysql.createConnection({
    host: read('mysql-host'),
    user: read('mysql-user'),
    password: read('mysql-password'),
    database: read('mysql-database')
});

exports.createRoom = (req, res) => {
    if (roomCreationValidation(req.body).error) {
        res.status(400).send(`Schema error: ${roomCreationValidation(req.body).error}`);
        return;
    }
    const { name, game, hostAccount, roomSlots, slotPrice } = req.body;

    db.query("INSERT INTO rooms SET ?", {
        name: name, 
        game: game, 
        hostAccount: hostAccount,
        roomSlots: roomSlots,
        slotPrice: slotPrice
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