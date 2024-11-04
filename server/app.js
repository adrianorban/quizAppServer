const express = require("express");
const mysql = require("mysql2");
const cookieParser = require("cookie-parser");

const app = express();

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

app.listen(5001, () => {
    console.log("Server running on 5001")
})