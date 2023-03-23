const express = require('express')
const detenv = require('dotenv').config();
const port = process.env.PORT || 5000;

const app = express();

//Body Parser
app.use(express.json());
app.use(express.urlencoded({extended: false}));

app.use('/openai', require('./routes/openaiRoutes'));

app.listen(port, ()=> console.log(`Started Listenning on port ${port}`));