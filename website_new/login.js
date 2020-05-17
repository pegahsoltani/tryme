let un = "peg";
let pw = "123";
function bclick() {
    var xmlHttp = new XMLHttpRequest();
    xmlHttp.onreadystatechange = function() {
        if (xmlHttp.readyState == 4 && xmlHttp.status == 200)
            console.log(xmlHttp.responseText);
    };
    xmlHttp.open("POST", "localhost:3000/candidate_signin", true); // true for asynchronous
    xmlHttp.send({username:un , password:pw}); // the data to be sent to the server
}