// var method = "POST";
var url = "http://localhost:3000/candidate_signup";
var username = "daswolfenblut28";
var password = "1234567xyz";
var name = "DenizhaNN";
var surname = "Soydass";
var email = "dsoydas";
var gpa = 3.7;
var graduation_year = 2021;
var college_name = "ID Bilkent";
var college_major = "CompSc";
var min_req_salary = 6000;
var userID = 28;
function bclick() {
    // var xmlHttp = new XMLHttpRequest();
    // xmlHttp.onreadystatechange = function() {
    //     if (xmlHttp.readyState == 4 && xmlHttp.status == 200)
    //         console.log(xmlHttp.responseText);
    // };
    //xmlHttp.open("POST", "127.0.0.1:3000/candidate_signup", true); // true for asynchronous
    //******************* */
    
    var request = new XMLHttpRequest();
      
      //request.open('POST', url, true);
      //request.onreadystatechange = handler;
      request.onreadystatechange = function () { 
        if (request.readyState === 4 && request.status === 200) {
          //var json = JSON.parse(request.responseText);
          console.log("Helloo World!!");
        }
      };
      request.open("POST", url, true);
      //request.withCredentials = true;
      request.setRequestHeader("Content-Type", "application/json");

      var data = JSON.stringify({username : username ,
        password : password,
        name : name,
        surname : surname,
        email : email,
        gpa: gpa,
        graduation_year: graduation_year,
        college_name : college_name,
        college_major : college_major,
        min_req_salary : min_req_salary,
        userID : userID});
      request.send(data);
    
}