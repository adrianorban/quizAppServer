const express = require("express");
const router = express.Router();

const activeSession = require("../middleware/verifySession");

router.get("/profile", activeSession, (req, res) => {
 res.status(200).json({
        loggedIn: true,
        id: req.user._id
    });
});
module.exports = router;