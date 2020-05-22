const BACKEND_SERVER_ADDRESS = "http://localhost:3000";

export function sendRequest(httpMethodName, endPointName, dataToSend, callback) {
    const request = new XMLHttpRequest();
    request.onreadystatechange = function () {
        if (request.readyState == 4 && request.status == 200) {
            console.log("Received successfull response");
            console.log("Response: " + request.responseText);
            callback(request.responseText);
        }
        else if (request.readyState == 4 && request.status != 200) {
            console.error("Received error response. Status: " + request.status);
            console.error("Error message: " + request.responseText);
        }
    }
    request.open(httpMethodName, BACKEND_SERVER_ADDRESS + endPointName, true);
    request.send(dataToSend);
}

function getHellWorld() {
    sendRequest("GET", "/give-me-hell-world", null, function(response) {
        const paragraphTag = document.getElementById("paste-response-here");
        paragraphTag.innerText = response;
    });
}