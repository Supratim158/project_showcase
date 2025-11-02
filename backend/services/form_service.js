const FormModel = require("../model/form_model");

class FormServices{
    static async createForm(userId,title,description,link,mntorname,mmbrno,mmbrname){
        const createForm = new FormModel({userId,title,description,link,mntorname,mmbrno,mmbrname});
        return await createForm.save();
    }
}

module.exports = FormServices;