const express = require('express');
const body_parser = require('body-parser');
const cors = require('cors'); // Add CORS package
const userRouter = require('./routes/user.routes');

const app = express();
app.use(cors());

app.use(body_parser.json());

app.use('/', userRouter);

module.exports = app;