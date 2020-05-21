const mysql = require('mysql');
const bodyParser = require('body-parser');
const express = require('express'); // imports the library express
// const cors = require('cors');

const con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "1234ds4321aA!",
    database: "tryme"
}); // connecting my database to the server

const app = express(); // calls a function express in express server application here
app.use(bodyParser.json());
// app.use(function(req, res, next) {
//     res.header("Access-Control-Allow-Origin", "*");
//     res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
//     next();
// });
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

// sign up as candidate
app.post('/candidate_signup', function (req, res) { // post for server function
    const user_query_string = "INSERT INTO user VALUES(?, ?, ?, ?, ?, ?);";
    const candidate_query_string = "INSERT INTO candidate VALUES(?, NULL, ?, ?, ?, ?, ?)";
    con.query(
        user_query_string,
        [req.body.userID, req.body.username, req.body.password, req.body.name, req.body.surname, req.body.email],
        function (err, result) {
                if (err) throw err;
                con.query(
                    candidate_query_string,
                    [req.body.userID, req.body.gpa, req.body.graduation_year, req.body.college_name, req.body.college_major, req.body.min_req_salary],
                    function (err, result){
                        if (err){
                            res.status(500).send(err);
                            return;
                        }
                        res.send();
                    }
                );
        // console.log("Result: " + result); // shows the message on terminal
    }); // sending the queries to the database
});


// additional requirement, recommendatation
app.post('/recom_list', function (req, res) { // post for server function
    const recom_list_string = "SELECT c.company_name, r.recom_letter FROM company c INNER JOIN company_recommends_candidate r ON r.companyID = c.companyID WHERE r.candidateID = ?;";
    con.query(
        recom_list_string,
        [req.body.candidateID],
        function (err, result) {
            if (err) {
                res.status(500).send(err);
                return;
            }
            res.send(result);
            // console.log("Result: " + result); // shows the message on terminal
        }); // sending the quesries to the database
});
// sign up as representative
app.post('/representative_signup', function (req, res) { // post for server function
    const user_query_string = "INSERT INTO user VALUES(?, ?, ?, ?, ?, ?);";
    const representative_query_string = "INSERT INTO representative VALUES(?, ?);";
    con.query(
        user_query_string,
        [req.body.userID, req.body.username, req.body.password, req.body.name, req.body.surname, req.body.email],
        function (err, result) {
            if (err) throw err;
            con.query(
                representative_query_string,
                [req.body.userID, req.body.position],
                function (err, result){
                    if (err) {
                        res.status(500).send(err);
                        return;
                    }
                    res.send();
                }
            );
            // console.log("Result: " + result); // shows the message on terminal
        }); // sending the quesries to the database
});
// sign up as admin
app.post('/admin_signup', function (req, res) { // post for server function
    const user_query_string = "INSERT INTO user VALUES(?, ?, ?, ?, ?, ?);";
    const candidate_query_string = "INSERT INTO admin VALUES(?)";
    con.query(
        user_query_string,
        [req.body.userID, req.body.username, req.body.password, req.body.name, req.body.surname, req.body.email],
        function (err, result) {
            if (err) throw err;
            con.query(
                candidate_query_string,
                [req.body.userID],
                function (err, result){
                    if (err) throw err;
                    res.send();
                }
            );
            // console.log("Result: " + result); // shows the message on terminal
        }); // sending the quesries to the database
});
// sign in functions
// for candidate
app.post('/candidate_signin', function(req, res){
    const candidate_signin = "SELECT * FROM user u INNER JOIN candidate c ON u.userID = c.candidateID WHERE u.username = ? AND u.password = ?";
    con.query(candidate_signin,[req.body.username, req.body.password], function (err, result) {
        if (err) throw err;
        res.send(result);
    });
});

// signin for representative
app.post('/representative_signin', function(req, res){
    const candidate_signin = "SELECT * FROM user u INNER JOIN representative r ON u.userID = r.representativeID WHERE u.username = ? AND u.password = ?";
    con.query(candidate_signin,[req.body.username, req.body.password], function (err, result) {
        if (err) throw err;
        res.send(result);
    });
});
// signin for admin
app.post('/admin_signin', function(req, res){
    const admin_signin = "SELECT * FROM user u INNER JOIN admin a ON u.userID = a.adminID WHERE u.username = ? AND u.password = ?";
    con.query(admin_signin,[req.body.username, req.body.password], function (err, result) {
        if (err) throw err;
        res.send(result);
    });
});

/*
* Company representatives can list all quizzes and see results of developers taking
the quiz.
* */

/*
* Representatives can send interview requests to developers regarding their results
on certain quizzes.
* */

/*
* Each request has a deadline to monitor to accept and an associated job
description.
* */

/*
* Developers can accept or decline the request. Each request has a status of value
among sent, accepted, declined.
* */

// first create a user, then make it one of candidate or admin or representative
app.listen(3000, function () {
    console.log('Start tryme!');
    con.connect(function(err) {
        if (err) throw err;
        console.log("Connected!");
    });
}); // starts the server is the function that prints
