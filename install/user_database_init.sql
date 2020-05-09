-- How the new user is created
CREATE USER 'tryme_test_user'@'localhost' IDENTIFIED BY 'tOOl_1996_';
GRANT ALL PRIVILEGES ON *.* TO 'tryme_test_user'@'localhost';
CREATE DATABASE tryme;