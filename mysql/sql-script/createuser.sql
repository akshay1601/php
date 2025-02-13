CREATE DATABASE login_system;
USE login_system;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL
);

-- Insert a sample user (username: admin, password: admin123)
INSERT INTO users (username, password) VALUES ('akki', '$6$GHqYc96XStM30Rry$MppMl29Nvl0G/vL.I6Xv7fx.R7fKSZALmFdeeDHVZaMcEpie0y78JCWwMeDl57ZwQ7jv20KmWOwaOvGlngqww1');

-- docker stop db php-apache
-- docker rm -f php-apache  db
-- docker rmi -f akshayv1601/php:3 akshayv1601/mysql:3
-- sudo rm -rf php/ server3-config.sh 
-- sudo rm -rf /var/lib/mysql/