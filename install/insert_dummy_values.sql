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
