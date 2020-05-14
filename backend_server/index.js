const mysql = require('mysql');
const express = require('express'); // imports the library express

const con = mysql.createConnection({
    host: "localhost",
    user: "tryme_test_user",
    password: "tOOl_1996_",
    database: "tryme"
}); // connecting my database to the server

const app = express(); // calls a function express in express server application here

app.get('/', function (req, res) {
    res.send('Hell World.');
}); // initializes the server and the methods

// for each functionality create this with connection query
app.get('/list_users', function (req, res) {
    const query_string = "SELECT * FROM user";
    con.query(query_string, function (err, result) {
        if (err) throw err;
        res.send(result);
       // console.log("Result: " + result); // shows the message on terminal
    }); // sending the quesries to the database
});

// lists all the quizzes
app.get('/list_quizzes', function (req, res) {
    const query_string = "SELECT * FROM quiz";
    con.query(query_string, function (err, result) {
        if (err) throw err;
        res.send(result);
        // console.log("Result: " + result); // shows the message on terminal
    }); // sending the quesries to the database
});

// finds name by specific id
app.get('/specific_user', function (req, res) {
    const query_string = "SELECT surname FROM user WHERE userID=?";
    con.query(query_string, [req.query.userID],function (err, result) {
        if (err) throw err;
        res.send(result);
        // console.log("Result: " + result); // shows the message on terminal
    }); // sending the quesries to the database
});

app.listen(3000, function () {
    console.log('Start tryme!');
    con.connect(function(err) {
        if (err) throw err;
        console.log("Connected!");
    });
}); // starts the server is the function that prints