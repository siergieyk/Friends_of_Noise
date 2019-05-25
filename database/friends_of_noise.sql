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


CREATE TABLE guestcheckout(
transactionID INT UNIQUE AUTO_INCREMENT,
#UID VARCHAR(100) PRIMARY KEY,
First_Name VARCHAR(45) NOT NULL,
Last_Name VARCHAR(45) NOT NULL,
Email VARCHAR(100) NOT NULL,
Address VARCHAR(60) NOT NULL,
AddressOptional VARCHAR(60) DEFAULT NULL,
City VARCHAR(45) NOT NULL,
State VARCHAR(45) NOT NULL,
Zip VARCHAR(10) NOT NULL);


CREATE TABLE `events`(
eventID INT UNIQUE AUTO_INCREMENT,
EventName VARCHAR(60) DEFAULT NULL,
EventDate VARCHAR(20) NOT NULL,
numberOfspots VARCHAR(45) NOT NULL,
numberOfAvailableSpots VARCHAR(45) NOT NULL,
Address VARCHAR(60) DEFAULT NULL,
AddressOptional VARCHAR(60) DEFAULT NULL,
City VARCHAR(45) DEFAULT NULL,
State VARCHAR(45) DEFAULT NULL,
Zip VARCHAR(10) DEFAULT NULL);


=============================================================================================================================================================================

INSERT INTO members VALUES(default, 'goober@test.com', 'goo','ber','goober','password', 'over', '206-206-2060','123 Example st','Seattle','WA','10005', 'YES', '2019-05-20');

INSERT INTO `events` VALUES(default, 'Night of Music', '2020-04-04','100','43','1st ave','','Seattle','WA','10005');
INSERT INTO `events` VALUES(default, 'Poetry', '2020-04-06','300','56','4th ave','','Seattle','WA','10005');
INSERT INTO `events` VALUES(default, 'Rock and Roll Night', '2020-06-04','2540','1911','5th ave','','Seattle','WA','10005');

