CREATE TABLE token_list(
	userID INT,
    token VARCHAR(32),
	FOREIGN KEY (userID) REFERENCES user(userID),
    PRIMARY KEY (userID,token)
);