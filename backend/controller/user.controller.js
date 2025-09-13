const UserService = require("../services/user.services");

exports.register = async(req, res, next)=>{
    try {
        const {name,email,password} = req.body;
        const successRes = await UserService.registerUser(name,email,password);
        res.json({status:true, success:"User registered successfully"});
    } catch (error) {
        throw error;
    }
}

exports.login = async(req, res, next)=>{
    try {
        const {email,password} = req.body;
        
        const user = await UserService.checkUser(email);

        if(!user){
            throw new Error("user don't exists");
        }

        const isMatch = await user.comparePassword(password);

        if(isMatch === false){
            throw new Error("password invalid");
        }

        let tokenData = {_id: user._id, email: user.email};

        const token = await UserService.generateToken(tokenData,"secretKey",'30d');

        res.status(200).json({status:true,token:token});

    } catch (error) {
        throw error;
    }
}

exports.getProfile = async (req, res) => {
  try {
    // user id was set by authMiddleware
    const user = await UserService.checkUser(req.user.email);

    if (!user) {
      return res.status(404).json({ status: false, message: "User not found" });
    }

    res.json({
      status: true,
      name: user.name,
      email: user.email,
    });
  } catch (error) {
    res.status(500).json({ status: false, message: error.message });
  }
};
