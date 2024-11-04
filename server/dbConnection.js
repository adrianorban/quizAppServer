const mysql = require("mysql2");

const { read } = require("./utils/secrets");
console.log("-------createPool-----------")
const connection = mysql.createPool({
    host: read('mysql-host').toString().trim(),
    user: read('mysql-user').toString().trim(),
    password: read('mysql-password').toString().trim(),
    database: read('mysql-database').toString().trim(),
    port: read('mysql-port').toString().trim(),
    waitForConnections: true,
    connectionLimit: 10,
    maxIdle: 10,
    idleTimeout: 3000,
    queueLimit: 0
});

exports.connection = connection;