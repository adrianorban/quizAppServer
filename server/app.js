const express = require("express");
const mysql = require("mysql");
const cookieParser = require("cookie-parser");
const { read } = require("./utils/secrets");

const app = express();
console.log('mysql-host', read('mysql-host'));
console.log('mysql-user', read('mysql-user'));
console.log('mysql-password', read('mysql-password'));
console.log('mysql-database', read('mysql-database'));
const db = mysql.createConnection({
    host: read('mysql-host'),
    user: read('mysql-user'),
    password: read('mysql-password'),
    database: read('mysql-database'),
    port: read('mysql-port')
});

if (!process.env.NODE_ENV || process.env.NODE_ENV === 'local') {
    const cors = require("cors");
    const dotenv = require("dotenv");

    dotenv.config({
        path: "./.env"
    })

    //for CORS
    let corsOptions = {
        origin: process.env.WEB_APP_URL,
        credentials:  true
    }
    app.use(cors(corsOptions));
}

//middlewares
//for form
app.use(express.urlencoded({extended: false}));
//for json
app.use(express.json());
//for cookies
app.use(cookieParser());

//route middlewares
app.use('/api/auth/', require("./api/authPaths"));
app.use('/api/test/', require("./api/testPaths"));
app.use('/api/', require("./api/profilePaths"));

db.connect((error) => {
    if (error) {
        console.log(error);
    } else {
        console.log("sql connected")
    }
})

app.listen(5001, () => {
    console.log("Server running on 5001")
})