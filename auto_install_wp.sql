CREATE USER 'wp_user'@'localhost' IDENTIFIED BY 'Password1234';
GRANT ALL ON wordpress_db.* TO 'wp_user'@'localhost' IDENTIFIED BY 'Password1234';
FLUSH PRIVILEGES;
Exit;
