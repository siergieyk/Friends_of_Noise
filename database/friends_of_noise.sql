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
Date DATE NOT NULL,
CONSTRAINT members_memberID_PK PRIMARY KEY(memberID));


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
Zip VARCHAR(10) NOT NULL,
CONSTRAINT guestcheckout_transactionID_PK PRIMARY KEY(transactionID));


CREATE TABLE `events`(
eventID INT UNIQUE AUTO_INCREMENT,
event_name VARCHAR(60) DEFAULT NULL,
event_date VARCHAR(20) NOT NULL,
number_Of_spots VARCHAR(45) NOT NULL,
number_Of_AvailableSpots VARCHAR(45) NOT NULL,
Address VARCHAR(60) DEFAULT NULL,
Address_Optional VARCHAR(60) DEFAULT NULL,
City VARCHAR(45) DEFAULT NULL,
State VARCHAR(45) DEFAULT NULL,
Zip VARCHAR(10) DEFAULT NULL,
CONSTRAINT events_eventID_PK PRIMARY KEY(eventID));

CREATE TABLE members_events(
memberID INT NOT NULL,
eventID INT NOT NULL,
CONSTRAINT members_events_memberID_FK FOREIGN KEY(memberID) REFERENCES MEMBERS(memberID)
ON UPDATE NO ACTION
ON DELETE NO ACTION,
CONSTRAINT memebrs_events_eventID_FK FOREIGN KEY(eventID) REFERENCES `EVENTS`(eventID)
ON UPDATE NO ACTION
ON DELETE NO ACTION
);

CREATE TABLE merchandise_tickets(
itemID INT NOT NULL AUTO_INCREMENT,
item_name VARCHAR(90) NOT NULL,
item_price DECIMAL(8,2) DEFAULT NULL,
quantity DECIMAL(8,0) DEFAULT NULL,
vendor VARCHAR(45) DEFAULT NULL,
CONSTRAINT tickets_merch_itemID_PK PRIMARY KEY(itemID));

CREATE TABLE memebrs_merch_tick(
memberID INT NOT NULL,
itemID INT NOT NULL,
CONSTRAINT members_merch_memberID_FK FOREIGN KEY(memberID) REFERENCES MEMBERS(memberID)
ON UPDATE NO ACTION
ON DELETE NO ACTION,
CONSTRAINT merch_tickets_itemID_FK FOREIGN KEY(itemID) REFERENCES MERCHANDISE_TICKETS(itemID)
ON UPDATE NO ACTION
ON DELETE NO ACTION);

DROP VIEW IF EXISTS members_items;
CREATE VIEW members_items
AS
SELECT   first_name, last_name, email, itemID, item_name, item_price, quantity
FROM members
JOIN memebrs_merch_tick USING(memberID)
JOIN merchandise_tickets USING(itemID)
ORDER BY first_name;

DROP VIEW IF EXISTS members_events;
CREATE VIEW members_events
AS
SELECT first_name, last_name, email, event_name, event_date, events.address, events.city, events.state
FROM members
JOIN members_events USING(memberID)
JOIN `events` USING(eventID)
ORDER BY first_name;



#=============================================================================================================================================================================

INSERT INTO members VALUES(default, 'goober@test.com', 'goo','ber','goober','password', 'over', '206-206-2060','123 Example st','Seattle','WA','10005', 'YES', '2019-05-20');

INSERT INTO `events` VALUES(default, 'Night of Music', '2020-04-04','100','43','1st ave','','Seattle','WA','10005');
INSERT INTO `events` VALUES(default, 'Poetry', '2020-04-06','300','56','4th ave','','Seattle','WA','10005');
INSERT INTO `events` VALUES(default, 'Rock and Roll Night', '2020-06-04','2540','1911','5th ave','','Seattle','WA','10005');

