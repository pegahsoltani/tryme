import { sendRequest } from './request-sender.js';

window.onload = function(){
    sendRequest("GET", "/list_quizzes_candidates_results", null, function(response){
        const result = JSON.parse(response);
        const result_table = document.getElementById("result_table");
        for( let i=0 ; i < result.length ; i++){
            let tr = document.createElement("tr");
            let td = document.createElement("td");
            let text_node = document.createTextNode(result[i].name);
            td.appendChild(text_node);
            tr.appendChild(td);

            td = document.createElement("td");
            text_node = document.createTextNode(result[i].quiz_name);
            td.appendChild(text_node);
            tr.appendChild(td);

            td = document.createElement("td");
            text_node = document.createTextNode(result[i].total_score);
            td.appendChild(text_node);
            tr.appendChild(td);

            td = document.createElement("td");
            text_node = document.createTextNode(result[i].trialID);
            td.appendChild(text_node);
            tr.appendChild(td);
            result_table.appendChild(tr);
        }

    });
};

