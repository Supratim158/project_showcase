const mongoose = require('mongoose');
const db = require('../config/db');
const UserModel = require('../model/user_model');

const { Schema } = mongoose;

const formSchema = new Schema({
    userId: {
        type: Schema.Types.ObjectId,
        ref: UserModel.modelName
    },
    title:{
        type:String,
        required:true,
    },
    description:{
        type:String,
        required:true,
    },
    link:{
        type:String,
        required:true
    },
    mntorname:{
        type:String,
        required:true
    },
    mmbrno:{
        type:String,
        required:true
    },
    mmbrname:{
        type:String,
        required:true
    },
});

const FormModel = db.model('form',formSchema);

module.exports = FormModel;