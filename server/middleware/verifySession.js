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
        console.log(activeSession)
        req.user = activeSession;
        console.log("active session user !!!", req.user);
        console.log("active session !!!", activeSession);
        next();
    } catch (err) {
        res.status(400).json({
            loggedIn:false
        })
    }
}