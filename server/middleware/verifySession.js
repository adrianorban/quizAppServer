const jwt = require("jsonwebtoken");
const { read } = require("../utils/secrets");

module.exports = function(req, res, next) {
    const cookies = req.cookies;
    const token = cookies.authToken;

    console.log("Verify session...")
    if (!token) {
        console.log("Missing token...")
        return  res.status(401).json({
            loggedIn:false
        })
    }

    try{
        const activeSession = jwt.verify(token, read('jwt-token'));
        req.user = activeSession;
        console.log("active session !!!");
        next();
    } catch (err) {
        res.status(400).json({
            loggedIn:false
        })
    }
}