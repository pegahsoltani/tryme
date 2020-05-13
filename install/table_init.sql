CREATE TABLE user(
	userID INT PRIMARY KEY,
	username VARCHAR(32) NOT NULL,
	password VARCHAR(16) NOT NULL,
	name VARCHAR(32) NOT NULL,
	surname VARCHAR(32) NOT NULL,
	email VARCHAR(32) NOT NULL
);
CREATE TABLE admin(
	adminID int PRIMARY KEY,
	FOREIGN KEY (adminID) REFERENCES user(userID)
);
CREATE TABLE candidate(
	candidateID INT PRIMARY KEY,
	cvfile BLOB,
	gpa DOUBLE,
	graduation_year INT,
	college_name VARCHAR(32),
	college_major VARCHAR(32),
	min_req_salary INT,
	FOREIGN KEY (candidateID) REFERENCES user(userID)
);
CREATE TABLE representative(
	representativeID INT PRIMARY KEY,
	position VARCHAR(32),
	FOREIGN KEY (representativeID) REFERENCES user(userID)
);
CREATE TABLE company(
	companyID INT PRIMARY KEY,
	company_name VARCHAR(32),
	company_address VARCHAR(32),
	company_web_address VARCHAR(32),
	company_industry VARCHAR(32)
);
CREATE TABLE question(
	questionID INT PRIMARY KEY,
	question_text TEXT,
	question_type VARCHAR(16),
	correct_answer VARCHAR(16)
);
CREATE TABLE choice_options(
	choiceID INT PRIMARY KEY,
	content TEXT
);
CREATE TABLE quiz(
	quizID INT PRIMARY KEY,
	max_time_const INT,
	quiz_name VARCHAR(32)
);
CREATE TABLE trial(
	trialID INT PRIMARY KEY,
	start_date_time DATETIME,
	end_date_time DATETIME,
	answer VARCHAR(32)
);
CREATE TABLE recommends(
	companyID INT,
	candidateID INT,
	recom_letter BLOB,
	PRIMARY KEY (companyID, candidateID)
);
CREATE TABLE sends_request(
	candidateID INT,
	representativeID INT,
	content VARCHAR(32),
	status VARCHAR(16),
	PRIMARY KEY (candidateID, representativeID)
);
CREATE TABLE edits(
	adminID INT,
	quizID INT,
	PRIMARY KEY (adminID, quizID)
);
CREATE TABLE has(
	subjectID INT,
	questionID INT,
	PRIMARY KEY (subjectID, questionID)
);
CREATE TABLE answers(
	candidateID INT,
	questionID INT,
	answer TEXT,
	PRIMARY KEY (candidateID, questionID)
);
CREATE TABLE it_contains(
	quizID INT,
	questionID INT,
	choiceID INT,
	is_correct BOOL,
	question_order INT,
	PRIMARY KEY (choiceID, questionID, quizID)
);
