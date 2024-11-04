const express = require("express");
const authController = require("../controllers/auth");
const activeSession = require("../middleware/verifySession");

const router = express.Router();

router.post("/register", authController.register);
router.post("/login", authController.login);
router.get("/user-details", activeSession, authController.userDetails);
router.post("/checkPass", authController.checkPass);

module.exports = router;