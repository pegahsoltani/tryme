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