const mysql = require('mysql');
const bodyParser = require('body-parser');
const express = require('express'); // imports the library express
// const cors = require('cors');

const con = mysql.createConnection({
    host: "localhost",
    user: "tryme",
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
                        if (err) throw err;
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
    const candidate_query_string = "INSERT INTO representative VALUES(?, ?)";
    con.query(
        user_query_string,
        [req.body.userID, req.body.username, req.body.password, req.body.name, req.body.surname, req.body.email],
        function (err, result) {
            if (err) throw err;
            con.query(
                candidate_query_string,
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
app.get('/list_quizzes_candidates_results', function(req, res){
    const list_quizzes_candidates_results = "SELECT u.name , q.quiz_name , total_score, t.trialID FROM user u INNER JOIN candidate c INNER JOIN quiz q INNER JOIN trial t INNER JOIN (SELECT caq.candidateID , caq.trialID , sum(caq.answer = qn.correct_answer) as total_score FROM candidate_answers_question caq INNER JOIN question qn ON caq.questionID = qn.questionID GROUP BY caq.candidateID , caq.trialID) as total_score_table ON u.userID = c.candidateID AND t.quizID = q.quizID AND c.candidateID = t.candidateID AND total_score_table.trialID = t.trialID AND total_score_table.candidateID = c.candidateID;";
    con.query(list_quizzes_candidates_results, function (err, result) {
        if (err) throw err;
        res.send(result);
    });
});

/*
* Representatives can send interview requests to developers regarding their results
on certain quizzes.
* */
app.post('/send_request_to_candidate', function(req, res){
    const send_request_to_candidate = "INSERT INTO representative_sends_request_to_candidate VALUES(?, ?, ?, ?, ?);";
    con.query(send_request_to_candidate,[req.body.candidateID, req.body.representativeID, req.body.content, req.body.status, req.body.deadline], function (err, result) {
        if (err) throw err;
        res.send();
    });
});

/*
* Developers can accept or decline the request. Each request has a status of value
among sent, accepted, declined.
* */
app.post('/candidate_responds', function(req, res){
    const candidate_respond = "UPDATE representative_sends_request_to_candidate SET status = ? WHERE candidateID = ? AND representativeID = ?;";
    con.query(candidate_respond,[req.body.status, req.body.candidateID,req.body.representativeID], function (err, result) {
        if (err) throw err;
        res.send();
    });
});
/*
He/She can specify the name of the quiz, its subject, time limit, number of
questions and etc.
For each quiz, questions have to be prepared along with their options and
correct answer.
Each question can belong to multiple subjects.
*/
app.post('/create_quiz', function(req, res){
   // first creat a quiz
    const create_quiz = "INSERT INTO quiz VALUES(?, ?, ?, ?, ?, ?);";
    const create_question = "INSERT INTO question VALUES (?, ?, ?, ?, ?);";
    const create_choice = "INSERT INTO choice_options VALUES (? , ?, ?);";
    const quiz_contains_choice_options_and_questions = "INSERT INTO quiz_contains_choice_options_and_questions(?, ?, ?, ?);";
        con.query(create_quiz,[req.body.quizID, req.body.max_time_const, req.body.quiz_name, req.body.quiz_subject, req.body.number_of_questions, req.body.adminID], function (err, result) {
        if (err) throw err;
        con.query(create_question, [req.body.questionID, req.body.question_text, req.body.question_type, req.body.correct_answer, req.body.adminID], function (err, result) {
            if (err) throw err;
            con.query(create_choice, [req.body.choiceID, req.body.content, req.body.questionID],function (err, result) {
                if (err) throw err;
                con.query(quiz_contains_choice_options_and_questions, [req.body.quizID, req.body.questionID, req.body.choiceID, req.body.question_order], function () {
                    if (err) throw err;
                });
            });
        });
        res.send();
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
