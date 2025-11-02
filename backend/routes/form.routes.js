const router = require("express").Router();
const FormController = require("../controller/form.controller");

router.post("/storeform", FormController.createForm);

module.exports = router;