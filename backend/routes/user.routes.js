const router = require("express").Router();
const UserController = require("../controller/user.controller");
const authMiddleware = require("../middleware/auth");

router.post("/registration", UserController.register);
router.post("/login", UserController.login);

// 🔒 Protected route
router.get("/profile", authMiddleware, UserController.getProfile);

module.exports = router;
