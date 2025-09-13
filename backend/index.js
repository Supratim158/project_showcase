const app = require('./app');
const connectDB = require("./config/db");
const UserModel = require("./model/user_model");

const port = 3000;

app.get('/',(req, res)=>{
    res.send("hiu");
});

app.listen(port,()=>{
    console.log(`Server Running on port http://localhost:${port}`);
});