// db.js
const mongoose = require("mongoose");
require("dotenv").config(); // Load .env file

const connection = mongoose
  .createConnection(process.env.MONGO_URI, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
  })
  .on("open", () => {
    console.log("MongoDB Connected");
  })
  .on("error", (err) => {
    console.error("MongoDB Connection Failed:", err.message);
  });

module.exports = connection;
