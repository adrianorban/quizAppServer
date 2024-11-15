const express = require("express");
const testController = require("../controllers/test");
const activeSession = require("../middleware/verifySession");

const router = express.Router();

router.post("/create", activeSession, testController.createTest);
router.get("/read", activeSession, testController.readTests);
//TODO possible updates situations: -> update prices(what if there are PLAYERS joined allready ?!), update slots(mistake), update game (mistake)
// router.post("/update", roomController.updateRoom); 
//TODO do we need to delete ?
// router.post("/delete", roomController.deleteRoom);
module.exports = router;