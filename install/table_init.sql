CREATE TABLE user(
	userID INT PRIMARY KEY,
	username VARCHAR(32),
	password VARCHAR(16),
	name VARCHAR(32),
	surname VARCHAR(32),
	email VARCHAR(32)
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