const UserModel = require('../model/user_model')
const jwt = require('jsonwebtoken');

class UserService{
    static async registerUser(name,email,password){
        try {
            const createUser = new UserModel({name,email,password});
            return await createUser.save();
        } catch (error) {
            throw error;
        }
    }
    static async checkUser(email){
        try {
            return await UserModel.findOne({email});
        } catch (error) {
            throw error;
        }
    }

    static async generateToken(tokenData,secretKey,jwt_expire){
        return jwt.sign(tokenData,secretKey,{expiresIn:jwt_expire});
    }
}

module.exports = UserService;