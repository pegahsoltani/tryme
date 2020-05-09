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