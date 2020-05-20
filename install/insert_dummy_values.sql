USE tryme;
INSERT INTO user VALUES (1 , "pegul", "22", "pegah", "soltani", "sdf" );
INSERT INTO user VALUES(2 ,"peg","123", "pegah", "sol" ,"email");
INSERT INTO candidate VALUES(2 ,NULL, 3.00, 2020, "Bilkent", "CS", 3000);
INSERT INTO admin VALUES (1);
INSERT INTO quiz VALUES(400, 60, "quiz1" ,"Database", 2 , 1);
INSERT INTO question VALUES (9, "Question #1" , "multiple choice" , "A" , 1);
INSERT INTO question VALUES (99, "Question #2" , "multiple choice" , "A" , 1);

INSERT INTO choice_options VALUES (80 , "A" , 9);
INSERT INTO choice_options VALUES (81 , "B" , 9);
INSERT INTO choice_options VALUES (82 , "C" , 9);

INSERT INTO choice_options VALUES (83 , "A2" , 99);
INSERT INTO choice_options VALUES (84 , "B2" , 99);
INSERT INTO choice_options VALUES (85 , "C2" , 99);

INSERT INTO quiz_contains_choice_options_and_questions(400, 9, 80 , 1);
INSERT INTO quiz_contains_choice_options_and_questions(400, 9, 81 , 1);
INSERT INTO quiz_contains_choice_options_and_questions(400, 9, 82 , 1);
INSERT INTO quiz_contains_choice_options_and_questions(400, 99, 83,  1);
INSERT INTO quiz_contains_choice_options_and_questions(400, 99, 84,  1);
INSERT INTO quiz_contains_choice_options_and_questions(400, 99, 85,  1);


INSERT INTO tryme.`user` (userID,username,password,name,surname,email) VALUES (1,'c-madina','madina','c-madina','madina','c-madina@gmail.com');
INSERT INTO tryme.`user` (userID,username,password,name,surname,email) VALUES (2,'r-ibrahim','ibrahim','r-shadya','ibrahim','r-ibrahim@gmail.com');
INSERT INTO tryme.`user` (userID,username,password,name,surname,email) VALUES (3,'a-ruslan','ruslan','a-damaris','ruslan','a-ruslan@gmail.com');
INSERT INTO tryme.`user` (userID,username,password,name,surname,email) VALUES (4,'c-southern','southern','c-neive','southern','c-southern@gmail.com');
INSERT INTO tryme.`user` (userID,username,password,name,surname,email) VALUES (5,'r-kendall','kendall','r-eliot','kendall','r-kendall@gmail.com');
INSERT INTO tryme.`user` (userID,username,password,name,surname,email) VALUES (6,'a-sweet','sweet','a-yusuf','sweet','a-sweet@gmail.com');
INSERT INTO tryme.`user` (userID,username,password,name,surname,email) VALUES (7,'c-page','page','c-nadir','page','c-page@gmail.com');
INSERT INTO tryme.`user` (userID,username,password,name,surname,email) VALUES (8,'c-schmitt','schmitt','c-dainton','schmitt','c-schmitt@gmail.com');
INSERT INTO tryme.`user` (userID,username,password,name,surname,email) VALUES (9,'c-lancaster','lancaster','c-asim','lancaster','c-lancaster@gmail.com');
INSERT INTO tryme.`user` (userID,username,password,name,surname,email) VALUES (10,'c-chadwick','chadwick','c-kaleem','chadwick','c-chadwick@gmail.com');
INSERT INTO tryme.`user` (userID,username,password,name,surname,email) VALUES (11,'c-taylor','taylor','c-beverly','taylor','c-taylor@gmail.com');

INSERT INTO tryme.admin (adminID) VALUES (3);
INSERT INTO tryme.admin (adminID) VALUES (6);

INSERT INTO tryme.candidate (candidateID,cvfile,gpa,graduation_year,college_name,college_major,min_req_salary) VALUES (1,NULL,3,2020,'Bilkent University','Computer Science',10000);
INSERT INTO tryme.candidate (candidateID,cvfile,gpa,graduation_year,college_name,college_major,min_req_salary) VALUES (4,NULL,2,2017,'ODTU','Computer Engineering',15000);
INSERT INTO tryme.candidate (candidateID,cvfile,gpa,graduation_year,college_name,college_major,min_req_salary) VALUES (7,NULL,2,2000,'Bilkent University','Computer Engineering',7000);
INSERT INTO tryme.candidate (candidateID,cvfile,gpa,graduation_year,college_name,college_major,min_req_salary) VALUES (8,NULL,4,2010,'ODTU','Computer Engineering',22000);
INSERT INTO tryme.candidate (candidateID,cvfile,gpa,graduation_year,college_name,college_major,min_req_salary) VALUES (9,NULL,3,2005,'Koc University','Computer Engineering',7000);
INSERT INTO tryme.candidate (candidateID,cvfile,gpa,graduation_year,college_name,college_major,min_req_salary) VALUES (10,NULL,2,2010,'Ankara University','Computer Engineering',7000);
INSERT INTO tryme.candidate (candidateID,cvfile,gpa,graduation_year,college_name,college_major,min_req_salary) VALUES (11,NULL,4,2023,'Ankara University','Computer Engineering',7000);

INSERT INTO tryme.representative (representativeID,`position`) VALUES (2,'Lead Developer');
INSERT INTO tryme.representative (representativeID,`position`) VALUES (5,'CEO');

INSERT INTO tryme.company (companyID,company_name,company_address,company_web_address,company_industry) VALUES (1,'Alphabet Inc.','SF','abc.xyz','Technology');

INSERT INTO tryme.subject_field (subjectID,subject_name) VALUES (1,'Programming');
INSERT INTO tryme.subject_field (subjectID,subject_name) VALUES (2,'Databases');
INSERT INTO tryme.subject_field (subjectID,subject_name) VALUES (3,'Version Control');

INSERT INTO tryme.company_recommends_candidate (companyID,candidateID,recom_letter) VALUES (1,1,NULL);

INSERT INTO tryme.representative_sends_request_to_candidate (candidateID,representativeID,content,status,deadline) VALUES (1,2,'Please solve the quiz attached','Taken','2020-05-18 13:30:00.0');
INSERT INTO tryme.representative_sends_request_to_candidate (candidateID,representativeID,content,status,deadline) VALUES (4,5,'I am sending you a quiz','Waiting','2020-05-30 16:55:41.0');
INSERT INTO tryme.representative_sends_request_to_candidate (candidateID,representativeID,content,status,deadline) VALUES (7,5,'I am sending you a quiz','Taken','2020-05-30 16:55:41.0');
INSERT INTO tryme.representative_sends_request_to_candidate (candidateID,representativeID,content,status,deadline) VALUES (10,5,'I am sending you a quiz','Waiting','2020-05-30 16:55:41.0');

INSERT INTO tryme.quiz (quizID,max_time_const,quiz_name,quiz_subject,number_of_questions,adminID) VALUES (1,60,'Template Quiz 1','Programming',5,3);
INSERT INTO tryme.quiz (quizID,max_time_const,quiz_name,quiz_subject,number_of_questions,adminID) VALUES (2,60,'Template Quiz 2','Programming',3,6);
INSERT INTO tryme.quiz (quizID,max_time_const,quiz_name,quiz_subject,number_of_questions,adminID) VALUES (3,60,'Template Quiz 3','Programming',3,3);
INSERT INTO tryme.quiz (quizID,max_time_const,quiz_name,quiz_subject,number_of_questions,adminID) VALUES (4,10,'Template Quiz 4','Databases',10,3);
INSERT INTO tryme.quiz (quizID,max_time_const,quiz_name,quiz_subject,number_of_questions,adminID) VALUES (5,50,'Template Quiz 5','Databases',5,6);
INSERT INTO tryme.quiz (quizID,max_time_const,quiz_name,quiz_subject,number_of_questions,adminID) VALUES (6,120,'Template Quiz 6','Version Control',1,3);

INSERT INTO tryme.admin_edits_quiz (adminID,quizID) VALUES (3,1);
INSERT INTO tryme.admin_edits_quiz (adminID,quizID) VALUES (6,2);
INSERT INTO tryme.admin_edits_quiz (adminID,quizID) VALUES (3,3);
INSERT INTO tryme.admin_edits_quiz (adminID,quizID) VALUES (3,4);
INSERT INTO tryme.admin_edits_quiz (adminID,quizID) VALUES (6,5);
INSERT INTO tryme.admin_edits_quiz (adminID,quizID) VALUES (3,6);

INSERT INTO tryme.trial (candidateID,trialID,start_date_time,end_date_time,answer,quizID) VALUES (1,1,'2020-05-18 12:30:00.0','2020-05-18 13:30:00.0','Declined',1);
INSERT INTO tryme.trial (candidateID,trialID,start_date_time,end_date_time,answer,quizID) VALUES (1,2,'2020-05-19 12:30:00.0','2020-05-19 13:30:00.0','Accepted',1);
INSERT INTO tryme.trial (candidateID,trialID,start_date_time,end_date_time,answer,quizID) VALUES (7,3,'2020-05-18 15:30:00.0','2020-05-18 16:00:00.0','Accepted',2);

INSERT INTO tryme.question (questionID,question_text,question_type,correct_answer,adminID) VALUES (1,'Q 1 -  What is the output of the below code snippet?\n#include<stdio.h>\n\nmain()\n{\n   unsigned x = 5, y=&x, *p = y+0;\n\n\n   printf("%u",*p);\n}','Multiple Choice','D',3);
INSERT INTO tryme.question (questionID,question_text,question_type,correct_answer,adminID) VALUES (2,'Q 2 - What is the value of ‘y’ for the following code snippet?\n\n#include<stdio.h>\n\nmain()\n{\n   int x = 1;\n\n   float y = x>>2;\n\n   printf( "%f", y );\n}','Multiple Choice','C',3);
INSERT INTO tryme.question (questionID,question_text,question_type,correct_answer,adminID) VALUES (3,'Q 3 - Identify the incorrect file opening mode from the following.','Multiple Choice','C',3);
INSERT INTO tryme.question (questionID,question_text,question_type,correct_answer,adminID) VALUES (4,'Q 4 - An exception is __','Multiple Choice','A',3);
INSERT INTO tryme.question (questionID,question_text,question_type,correct_answer,adminID) VALUES (5,'Q 5 - What is the output of the following statement?','Multiple Choice','B',3);
INSERT INTO tryme.question (questionID,question_text,question_type,correct_answer,adminID) VALUES (6,'Q 1 - How to round-off a value “5.77” to 6.0?','Multiple Choice','A',6);
INSERT INTO tryme.question (questionID,question_text,question_type,correct_answer,adminID) VALUES (7,'Q 2 - Similarity between a structure, union and enumeration,','Multiple Choice','B',6);
INSERT INTO tryme.question (questionID,question_text,question_type,correct_answer,adminID) VALUES (8,'Q 3 - The return keyword used to transfer control from a function back to the calling function.','Multiple Choice','A',6);

INSERT INTO tryme.question_has_subject_field (subjectID,questionID) VALUES (1,1);
INSERT INTO tryme.question_has_subject_field (subjectID,questionID) VALUES (1,2);
INSERT INTO tryme.question_has_subject_field (subjectID,questionID) VALUES (1,3);
INSERT INTO tryme.question_has_subject_field (subjectID,questionID) VALUES (1,4);
INSERT INTO tryme.question_has_subject_field (subjectID,questionID) VALUES (1,5);
INSERT INTO tryme.question_has_subject_field (subjectID,questionID) VALUES (1,6);
INSERT INTO tryme.question_has_subject_field (subjectID,questionID) VALUES (1,7);
INSERT INTO tryme.question_has_subject_field (subjectID,questionID) VALUES (1,8);

INSERT INTO tryme.candidate_answers_question (candidateID,trialID,questionID,answer) VALUES (1,1,1,'D');
INSERT INTO tryme.candidate_answers_question (candidateID,trialID,questionID,answer) VALUES (1,2,1,'D');
INSERT INTO tryme.candidate_answers_question (candidateID,trialID,questionID,answer) VALUES (1,1,2,'B');
INSERT INTO tryme.candidate_answers_question (candidateID,trialID,questionID,answer) VALUES (1,2,2,'C');
INSERT INTO tryme.candidate_answers_question (candidateID,trialID,questionID,answer) VALUES (1,1,3,'C');
INSERT INTO tryme.candidate_answers_question (candidateID,trialID,questionID,answer) VALUES (1,2,3,'C');
INSERT INTO tryme.candidate_answers_question (candidateID,trialID,questionID,answer) VALUES (1,1,4,'B');
INSERT INTO tryme.candidate_answers_question (candidateID,trialID,questionID,answer) VALUES (1,2,4,'A');
INSERT INTO tryme.candidate_answers_question (candidateID,trialID,questionID,answer) VALUES (1,1,5,'C');
INSERT INTO tryme.candidate_answers_question (candidateID,trialID,questionID,answer) VALUES (1,2,5,'C');
INSERT INTO tryme.candidate_answers_question (candidateID,trialID,questionID,answer) VALUES (7,3,6,'A');
INSERT INTO tryme.candidate_answers_question (candidateID,trialID,questionID,answer) VALUES (7,3,7,'B');
INSERT INTO tryme.candidate_answers_question (candidateID,trialID,questionID,answer) VALUES (7,3,8,'A');

INSERT INTO tryme.choice_options (choiceID,content,questionID) VALUES (1,'A - Address of x',1);
INSERT INTO tryme.choice_options (choiceID,content,questionID) VALUES (2,'B - Address of y',1);
INSERT INTO tryme.choice_options (choiceID,content,questionID) VALUES (3,'C - Address of p',1);
INSERT INTO tryme.choice_options (choiceID,content,questionID) VALUES (4,'D - 5',1);
INSERT INTO tryme.choice_options (choiceID,content,questionID) VALUES (5,'A - 4',2);
INSERT INTO tryme.choice_options (choiceID,content,questionID) VALUES (6,'B - 0.5',2);
INSERT INTO tryme.choice_options (choiceID,content,questionID) VALUES (7,'C - 0',2);
INSERT INTO tryme.choice_options (choiceID,content,questionID) VALUES (8,'D - 1',2);
INSERT INTO tryme.choice_options (choiceID,content,questionID) VALUES (9,'A - r',3);
INSERT INTO tryme.choice_options (choiceID,content,questionID) VALUES (10,'B - w',3);
INSERT INTO tryme.choice_options (choiceID,content,questionID) VALUES (11,'C - x',3);
INSERT INTO tryme.choice_options (choiceID,content,questionID) VALUES (12,'D - a',3);
INSERT INTO tryme.choice_options (choiceID,content,questionID) VALUES (13,'A - Runtime error',4);
INSERT INTO tryme.choice_options (choiceID,content,questionID) VALUES (14,'B - Compile time error',4);
INSERT INTO tryme.choice_options (choiceID,content,questionID) VALUES (15,'C - Logical error',4);
INSERT INTO tryme.choice_options (choiceID,content,questionID) VALUES (16,'D - None of the above',4);
INSERT INTO tryme.choice_options (choiceID,content,questionID) VALUES (17,'A - 0',5);
INSERT INTO tryme.choice_options (choiceID,content,questionID) VALUES (18,'B - 1',5);
INSERT INTO tryme.choice_options (choiceID,content,questionID) VALUES (19,'C - False',5);
INSERT INTO tryme.choice_options (choiceID,content,questionID) VALUES (20,'D - True',5);
INSERT INTO tryme.choice_options (choiceID,content,questionID) VALUES (21,'A - ceil(5.77)',6);
INSERT INTO tryme.choice_options (choiceID,content,questionID) VALUES (22,'B - round-off(5.77)',6);
INSERT INTO tryme.choice_options (choiceID,content,questionID) VALUES (23,'C - round-up(5.77)',6);
INSERT INTO tryme.choice_options (choiceID,content,questionID) VALUES (24,'D - floor(5.77)',6);
INSERT INTO tryme.choice_options (choiceID,content,questionID) VALUES (25,'A - All are helpful in defining new variables',7);
INSERT INTO tryme.choice_options (choiceID,content,questionID) VALUES (26,'B - All are helpful in defining new data types',7);
INSERT INTO tryme.choice_options (choiceID,content,questionID) VALUES (27,'C - All are helpful in defining new pointers',7);
INSERT INTO tryme.choice_options (choiceID,content,questionID) VALUES (28,'D - All are helpful in defining new structures',7);
INSERT INTO tryme.choice_options (choiceID,content,questionID) VALUES (29,'A - Yes',8);
INSERT INTO tryme.choice_options (choiceID,content,questionID) VALUES (30,'B - Switch',8);
INSERT INTO tryme.choice_options (choiceID,content,questionID) VALUES (31,'C - go back',8);
INSERT INTO tryme.choice_options (choiceID,content,questionID) VALUES (32,'D - goto',8);

INSERT INTO tryme.quiz_contains_choice_options_and_questions (quizID,questionID,choiceID,question_order) VALUES (1,1,1,1);
INSERT INTO tryme.quiz_contains_choice_options_and_questions (quizID,questionID,choiceID,question_order) VALUES (1,2,2,2);
INSERT INTO tryme.quiz_contains_choice_options_and_questions (quizID,questionID,choiceID,question_order) VALUES (1,3,3,3);
INSERT INTO tryme.quiz_contains_choice_options_and_questions (quizID,questionID,choiceID,question_order) VALUES (1,4,4,4);
INSERT INTO tryme.quiz_contains_choice_options_and_questions (quizID,questionID,choiceID,question_order) VALUES (1,5,5,5);
INSERT INTO tryme.quiz_contains_choice_options_and_questions (quizID,questionID,choiceID,question_order) VALUES (2,6,6,1);
INSERT INTO tryme.quiz_contains_choice_options_and_questions (quizID,questionID,choiceID,question_order) VALUES (2,7,7,2);
INSERT INTO tryme.quiz_contains_choice_options_and_questions (quizID,questionID,choiceID,question_order) VALUES (2,8,8,3);