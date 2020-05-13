const express = require('express'); // imports the library express

const app = express(); // calls a function express in express server application here

app.get('/', function (req, res) {
    res.send('Hell World.');
}); // initializes the server and the methods

app.listen(3000, function () {
    console.log('Start tryme!');
}); // starts the server is the function that prints