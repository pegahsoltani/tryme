const mysql = require('mysql');
const express = require('express'); // imports the library express

const con = mysql.createConnection({
    host: "localhost",
    user: "tryme_test_user",
    password: "tOOl_1996_"
}); // connecting my database to the server

const app = express(); // calls a function express in express server application here

app.get('/', function (req, res) {
    res.send('Hell World.');
}); // initializes the server and the methods

app.listen(3000, function () {
    console.log('Start tryme!');
    con.connect(function(err) {
        if (err) throw err;
        console.log("Connected!");
    });
}); // starts the server is the function that prints