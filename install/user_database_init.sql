-- sign in with root user sudo mysql -u root -p
-- copy paste the contents
-- sign out and signin with mysql -u tryme -D tryme -p
CREATE USER 'tryme'@'localhost' IDENTIFIED WITH mysql_native_password BY '12344321_aA!';
GRANT ALL PRIVILEGES ON tryme.* TO 'tryme'@'localhost';