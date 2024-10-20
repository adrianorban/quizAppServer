const express = require("express");
const roomController = require("../controllers/room");
const activeSession = require("../middleware/verifySession");

const router = express.Router();

router.post("/create", activeSession, roomController.createRoom);
//TODO possible updates situations: -> update prices(what if there are PLAYERS joined allready ?!), update slots(mistake), update game (mistake)
// router.post("/update", roomController.updateRoom); 
//TODO do we need to delete ?
// router.post("/delete", roomController.deleteRoom);
module.exports = router;