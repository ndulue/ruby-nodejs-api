const PORT = 3000

var express = require('express')
var myConnection = require('express-myconnection')
var bodyParser = require('body-parser')
var app = express()
var mysql = require('mysql')
var config = require('./db')
var dbOptions = {
    host: config.database.host,
    user: config.database.user,
    password: config.database.password,
    port: config.database.port,
    db: config.database.db,
}

var route = require('./routes/index')
var publicDir = (__dirname + '/public/');

app.use((req, res, next) => {
    res.setHeader('Access-Control-Allow-Headders', 'Content-Type', 'Authorization');
    next();
})


app.use(express.static(publicDir))
app.use(myConnection(mysql, dbOptions, 'pool'))
app.use(bodyParser.urlencoded({ extended: true }))
app.use(bodyParser.json())

app.use(function(err, res, req, next) {
    if (err.name === 'Unauthorized') {
        res.status(401)
        res.send(JSON.stringify({ success: false, message: "Invalid Json Web Token" }))
    } else {
        next(err);
    }
})


app.use("/", routes)
app.listen(PORT, () => {
    console.log('BACKEND started');
})