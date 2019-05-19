DROP DATABASE IF EXISTS FriendsOfNoise;

CREATE DATABASE FriendsOfNoise;

USE FriendsOfNoise;

CREATE TABLE members(
memberID INT UNIQUE AUTO_INCREMENT,
#UID VARCHAR(100) PRIMARY KEY,
Email VARCHAR(100) NOT NULL,
First_Name VARCHAR(45) NOT NULL,
Last_Name VARCHAR(45) NOT NULL,
User_Name VARCHAR(45) NOT NULL,
`password` VARCHAR(45) NOT NULL,
Age VARCHAR(10) NOT NULL,
Phone VARCHAR(12) DEFAULT NULL,
Address VARCHAR(60) DEFAULT NULL,
City VARCHAR(45) DEFAULT NULL,
State VARCHAR(45) DEFAULT NULL,
Zip VARCHAR(10) DEFAULT NULL,
Newsletter VARCHAR(10) DEFAULT NULL,
Date DATE NOT NULL);


====================================================

INSERT INTO members VALUES(default, 'goober@test.com', 'goo','ber','goober','password', 'over', '206-206-2060','123 Example st','Seattle','WA','10005', 'YES', '2019-05-20');