const mysql = require('mysql');
const bodyParser = require('body-parser');
const express = require('express'); // imports the library express

const con = mysql.createConnection({
    host: "localhost",
    user: "tryme_test_user",
    password: "tOOl_1996_",
    database: "tryme"
}); // connecting my database to the server

const app = express(); // calls a function express in express server application here
app.use(bodyParser.json());

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
                        if (err) throw err;
                        res.send();
                    }
                );
        // console.log("Result: " + result); // shows the message on terminal
    }); // sending the quesries to the database
});
// sign up as representative
// sign up as admin

// sign in functions
app.post('/candidate_signin', function(req, res){
    const candidate_signin = "SELECT * FROM user u INNER JOIN candidate c ON u.userID = c.candidateID WHERE u.username = ? AND u.password = ?";
    con.query(candidate_signin,[req.body.username, req.body.password], function (err, result) {
        if (err) throw err;
        res.send(result);
    });
});


// first create a user, then make it one of candidate or admin or representative
app.listen(3000, function () {
    console.log('Start tryme!');
    con.connect(function(err) {
        if (err) throw err;
        console.log("Connected!");
    });
}); // starts the server is the function that prints
