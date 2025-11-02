const FormServices = require("../services/form_service");

exports.createForm = async (req, res, next) => {
    try {
        const {userId,title,description,link,mntorname,mmbrno,mmbrname} = req.body;
        let form = await FormServices.createForm(userId,title,description,link,mntorname,mmbrno,mmbrname);
        res.json({status:true, success: form});
    } catch (error) {
        next(error);
    }
}