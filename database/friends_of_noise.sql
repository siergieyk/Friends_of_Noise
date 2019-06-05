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
Phone VARCHAR(20) DEFAULT NULL,
Address VARCHAR(60) DEFAULT NULL,
City VARCHAR(45) DEFAULT NULL,
State VARCHAR(45) DEFAULT NULL,
Zip VARCHAR(10) DEFAULT NULL,
Newsletter VARCHAR(10) DEFAULT NULL,
`Date` DATE NOT NULL,
CONSTRAINT members_memberID_PK PRIMARY KEY(memberID));




CREATE TABLE `events`(
eventID INT NOT NULL,
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
itemID INT NOT NULL,
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

CREATE TABLE `admin`(
first_name VARCHAR(45) NOT NULL,
last_name VARCHAR(60) NOT NULL,
email VARCHAR(45) NOT NULL,
`password` VARCHAR(45) NOT NULL);

CREATE TABLE guestcheckout(
transactionID INT NOT NULL,
#UID VARCHAR(100) PRIMARY KEY,
First_Name VARCHAR(45) NOT NULL,
Last_Name VARCHAR(45) NOT NULL,
Email VARCHAR(100) NOT NULL,
Address VARCHAR(60) NOT NULL,
AddressOptional VARCHAR(60) DEFAULT NULL,
City VARCHAR(45) NOT NULL,
State VARCHAR(45) NOT NULL,
Zip VARCHAR(10) NOT NULL,
itemID INT,
CONSTRAINT guestcheckout_transactionID_K PRIMARY KEY(transactionID),
CONSTRAINT merch_item_itemID_FK FOREIGN KEY(itemID) REFERENCES merchandise_tickets(itemID));

DROP VIEW IF EXISTS members_items;
CREATE VIEW members_items
AS
SELECT   first_name, last_name, email, itemID, item_name, item_price, quantity
FROM members
JOIN memebrs_merch_tick USING(memberID)
JOIN merchandise_tickets USING(itemID)
ORDER BY first_name;

DROP VIEW IF EXISTS member_events;
CREATE VIEW member_events
AS
SELECT first_name, last_name, email, event_name, event_date, events.address, events.city, events.state
FROM members
JOIN members_events USING(memberID)
JOIN `events` USING(eventID)
ORDER BY first_name;

SET FOREIGN_KEY_CHECKS=0;





#=============================================================================================================================================================================
INSERT INTO members VALUES(	'1',	'jfriedl@msn.com',	'Dannie',	'Schultze',	'jfriedl@msn.com',	'JVGeXUpT',	'18',	'(554) 548-4992',	'31 N. Sugar Drive',	'San Angelo',	'TX',	'76901',	'NO',	'2017-06-09'	)	;
INSERT INTO members VALUES(	'2',	'dmath@live.com',	'Burton',	'Alger',	'dmath@live.com',	'JUuHStJB',	'26',	'(319) 442-2973',	'9533 Cactus Dr.',	'Graham',	'NC',	'27253',	'YES',	'2017-06-26'	)	;
INSERT INTO members VALUES(	'3',	'ribet@outlook.com',	'Kelsie',	'Mcclelland',	'ribet@outlook.com',	'KA2hxhaD',	'41',	'(315) 812-4687',	'677 Sherwood St.',	'Pittsfield',	'MA',	'1201',	'YES',	'2017-06-30'	)	;
INSERT INTO members VALUES(	'4',	'dialworld@optonline.net',	'Sal',	'Helper',	'dialworld@optonline.net',	'FVdjT4Wg',	'39',	'(763) 831-8115',	'7244 Highland Ave.',	'Cherry Hill',	'NJ',	'8003',	'YES',	'2017-07-01'	)	;
INSERT INTO members VALUES(	'5',	'william@mac.com',	'Lori',	'Lindon',	'william@mac.com',	'tjqz5HGg',	'69',	'(614) 689-3651',	'420 Cedar Swamp Dr.',	'Aberdeen',	'SD',	'57401',	'NO',	'2017-07-21'	)	;
INSERT INTO members VALUES(	'6',	'bigmauler@comcast.net',	'Oralee',	'Zepp',	'bigmauler@comcast.net',	'gBcP35Xe',	'29',	'(215) 677-7892',	'7511 Lexington Drive',	'Park Ridge',	'IL',	'60068',	'NO',	'2017-07-30'	)	;
INSERT INTO members VALUES(	'7',	'rfoley@att.net',	'Lily',	'Monk',	'rfoley@att.net',	'v8uzDRSb',	'50',	'(878) 314-7354',	'34 Homestead Rd.',	'Sandusky',	'OH',	'44870',	'NO',	'2017-08-06'	)	;
INSERT INTO members VALUES(	'8',	'airship@icloud.com',	'Elsy',	'Knittel',	'airship@icloud.com',	'AKp49LBJ',	'37',	'(423) 510-9797',	'528 Bellevue Rd.',	'Lancaster',	'NY',	'14086',	'NO',	'2017-08-10'	)	;
INSERT INTO members VALUES(	'9',	'gboss@verizon.net',	'Raisa',	'Telford',	'gboss@verizon.net',	'DUhWgEzH',	'29',	'(664) 990-3134',	'95 Olive Street',	'Oxon Hill',	'MD',	'20745',	'NO',	'2017-08-28'	)	;
INSERT INTO members VALUES(	'10',	'eegsa@sbcglobal.net',	'Domitila',	'Atha',	'eegsa@sbcglobal.net',	'sd4EbnqB',	'46',	'(849) 499-4771',	'8323 Circle Lane',	'Pittsford',	'NY',	'14534',	'YES',	'2017-09-01'	)	;
INSERT INTO members VALUES(	'11',	'arnold@live.com',	'Dolly',	'Brew',	'arnold@live.com',	'afMS8xz6',	'68',	'(535) 402-7659',	'975 Peninsula Court',	'Merrillville',	'IN',	'46410',	'YES',	'2017-09-02'	)	;
INSERT INTO members VALUES(	'12',	'yenya@mac.com',	'Jeffery',	'Holguin',	'yenya@mac.com',	'6nqv9p6F',	'34',	'(834) 435-8507',	'398 York Avenue',	'Lititz',	'PA',	'17543',	'YES',	'2017-09-22'	)	;
INSERT INTO members VALUES(	'13',	'jhardin@comcast.net',	'Roseanna',	'Minix',	'jhardin@comcast.net',	'KEsLYrEs',	'73',	'(737) 326-1867',	'815 El Dorado Street',	'Lawndale',	'CA',	'90260',	'YES',	'2017-09-23'	)	;
INSERT INTO members VALUES(	'14',	'mfleming@msn.com',	'Trena',	'Breckenridge',	'mfleming@msn.com',	'Dc7cQAcd',	'25',	'(919) 505-2846',	'118 Clay Lane',	'Bethlehem',	'PA',	'18015',	'YES',	'2017-10-10'	)	;
INSERT INTO members VALUES(	'15',	'jipsen@mac.com',	'Denisha',	'Murrill',	'jipsen@mac.com',	'8ADL2C6s',	'44',	'(316) 865-7331',	'71 Depot Drive',	'Danville',	'VA',	'24540',	'NO',	'2017-11-19'	)	;
INSERT INTO members VALUES(	'16',	'metzzo@hotmail.com',	'Jonah',	'Sturrock',	'metzzo@hotmail.com',	'cjVFDGzs',	'46',	'(424) 542-4171',	'835 Oakland Ave.',	'Traverse City',	'MI',	'49684',	'NO',	'2017-11-21'	)	;
INSERT INTO members VALUES(	'17',	'dexter@yahoo.ca',	'Cleopatra',	'Bruck',	'dexter@yahoo.ca',	'Qpd97Htt',	'51',	'(427) 751-2569',	'904 Elmwood St.',	'Batavia',	'OH',	'45103',	'NO',	'2017-11-29'	)	;
INSERT INTO members VALUES(	'18',	'wonderkid@msn.com',	'Oda',	'Holbrook',	'wonderkid@msn.com',	'D9NhE6xj',	'63',	'(239) 288-6262',	'97 Berkshire Lane',	'Baldwinsville',	'NY',	'13027',	'NO',	'2017-12-07'	)	;
INSERT INTO members VALUES(	'19',	'ramollin@mac.com',	'Sharice',	'Redman',	'ramollin@mac.com',	'9axxCKvp',	'41',	'(635) 627-0643',	'84 Willow Street',	'Gettysburg',	'PA',	'17325',	'NO',	'2017-12-08'	)	;
INSERT INTO members VALUES(	'20',	'steve@optonline.net',	'Leontine',	'Wager',	'steve@optonline.net',	'2VRt4XVH',	'25',	'(724) 279-7090',	'1 James St.',	'Clifton Park',	'NY',	'12065',	'YES',	'2017-12-09'	)	;
INSERT INTO members VALUES(	'21',	'caronni@gmail.com',	'Jefferey',	'Lacroix',	'caronni@gmail.com',	'9JGLN9CL',	'45',	'(288) 430-9788',	'67 Homestead Court',	'Baltimore',	'MD',	'21206',	'YES',	'2017-12-10'	)	;
INSERT INTO members VALUES(	'22',	'farber@sbcglobal.net',	'Zada',	'Slavens',	'farber@sbcglobal.net',	'LNmaLVh4',	'46',	'(433) 543-7222',	'607 Center Avenue',	'Roselle',	'IL',	'60172',	'NO',	'2017-12-17'	)	;
INSERT INTO members VALUES(	'23',	'geekgrl@me.com',	'Janita',	'Myrick',	'geekgrl@me.com',	'f9dvZUK2',	'60',	'(480) 691-3297',	'27 Campfire Lane',	'Tupelo',	'MS',	'38801',	'YES',	'2017-12-23'	)	;
INSERT INTO members VALUES(	'24',	'bartak@att.net',	'Bettina',	'Betters',	'bartak@att.net',	'HNjAjheR',	'30',	'(987) 373-5745',	'320 Jones Drive',	'South Windsor',	'CT',	'6074',	'YES',	'2017-12-24'	)	;
INSERT INTO members VALUES(	'25',	'djupedal@outlook.com',	'Joselyn',	'Brandes',	'djupedal@outlook.com',	'py5TNxqL',	'48',	'(615) 778-0828',	'87 Nichols St.',	'Centereach',	'NY',	'11720',	'YES',	'2017-12-29'	)	;
INSERT INTO members VALUES(	'26',	'hermanab@comcast.net',	'Sibyl',	'Messana',	'hermanab@comcast.net',	'Nus32sD8',	'62',	'(376) 891-6507',	'9106 Forest St.',	'Myrtle Beach',	'SC',	'29577',	'NO',	'2018-01-05'	)	;
INSERT INTO members VALUES(	'27',	'yumpy@comcast.net',	'Yvette',	'Kamel',	'yumpy@comcast.net',	'eLCTRkv7',	'67',	'(637) 418-1015',	'834 Livingston Court',	'Hudsonville',	'MI',	'49426',	'YES',	'2018-01-23'	)	;
INSERT INTO members VALUES(	'28',	'isorashi@verizon.net',	'Louvenia',	'Lauria',	'isorashi@verizon.net',	'paTDzYLr',	'22',	'(880) 539-9288',	'223 Bradford Street',	'Gainesville',	'VA',	'20155',	'NO',	'2018-02-18'	)	;
INSERT INTO members VALUES(	'29',	'esbeck@yahoo.com',	'Jerrod',	'Steptoe',	'esbeck@yahoo.com',	'CJ4nNc5g',	'56',	'(835) 304-4817',	'7236 Lake View Street',	'Omaha',	'NE',	'68107',	'NO',	'2018-02-19'	)	;
INSERT INTO members VALUES(	'30',	'treeves@yahoo.ca',	'Rochel',	'Edelen',	'treeves@yahoo.ca',	'Na4NdjfR',	'41',	'(885) 720-8380',	'7761 Briarwood St.',	'Cordova',	'TN',	'38016',	'NO',	'2018-03-23'	)	;
INSERT INTO members VALUES(	'31',	'yruan@yahoo.com',	'Latonya',	'Duplessis',	'yruan@yahoo.com',	'gL7r5xWw',	'55',	'(749) 705-1583',	'23 Roberts St.',	'West Orange',	'NJ',	'7052',	'YES',	'2018-03-26'	)	;
INSERT INTO members VALUES(	'32',	'kramulous@verizon.net',	'Russ',	'Mccomb',	'kramulous@verizon.net',	'GsXLABfU',	'42',	'(362) 531-3473',	'38 State St.',	'Floral Park',	'NY',	'11001',	'NO',	'2018-04-11'	)	;
INSERT INTO members VALUES(	'33',	'portele@optonline.net',	'Bell',	'Schoonover',	'portele@optonline.net',	'yuY8455v',	'21',	'(525) 455-4223',	'9193 8th Ave.',	'Rockledge',	'FL',	'32955',	'YES',	'2018-04-19'	)	;
INSERT INTO members VALUES(	'34',	'graham@me.com',	'Shea',	'Woltman',	'graham@me.com',	'AV6uwxBw',	'34',	'(452) 939-8299',	'248 Buckingham St.',	'Burnsville',	'MN',	'55337',	'NO',	'2018-04-22'	)	;
INSERT INTO members VALUES(	'35',	'sagal@aol.com',	'Elayne',	'Swilley',	'sagal@aol.com',	'PPuGKRsh',	'26',	'(564) 890-1322',	'7111 Sherman Street',	'Malden',	'MA',	'2148',	'YES',	'2018-04-27'	)	;
INSERT INTO members VALUES(	'36',	'webdragon@me.com',	'Anne',	'Durr',	'webdragon@me.com',	'PgurSeTx',	'75',	'(753) 255-8730',	'38 Mayfield Ave.',	'Stone Mountain',	'GA',	'30083',	'YES',	'2018-05-12'	)	;
INSERT INTO members VALUES(	'37',	'janneh@gmail.com',	'Tonette',	'Story',	'janneh@gmail.com',	'4HFuRrdP',	'75',	'(566) 636-5258',	'7693 East Olive St.',	'Richardson',	'TX',	'75080',	'NO',	'2018-05-31'	)	;
INSERT INTO members VALUES(	'38',	'mirod@verizon.net',	'Ginger',	'Hoffman',	'mirod@verizon.net',	'fzzT2xb6',	'25',	'(449) 214-1221',	'9565 Summerhouse Lane',	'Wayne',	'NJ',	'7470',	'YES',	'2018-06-03'	)	;
INSERT INTO members VALUES(	'39',	'adillon@mac.com',	'Ehtel',	'Brummett',	'adillon@mac.com',	'cd2BUR5C',	'39',	'(421) 676-2408',	'3 Hickory Ave.',	'Sevierville',	'TN',	'37876',	'YES',	'2018-07-11'	)	;
INSERT INTO members VALUES(	'40',	'slaff@gmail.com',	'Liana',	'Proffit',	'slaff@gmail.com',	'8yX2BCJF',	'60',	'(342) 855-1882',	'521 Sutor Court',	'Venice',	'FL',	'34293',	'NO',	'2018-07-17'	)	;
INSERT INTO members VALUES(	'41',	'shawnce@icloud.com',	'Barb',	'Timms',	'shawnce@icloud.com',	'h29K9z4D',	'57',	'(471) 700-0952',	'990 North Drive',	'Huntington',	'NY',	'11743',	'YES',	'2018-07-30'	)	;
INSERT INTO members VALUES(	'42',	'podmaster@me.com',	'Monserrate',	'Mattocks',	'podmaster@me.com',	'kbHKndWP',	'52',	'(363) 377-2292',	'68 Grove St.',	'Reynoldsburg',	'OH',	'43068',	'NO',	'2018-08-09'	)	;
INSERT INTO members VALUES(	'43',	'webinc@yahoo.com',	'Margorie',	'Bigger',	'webinc@yahoo.com',	'EpwQ443S',	'69',	'(256) 460-3756',	'7 E. Galvin St.',	'Greenville',	'NC',	'27834',	'NO',	'2018-08-16'	)	;
INSERT INTO members VALUES(	'44',	'sthomas@optonline.net',	'Carlena',	'Noss',	'sthomas@optonline.net',	'B6fv4Pgv',	'29',	'(867) 221-8945',	'9059 West Arcadia Street',	'Perth Amboy',	'NJ',	'8861',	'NO',	'2018-08-20'	)	;
INSERT INTO members VALUES(	'45',	'caronni@verizon.net',	'Berniece',	'Robinett',	'caronni@verizon.net',	'7KPSLNZv',	'55',	'(471) 610-3484',	'8575 Kingston Dr.',	'Fort Mill',	'SC',	'29708',	'YES',	'2018-08-30'	)	;
INSERT INTO members VALUES(	'46',	'portscan@gmail.com',	'Marylin',	'Parras',	'portscan@gmail.com',	'qAZtm35g',	'31',	'(372) 238-0745',	'72 Johnson Ave.',	'Orlando',	'FL',	'32806',	'YES',	'2018-09-01'	)	;
INSERT INTO members VALUES(	'47',	'afifi@mac.com',	'Mack',	'Tschida',	'afifi@mac.com',	'byXGbmLU',	'47',	'(394) 893-9442',	'80 Lakeshore St.',	'Winona',	'MN',	'55987',	'NO',	'2018-09-02'	)	;
INSERT INTO members VALUES(	'48',	'thowell@yahoo.com',	'Ebonie',	'Pace',	'thowell@yahoo.com',	'MUrxSRBJ',	'70',	'(603) 897-9441',	'570 Edgefield Rd.',	'Homestead',	'FL',	'33030',	'NO',	'2018-09-04'	)	;
INSERT INTO members VALUES(	'49',	'dexter@msn.com',	'Katlyn',	'Steward',	'dexter@msn.com',	'UtaSDXsp',	'68',	'(979) 775-2450',	'7276 Greenview Drive',	'New Port Richey',	'FL',	'34653',	'NO',	'2018-09-29'	)	;
INSERT INTO members VALUES(	'50',	'sakusha@icloud.com',	'Jessenia',	'Leffel',	'sakusha@icloud.com',	'5uYZmvkE',	'71',	'(813) 412-7121',	'86 Atlantic Rd.',	'Paducah',	'KY',	'42001',	'YES',	'2018-10-02'	)	;
INSERT INTO members VALUES(	'51',	'jgoerzen@verizon.net',	'Otha',	'Wess',	'jgoerzen@verizon.net',	'pCXYGCEf',	'37',	'(672) 731-8138',	'65 N. Birchwood St.',	'Blackwood',	'NJ',	'8012',	'YES',	'2018-10-06'	)	;
INSERT INTO members VALUES(	'52',	'grinder@verizon.net',	'Andree',	'Wyckoff',	'grinder@verizon.net',	'VT4MrvQz',	'37',	'(409) 418-4342',	'20 North Virginia St.',	'Hamburg',	'NY',	'14075',	'NO',	'2018-10-08'	)	;
INSERT INTO members VALUES(	'53',	'aracne@att.net',	'Rene',	'Infantino',	'aracne@att.net',	'S8AauWDC',	'75',	'(754) 579-2447',	'205 Cedar Swamp St.',	'Vineland',	'NJ',	'8360',	'NO',	'2018-10-15'	)	;
INSERT INTO members VALUES(	'54',	'slanglois@live.com',	'Chung',	'Grandison',	'slanglois@live.com',	'TN3XbVFn',	'53',	'(819) 765-4189',	'846 Greenview Lane',	'Eau Claire',	'WI',	'54701',	'YES',	'2018-10-16'	)	;
INSERT INTO members VALUES(	'55',	'teverett@icloud.com',	'Samuel',	'Gongora',	'teverett@icloud.com',	'jBPSKtea',	'53',	'(316) 469-3621',	'705 Ashley Avenue',	'Durham',	'NC',	'27703',	'YES',	'2018-11-01'	)	;
INSERT INTO members VALUES(	'56',	'seanq@yahoo.ca',	'Vina',	'Emmert',	'seanq@yahoo.ca',	'bj4qeLXD',	'45',	'(736) 905-0482',	'29 Race Street',	'Ballston Spa',	'NY',	'12020',	'NO',	'2018-11-04'	)	;
INSERT INTO members VALUES(	'57',	'kildjean@outlook.com',	'Rosita',	'Coria',	'kildjean@outlook.com',	'YEyxWRW7',	'30',	'(748) 909-2770',	'7815 Delaware St.',	'Westerville',	'OH',	'43081',	'YES',	'2018-12-12'	)	;
INSERT INTO members VALUES(	'58',	'oevans@att.net',	'Heather',	'Bodin',	'oevans@att.net',	'sQ5PRQa9',	'45',	'(617) 494-0438',	'93 Saxon Ave.',	'Schenectady',	'NY',	'12302',	'YES',	'2018-12-13'	)	;
INSERT INTO members VALUES(	'59',	'jugalator@outlook.com',	'Torrie',	'Gaiser',	'jugalator@outlook.com',	'Qqgp6zSY',	'68',	'(933) 914-4722',	'216 Pennsylvania Dr.',	'Prattville',	'AL',	'36067',	'NO',	'2018-12-17'	)	;
INSERT INTO members VALUES(	'60',	'goldberg@msn.com',	'Milo',	'Laws',	'goldberg@msn.com',	'kGwNnrMm',	'71',	'(255) 864-1508',	'26 North Lawrence Street',	'Hazleton',	'PA',	'18201',	'YES',	'2018-12-24'	)	;
INSERT INTO members VALUES(	'61',	'jtorkbob@outlook.com',	'Rosenda',	'Coman',	'jtorkbob@outlook.com',	'SXNYn4Dv',	'47',	'(498) 950-0121',	'7283 Heritage Ave.',	'Ellenwood',	'GA',	'30294',	'NO',	'2019-01-01'	)	;
INSERT INTO members VALUES(	'62',	'gemmell@verizon.net',	'Nelida',	'Gardenhire',	'gemmell@verizon.net',	'nmXzuXjL',	'65',	'(918) 445-2932',	'8607 Highland Road',	'Yakima',	'WA',	'98908',	'YES',	'2019-01-20'	)	;
INSERT INTO members VALUES(	'63',	'dmbkiwi@verizon.net',	'Keitha',	'Stoops',	'dmbkiwi@verizon.net',	'9pcp6U4M',	'18',	'(746) 360-3092',	'827 Gainsway Court',	'Hummelstown',	'PA',	'17036',	'YES',	'2019-01-24'	)	;
INSERT INTO members VALUES(	'64',	'mobileip@yahoo.ca',	'Eliana',	'Olney',	'mobileip@yahoo.ca',	'bUeag4xY',	'51',	'(445) 657-6720',	'955 Creek Drive',	'Lansdale',	'PA',	'19446',	'YES',	'2019-01-26'	)	;
INSERT INTO members VALUES(	'65',	'sokol@yahoo.com',	'Christia',	'Siemens',	'sokol@yahoo.com',	'MxC7YjrJ',	'56',	'(636) 737-5111',	'7 Brickell St.',	'Augusta',	'GA',	'30906',	'NO',	'2019-01-31'	)	;
INSERT INTO members VALUES(	'66',	'stefano@msn.com',	'Layne',	'Davilla',	'stefano@msn.com',	'JMZDucB5',	'23',	'(837) 881-2803',	'9761 SE. Lawrence Rd.',	'Savannah',	'GA',	'31404',	'YES',	'2019-02-07'	)	;
INSERT INTO members VALUES(	'67',	'meder@outlook.com',	'Leisha',	'Lundstrom',	'meder@outlook.com',	'W4HUQwyZ',	'47',	'(555) 281-2856',	'9415 Princeton Street',	'Wooster',	'OH',	'44691',	'YES',	'2019-02-09'	)	;
INSERT INTO members VALUES(	'68',	'jschauma@mac.com',	'Makeda',	'Rodgers',	'jschauma@mac.com',	'ySJy9R52',	'60',	'(813) 602-7963',	'9841 Nut Swamp Dr.',	'Sterling Heights',	'MI',	'48310',	'YES',	'2019-02-13'	)	;
INSERT INTO members VALUES(	'69',	'reziac@icloud.com',	'Galina',	'Levi',	'reziac@icloud.com',	'M5MwFHjX',	'63',	'(531) 420-9208',	'1 Southampton St.',	'Gaithersburg',	'MD',	'20877',	'NO',	'2019-02-18'	)	;
INSERT INTO members VALUES(	'70',	'giafly@yahoo.ca',	'Gertrud',	'Markley',	'giafly@yahoo.ca',	'YUgRjpcn',	'64',	'(597) 446-2662',	'67 West Manor Station Street',	'Hoboken',	'NJ',	'7030',	'YES',	'2019-02-18'	)	;
INSERT INTO members VALUES(	'71',	'rgarcia@aol.com',	'Claire',	'Declue',	'rgarcia@aol.com',	'ChfuuPKL',	'21',	'(810) 349-5997',	'8123 Ridgeview Dr.',	'Bridgewater',	'NJ',	'8807',	'NO',	'2019-02-21'	)	;
INSERT INTO members VALUES(	'72',	'dieman@gmail.com',	'Librada',	'Kraatz',	'dieman@gmail.com',	'VJafbrbp',	'31',	'(250) 444-7495',	'91 Hilldale Court',	'Kenosha',	'WI',	'53140',	'NO',	'2019-03-03'	)	;
INSERT INTO members VALUES(	'73',	'yzheng@outlook.com',	'Teresa',	'Bellamy',	'yzheng@outlook.com',	'8KWEbpCt',	'54',	'(842) 595-2964',	'976 N. Lake Dr.',	'Garden City',	'NY',	'11530',	'YES',	'2019-03-24'	)	;
INSERT INTO members VALUES(	'74',	'world@att.net',	'Evalyn',	'Falkner',	'world@att.net',	'KqZ9J2k9',	'45',	'(952) 769-3901',	'8716 Illinois St.',	'Howard Beach',	'NY',	'11414',	'YES',	'2019-03-26'	)	;
INSERT INTO members VALUES(	'75',	'cderoove@gmail.com',	'Patrina',	'Mclelland',	'cderoove@gmail.com',	'sJtTeCgY',	'74',	'(690) 505-7322',	'781 Pacific Drive',	'Valley Stream',	'NY',	'11580',	'YES',	'2019-03-28'	)	;
INSERT INTO members VALUES(	'76',	'pedwards@att.net',	'Jeannetta',	'Lucchesi',	'pedwards@att.net',	'UF8TUckq',	'51',	'(994) 362-4359',	'9371 Country Club Street',	'Glen Allen',	'VA',	'23059',	'YES',	'2019-04-07'	)	;
INSERT INTO members VALUES(	'77',	'raines@icloud.com',	'Ron',	'Barrus',	'raines@icloud.com',	'Nqv2XyXC',	'31',	'(739) 894-3365',	'412 Orange St.',	'Round Lake',	'IL',	'60073',	'YES',	'2019-04-18'	)	;
INSERT INTO members VALUES(	'78',	'nullchar@yahoo.com',	'Theodore',	'Barta',	'nullchar@yahoo.com',	'Q33ZG2jS',	'54',	'(852) 949-1819',	'966 Fieldstone Ave.',	'Alliance',	'OH',	'44601',	'YES',	'2019-04-19'	)	;
INSERT INTO members VALUES(	'79',	'danny@att.net',	'Jerri',	'Kappel',	'danny@att.net',	'sBmYfMHX',	'71',	'(713) 400-7020',	'21 Bridle St.',	'Bellmore',	'NY',	'11710',	'NO',	'2019-05-04'	)	;
INSERT INTO members VALUES(	'80',	'jhardin@yahoo.ca',	'Jeanne',	'Eich',	'jhardin@yahoo.ca',	'q7rhrLwQ',	'66',	'(673) 231-6372',	'478 Hillcrest Dr.',	'Midland',	'MI',	'48640',	'YES',	'2019-05-18'	)	;
INSERT INTO members VALUES(	'81',	'martink@comcast.net',	'Chantay',	'Blea',	'martink@comcast.net',	'WnFkxWNV',	'39',	'(982) 735-1537',	'360 Greenview Rd.',	'Rockville Centre',	'NY',	'11570',	'NO',	'2019-05-20'	)	;
INSERT INTO members VALUES(	'82',	'jhardin@comcast.net',	'Adan',	'Vanscyoc',	'jhardin@comcast.net',	'8kEPQRWa',	'75',	'(456) 427-4109',	'8 Shore St.',	'Morton Grove',	'IL',	'60053',	'YES',	'2019-06-04'	)	;
INSERT INTO members VALUES(	'83',	'panolex@sbcglobal.net',	'Talisha',	'Galyon',	'panolex@sbcglobal.net',	'X9UpmHxz',	'29',	'(436) 900-5419',	'52 Henry Avenue',	'Brookfield',	'WI',	'53045',	'YES',	'2019-06-11'	)	;
INSERT INTO members VALUES(	'84',	'mfburgo@mac.com',	'Franklyn',	'Eubanks',	'mfburgo@mac.com',	'sahBYSg7',	'28',	'(231) 870-6857',	'872 Greenrose St.',	'Attleboro',	'MA',	'2703',	'NO',	'2019-06-14'	)	;
INSERT INTO members VALUES(	'85',	'drjlaw@icloud.com',	'Rosanne',	'Zimmerman',	'drjlaw@icloud.com',	'AHrZVRj3',	'53',	'(477) 471-4072',	'7221 Bear Hill St.',	'Long Branch',	'NJ',	'7740',	'NO',	'2019-06-20'	)	;
INSERT INTO members VALUES(	'86',	'oechslin@icloud.com',	'Jaunita',	'Custodio',	'oechslin@icloud.com',	'ds6qq8f5',	'30',	'(732) 726-6950',	'292 Temple Lane',	'Bristow',	'VA',	'20136',	'YES',	'2019-08-01'	)	;
INSERT INTO members VALUES(	'87',	'stevelim@msn.com',	'Siu',	'Ines',	'stevelim@msn.com',	'7ybxrxRH',	'66',	'(490) 220-4121',	'7 Cherry Hill Street',	'North Olmsted',	'OH',	'44070',	'YES',	'2019-08-03'	)	;
INSERT INTO members VALUES(	'88',	'kmself@me.com',	'Christen',	'Pokorny',	'kmself@me.com',	'XX8hABPh',	'24',	'(509) 859-6357',	'63 North Spruce St.',	'Cranford',	'NJ',	'7016',	'YES',	'2019-08-19'	)	;
INSERT INTO members VALUES(	'89',	'wiseb@aol.com',	'Wade',	'Molloy',	'wiseb@aol.com',	'LJBY77uR',	'38',	'(548) 576-8532',	'9930 Shadow Brook Ave.',	'Phillipsburg',	'NJ',	'8865',	'YES',	'2019-08-20'	)	;
INSERT INTO members VALUES(	'90',	'luvirini@msn.com',	'Joette',	'Bookman',	'luvirini@msn.com',	'gtZd2eDf',	'50',	'(293) 677-3263',	'513 Nicolls St.',	'Royersford',	'PA',	'19468',	'YES',	'2019-08-25'	)	;
INSERT INTO members VALUES(	'91',	'codex@hotmail.com',	'Tama',	'Vanderploeg',	'codex@hotmail.com',	'ha2xPfMP',	'75',	'(201) 282-9493',	'72 Woodland Drive',	'Millville',	'NJ',	'8332',	'YES',	'2019-09-03'	)	;
INSERT INTO members VALUES(	'92',	'johnbob@hotmail.com',	'Anneliese',	'Hallmark',	'johnbob@hotmail.com',	'ZRBZkKJX',	'18',	'(248) 511-1548',	'13 Shadow Brook Street',	'Acworth',	'GA',	'30101',	'NO',	'2019-09-24'	)	;
INSERT INTO members VALUES(	'93',	'wikinerd@aol.com',	'Benito',	'Brumbaugh',	'wikinerd@aol.com',	'ZDRa7KTc',	'33',	'(911) 274-4996',	'144 Paris Hill Ave.',	'Piedmont',	'SC',	'29673',	'YES',	'2019-09-30'	)	;
INSERT INTO members VALUES(	'94',	'hahsler@sbcglobal.net',	'Shanon',	'Vanscoy',	'hahsler@sbcglobal.net',	'nDgsrHcz',	'74',	'(773) 780-7550',	'8286 Deerfield Ave.',	'Hallandale',	'FL',	'33009',	'YES',	'2019-10-11'	)	;
INSERT INTO members VALUES(	'95',	'jfriedl@gmail.com',	'Jin',	'Chaffins',	'jfriedl@gmail.com',	'Vm8r8xdH',	'18',	'(983) 223-9595',	'9620 Thomas Ave.',	'Tallahassee',	'FL',	'32303',	'YES',	'2019-10-18'	)	;
INSERT INTO members VALUES(	'96',	'zwood@verizon.net',	'Lessie',	'Buster',	'zwood@verizon.net',	'asUmk6Z3',	'19',	'(703) 210-0589',	'5 Primrose St.',	'Fort Walton Beach',	'FL',	'32547',	'YES',	'2019-11-29'	)	;
INSERT INTO members VALUES(	'97',	'brainless@outlook.com',	'Rosalinda',	'Frasier',	'brainless@outlook.com',	'DF8SLMMN',	'31',	'(536) 437-5904',	'579 Cambridge St.',	'Erlanger',	'KY',	'41018',	'NO',	'2019-12-03'	)	;
INSERT INTO members VALUES(	'98',	'eabrown@icloud.com',	'Barry',	'Hatmaker',	'eabrown@icloud.com',	'g5rtH5aL',	'72',	'(286) 273-2087',	'9195 Jennings Court',	'Boston',	'MA',	'2127',	'YES',	'2019-12-16'	)	;
INSERT INTO members VALUES(	'99',	'dodong@yahoo.com',	'Dina',	'Sarris',	'dodong@yahoo.com',	'p68LBbvD',	'69',	'(990) 805-9778',	'66 Arch St.',	'Medford',	'MA',	'2155',	'NO',	'2019-12-23'	)	;
INSERT INTO members VALUES(	'100',	'hahiss@comcast.net',	'Blossom',	'Bough',	'hahiss@comcast.net',	'B2nDxkzn',	'56',	'(612) 552-7475',	'79 Ketch Harbour Ave.',	'Scotch Plains',	'NJ',	'7076',	'NO',	'2019-12-31'	)	;

INSERT INTO guestcheckout VALUES(	'1',	'Eddie',	'Aguilar',	'trygstad@aol.com',	'37 Talbot Drive',	'DEFAULT',	'Avon',	'IN',	'46123',	'29'	)	;
INSERT INTO guestcheckout VALUES(	'2',	'Marion',	'Obrien',	'curly@aol.com',	'881 Shady Street',	'DEFAULT',	'Wausau',	'WI',	'54401',	'11'	)	;
INSERT INTO guestcheckout VALUES(	'3',	'Jennifer',	'Logan',	'mleary@mac.com',	'8 Illinois St.',	'DEFAULT',	'Tucker',	'GA',	'30084',	'63'	)	;
INSERT INTO guestcheckout VALUES(	'4',	'Darren',	'Harrison',	'wojciech@verizon.net',	'9831 Beach Rd.',	'DEFAULT',	'Hamden',	'CT',	'6514',	'64'	)	;
INSERT INTO guestcheckout VALUES(	'5',	'Megan',	'Hill',	'bbirth@hotmail.com',	'72 South Plymouth Dr.',	'DEFAULT',	'San Angelo',	'TX',	'76901',	'28'	)	;
INSERT INTO guestcheckout VALUES(	'6',	'Christie',	'Moreno',	'codex@msn.com',	'8638 High Ridge St.',	'DEFAULT',	'Bismarck',	'ND',	'58501',	'17'	)	;
INSERT INTO guestcheckout VALUES(	'7',	'Lila',	'Torres',	'nicktrig@mac.com',	'9185 Tarkiln Hill St.',	'DEFAULT',	'Oxford',	'MS',	'38655',	'67'	)	;
INSERT INTO guestcheckout VALUES(	'8',	'Cedric',	'Sherman',	'pavel@sbcglobal.net',	'9445 Jennings Drive',	'DEFAULT',	'Atwater',	'CA',	'95301',	'42'	)	;
INSERT INTO guestcheckout VALUES(	'9',	'Jan',	'Brady',	'godeke@mac.com',	'7640 Water Rd.',	'DEFAULT',	'Lynchburg',	'VA',	'24502',	'66'	)	;
INSERT INTO guestcheckout VALUES(	'10',	'Eloise',	'Lawson',	'uqmcolyv@msn.com',	'8615 Golf Ave.',	'DEFAULT',	'Lorain',	'OH',	'44052',	'71'	)	;
INSERT INTO guestcheckout VALUES(	'11',	'Tom',	'Jenkins',	'mxiao@me.com',	'24 Sulphur Springs St.',	'DEFAULT',	'Hattiesburg',	'MS',	'39401',	'21'	)	;
INSERT INTO guestcheckout VALUES(	'12',	'Georgia',	'Simmons',	'shang@verizon.net',	'8886 NW. Chestnut Ave.',	'DEFAULT',	'Greensboro',	'NC',	'27405',	'6'	)	;
INSERT INTO guestcheckout VALUES(	'13',	'Jean',	'Wood',	'crobles@att.net',	'89 Bellevue Street',	'DEFAULT',	'Los Banos',	'CA',	'93635',	'36'	)	;
INSERT INTO guestcheckout VALUES(	'14',	'Adrienne',	'Hale',	'arebenti@yahoo.ca',	'7435 St Margarets Lane',	'DEFAULT',	'Oviedo',	'FL',	'32765',	'49'	)	;
INSERT INTO guestcheckout VALUES(	'15',	'Donnie',	'Wade',	'curly@optonline.net',	'9287 Goldfield Rd.',	'DEFAULT',	'Miami',	'FL',	'33125',	'42'	)	;
INSERT INTO guestcheckout VALUES(	'16',	'Ignacio',	'Ward',	'tubesteak@msn.com',	'8750 Newport Ave.',	'DEFAULT',	'Salt Lake City',	'UT',	'84119',	'50'	)	;
INSERT INTO guestcheckout VALUES(	'17',	'Mona',	'Hanson',	'madanm@mac.com',	'591 East 8th Rd.',	'DEFAULT',	'Twin Falls',	'ID',	'83301',	'49'	)	;
INSERT INTO guestcheckout VALUES(	'18',	'Angela',	'Bowers',	'wortmanj@verizon.net',	'280 Railroad Drive',	'DEFAULT',	'Middletown',	'CT',	'6457',	'51'	)	;
INSERT INTO guestcheckout VALUES(	'19',	'Beverly',	'Murray',	'scarolan@live.com',	'185 West Spruce Street',	'DEFAULT',	'New Baltimore',	'MI',	'48047',	'33'	)	;
INSERT INTO guestcheckout VALUES(	'20',	'Kristina',	'Singleton',	'jeffcovey@msn.com',	'759A Corona Road',	'DEFAULT',	'Clementon',	'NJ',	'8021',	'65'	)	;
INSERT INTO guestcheckout VALUES(	'21',	'Luther',	'Love',	'pgottsch@sbcglobal.net',	'640 E. Brickell Rd.',	'DEFAULT',	'Danville',	'VA',	'24540',	'35'	)	;
INSERT INTO guestcheckout VALUES(	'22',	'Fred',	'Ramirez',	'gfxguy@optonline.net',	'8 Oak Meadow Dr.',	'DEFAULT',	'Atlantic City',	'NJ',	'8401',	'13'	)	;
INSERT INTO guestcheckout VALUES(	'23',	'Jasmine',	'Blair',	'amimojo@att.net',	'60 E. Lower River Ave.',	'DEFAULT',	'Yakima',	'WA',	'98908',	'22'	)	;
INSERT INTO guestcheckout VALUES(	'24',	'Joseph',	'Drake',	'tattooman@sbcglobal.net',	'9567 Philmont Ave.',	'DEFAULT',	'Fargo',	'ND',	'58102',	'52'	)	;
INSERT INTO guestcheckout VALUES(	'25',	'Claire',	'Ball',	'pemungkah@aol.com',	'355 Myrtle Ave.',	'DEFAULT',	'Highland',	'IN',	'46322',	'7'	)	;

INSERT INTO `events` VALUES(	'1',	'U2 360° Tour',	'2017-06-09',	'89',	'18',	'76 Foster St.',	'DEFAULT',	'Kissimmee',	'FL',	'34741'	)	;
INSERT INTO `events` VALUES(	'2',	'÷ Tour',	'2017-06-26',	'235',	'47',	'7553 Amherst Street',	'DEFAULT',	'Sidney',	'OH',	'45365'	)	;
INSERT INTO `events` VALUES(	'3',	'Not in This Lifetime... Tour',	'2017-06-30',	'48',	'10',	'702 West Pennsylvania Dr.',	'DEFAULT',	'Ephrata',	'PA',	'17522'	)	;
INSERT INTO `events` VALUES(	'4',	'A Bigger Bang Tour',	'2017-07-01',	'151',	'30',	'395 Gonzales St.',	'DEFAULT',	'Wellington',	'FL',	'33414'	)	;
INSERT INTO `events` VALUES(	'5',	'A Head Full of Dreams Tour',	'2017-07-21',	'184',	'37',	'514 N. Mayflower Rd.',	'DEFAULT',	'Burnsville',	'MN',	'55337'	)	;
INSERT INTO `events` VALUES(	'6',	'The Wall Live',	'2017-07-30',	'931',	'186',	'441 Riverside Street',	'DEFAULT',	'Bergenfield',	'NJ',	'7621'	)	;
INSERT INTO `events` VALUES(	'7',	'Black Ice World Tour',	'2017-08-06',	'497',	'99',	'293 Arnold Rd.',	'DEFAULT',	'Los Angeles',	'CA',	'90008'	)	;
INSERT INTO `events` VALUES(	'8',	'Sticky & Sweet Tour',	'2017-08-10',	'458',	'92',	'827 S. Lower River Drive',	'DEFAULT',	'Fresh Meadows',	'NY',	'11365'	)	;
INSERT INTO `events` VALUES(	'9',	'Vertigo Tour',	'2017-08-28',	'579',	'116',	'80 Argyle Ave.',	'DEFAULT',	'North Royalton',	'OH',	'44133'	)	;
INSERT INTO `events` VALUES(	'10',	'World Tour',	'2017-09-01',	'769',	'154',	'8830 E. Westport Ave.',	'DEFAULT',	'Garland',	'TX',	'75043'	)	;
INSERT INTO `events` VALUES(	'11',	'The Police Reunion Tour',	'2017-09-02',	'768',	'154',	'544 Rock Maple Court',	'DEFAULT',	'Parkville',	'MD',	'21234'	)	;
INSERT INTO `events` VALUES(	'12',	'Wrecking Ball World Tour',	'2017-09-22',	'215',	'43',	'7 Hanover Court',	'DEFAULT',	'Powder Springs',	'GA',	'30127'	)	;
INSERT INTO `events` VALUES(	'13',	'Taylor Swifts Reputation Stadium Tour',	'2017-09-23',	'495',	'99',	'7699 Columbia Street',	'DEFAULT',	'Germantown',	'MD',	'20874'	)	;
INSERT INTO `events` VALUES(	'14',	'Voodoo Lounge Tour',	'2017-10-10',	'791',	'158',	'74 Academy Court',	'DEFAULT',	'Brainerd',	'MN',	'56401'	)	;
INSERT INTO `events` VALUES(	'15',	'The Joshua Tree Tour 2017',	'2017-11-19',	'139',	'28',	'805 Rocky River St.',	'DEFAULT',	'Chippewa Falls',	'WI',	'54729'	)	;
INSERT INTO `events` VALUES(	'16',	'Licks Tour',	'2017-11-21',	'610',	'122',	'8452 Glenridge Rd.',	'DEFAULT',	'Floral Park',	'NY',	'11001'	)	;
INSERT INTO `events` VALUES(	'17',	'The River Tour 2016',	'2018-01-23',	'727',	'145',	'9838 Hill Field Drive',	'DEFAULT',	'Fredericksburg',	'VA',	'22405'	)	;
INSERT INTO `events` VALUES(	'18',	'The MDNA Tour',	'2018-02-18',	'910',	'182',	'486 Yukon Dr.',	'DEFAULT',	'Sevierville',	'TN',	'37876'	)	;
INSERT INTO `events` VALUES(	'19',	'Billy Joel in Concert',	'2018-02-19',	'607',	'121',	'7418 York St.',	'DEFAULT',	'Chevy Chase',	'MD',	'20815'	)	;
INSERT INTO `events` VALUES(	'20',	'Where We Are Tour',	'2018-03-23',	'420',	'84',	'223 Shadow Brook Drive',	'DEFAULT',	'Morgantown',	'WV',	'26508'	)	;
INSERT INTO `events` VALUES(	'21',	'A Bigger Bang Tour',	'2018-03-26',	'932',	'186',	'656 Stonybrook Ave.',	'DEFAULT',	'Palm Beach Gardens',	'FL',	'33410'	)	;
INSERT INTO `events` VALUES(	'22',	'Black Ice World Tour',	'2018-04-11',	'131',	'26',	'528 East Fairview Drive',	'DEFAULT',	'Flint',	'MI',	'48504'	)	;
INSERT INTO `events` VALUES(	'23',	'Sticky & Sweet Tour',	'2018-04-19',	'844',	'169',	'267 Rockcrest Street',	'DEFAULT',	'Peabody',	'MA',	'1960'	)	;
INSERT INTO `events` VALUES(	'24',	'Vertigo Tour',	'2018-04-22',	'436',	'87',	'33 Berkshire Street',	'DEFAULT',	'Key West',	'FL',	'33040'	)	;
INSERT INTO `events` VALUES(	'25',	'The Police Reunion Tour',	'2018-04-27',	'762',	'152',	'7705 Old Third Street',	'DEFAULT',	'Perkasie',	'PA',	'18944'	)	;
INSERT INTO `events` VALUES(	'26',	'Licks Tour',	'2018-05-12',	'238',	'48',	'8902 Golden Star Ave.',	'DEFAULT',	'Port Charlotte',	'FL',	'33952'	)	;
INSERT INTO `events` VALUES(	'27',	'Taking Chances World Tour',	'2018-05-31',	'172',	'34',	'3 East Thorne St.',	'DEFAULT',	'Bluffton',	'SC',	'29910'	)	;
INSERT INTO `events` VALUES(	'28',	'Living Proof: The Farewell Tour',	'2018-06-03',	'404',	'81',	'442 West Summer Street',	'DEFAULT',	'Oxnard',	'CA',	'93035'	)	;
INSERT INTO `events` VALUES(	'29',	'Magic Tour',	'2018-07-11',	'238',	'48',	'179 Squaw Creek Street',	'DEFAULT',	'Goodlettsville',	'TN',	'37072'	)	;
INSERT INTO `events` VALUES(	'30',	'The Rising Tour',	'2018-07-17',	'622',	'124',	'6 Grand Street',	'DEFAULT',	'Fairport',	'NY',	'14450'	)	;
INSERT INTO `events` VALUES(	'31',	'Lost Highway Tour',	'2018-07-30',	'877',	'175',	'8368 North Fifth St.',	'DEFAULT',	'Mount Vernon',	'NY',	'10550'	)	;
INSERT INTO `events` VALUES(	'32',	'Confessions Tour',	'2018-08-09',	'565',	'113',	'13 Cooper Ave.',	'DEFAULT',	'Indianapolis',	'IN',	'46201'	)	;
INSERT INTO `events` VALUES(	'33',	'Working on a Dream Tour',	'2019-03-24',	'681',	'136',	'14 W. Myrtle Drive',	'DEFAULT',	'Shelton',	'CT',	'6484'	)	;
INSERT INTO `events` VALUES(	'34',	'Elevation Tour',	'2019-03-26',	'228',	'46',	'5 Philmont St.',	'DEFAULT',	'Menomonee Falls',	'WI',	'53051'	)	;
INSERT INTO `events` VALUES(	'35',	'Soul2Soul II Tour',	'2019-03-28',	'761',	'152',	'7 Edgemont St.',	'DEFAULT',	'Windsor',	'CT',	'6095'	)	;
INSERT INTO `events` VALUES(	'36',	'Tina!: 50th Anniversary Tour',	'2019-04-07',	'525',	'105',	'767 College St.',	'DEFAULT',	'Defiance',	'OH',	'43512'	)	;
INSERT INTO `events` VALUES(	'37',	'The Circus Starring Britney Spears',	'2019-04-18',	'785',	'157',	'7588 County Street',	'DEFAULT',	'Allison Park',	'PA',	'15101'	)	;
INSERT INTO `events` VALUES(	'38',	'Have a Nice Day Tour',	'2019-04-19',	'944',	'189',	'724 Yukon St.',	'DEFAULT',	'Ashland',	'OH',	'44805'	)	;
INSERT INTO `events` VALUES(	'39',	'Turn It On Again: The Tour',	'2019-05-04',	'83',	'17',	'7716 Proctor Drive',	'DEFAULT',	'Elizabethtown',	'PA',	'17022'	)	;
INSERT INTO `events` VALUES(	'40',	'FutureSex/LoveShow',	'2019-05-18',	'66',	'13',	'87 North Gonzales Drive',	'DEFAULT',	'Bedford',	'OH',	'44146'	)	;
INSERT INTO `events` VALUES(	'41',	'U2 360° Tour',	'2019-05-20',	'247',	'49',	'652 Iroquois Street',	'DEFAULT',	'Augusta',	'GA',	'30906'	)	;
INSERT INTO `events` VALUES(	'42',	'Not in This Lifetime... Tour',	'2019-06-04',	'582',	'116',	'382 Orchard St.',	'DEFAULT',	'Plymouth',	'MA',	'2360'	)	;
INSERT INTO `events` VALUES(	'43',	'÷ Tour',	'2019-06-11',	'151',	'30',	'394 4th Dr.',	'DEFAULT',	'Marquette',	'MI',	'49855'	)	;
INSERT INTO `events` VALUES(	'44',	'A Head Full of Dreams Tour',	'2019-06-14',	'731',	'146',	'33 Winding Way Drive',	'DEFAULT',	'Newport News',	'VA',	'23601'	)	;
INSERT INTO `events` VALUES(	'45',	'The Wall',	'2019-06-20',	'891',	'178',	'35 Rose Rd.',	'DEFAULT',	'East Meadow',	'NY',	'11554'	)	;
INSERT INTO `events` VALUES(	'46',	'Black Ice World Tour',	'2019-08-01',	'264',	'53',	'88 Shipley Drive',	'DEFAULT',	'Indian Trail',	'NC',	'28079'	)	;
INSERT INTO `events` VALUES(	'47',	'The Garth Brooks World Tour with Trisha Yearwood',	'2019-08-03',	'699',	'140',	'63 High Street',	'DEFAULT',	'Memphis',	'TN',	'38106'	)	;
INSERT INTO `events` VALUES(	'48',	'Wrecking Ball World Tour',	'2019-08-19',	'549',	'110',	'57 Pulaski St.',	'DEFAULT',	'Superior',	'WI',	'54880'	)	;
INSERT INTO `events` VALUES(	'49',	'Taylor Swifts Reputation Stadium Tour',	'2019-08-20',	'181',	'36',	'870 N. Hartford St.',	'DEFAULT',	'Hanover Park',	'IL',	'60133'	)	;
INSERT INTO `events` VALUES(	'50',	'The Joshua Tree Tour 2017',	'2019-08-25',	'515',	'103',	'8231 Green Lake Dr.',	'DEFAULT',	'Harrisburg',	'PA',	'17109'	)	;
INSERT INTO `events` VALUES(	'51',	'The River Tour 2016',	'2019-09-03',	'118',	'24',	'915 East Henry Smith Rd.',	'DEFAULT',	'Syosset',	'NY',	'11791'	)	;
INSERT INTO `events` VALUES(	'52',	'The MDNA Tour',	'2019-09-24',	'200',	'40',	'195 North Brickyard Street',	'DEFAULT',	'Yuma',	'AZ',	'85365'	)	;
INSERT INTO `events` VALUES(	'53',	'Billy Joel in Concert',	'2019-09-30',	'940',	'188',	'8920 York Lane',	'DEFAULT',	'Ooltewah',	'TN',	'37363'	)	;
INSERT INTO `events` VALUES(	'54',	'Where We Are Tour',	'2019-10-11',	'360',	'72',	'73 Clinton St.',	'DEFAULT',	'Beverly',	'MA',	'1915'	)	;
INSERT INTO `events` VALUES(	'55',	'Out There! Tour',	'2019-10-18',	'649',	'130',	'46 New Dr.',	'DEFAULT',	'Philadelphia',	'PA',	'19111'	)	;
INSERT INTO `events` VALUES(	'56',	'WorldWired Tour',	'2019-11-29',	'95',	'19',	'622 Wentworth Street',	'DEFAULT',	'Graham',	'NC',	'27253'	)	;
INSERT INTO `events` VALUES(	'57',	'Because We Can',	'2019-12-03',	'274',	'55',	'729 Birchwood St.',	'DEFAULT',	'Piscataway',	'NJ',	'8854'	)	;
INSERT INTO `events` VALUES(	'58',	'Purpose World Tour',	'2019-12-16',	'142',	'28',	'890 Winchester Street',	'DEFAULT',	'Halethorpe',	'MD',	'21227'	)	;
INSERT INTO `events` VALUES(	'59',	'The Formation World Tour',	'2019-12-23',	'508',	'102',	'880 Sunbeam Street',	'DEFAULT',	'Piscataway',	'NJ',	'8854'	)	;
INSERT INTO `events` VALUES(	'60',	'On the Run II Tour',	'2019-12-31',	'800',	'160',	'75 Sulphur Springs St.',	'DEFAULT',	'South Plainfield',	'NJ',	'7080'	)	;

INSERT INTO members_events VALUES(	'18',	'61'	)	;
INSERT INTO members_events VALUES(	'50',	'32'	)	;
INSERT INTO members_events VALUES(	'56',	'38'	)	;
INSERT INTO members_events VALUES(	'51',	'70'	)	;
INSERT INTO members_events VALUES(	'96',	'13'	)	;
INSERT INTO members_events VALUES(	'63',	'35'	)	;
INSERT INTO members_events VALUES(	'10',	'70'	)	;
INSERT INTO members_events VALUES(	'72',	'30'	)	;
INSERT INTO members_events VALUES(	'74',	'30'	)	;
INSERT INTO members_events VALUES(	'21',	'12'	)	;
INSERT INTO members_events VALUES(	'43',	'21'	)	;
INSERT INTO members_events VALUES(	'53',	'40'	)	;
INSERT INTO members_events VALUES(	'57',	'37'	)	;
INSERT INTO members_events VALUES(	'16',	'47'	)	;
INSERT INTO members_events VALUES(	'56',	'53'	)	;
INSERT INTO members_events VALUES(	'63',	'35'	)	;
INSERT INTO members_events VALUES(	'4',	'59'	)	;
INSERT INTO members_events VALUES(	'26',	'39'	)	;
INSERT INTO members_events VALUES(	'5',	'36'	)	;
INSERT INTO members_events VALUES(	'94',	'49'	)	;
INSERT INTO members_events VALUES(	'40',	'33'	)	;
INSERT INTO members_events VALUES(	'85',	'69'	)	;
INSERT INTO members_events VALUES(	'71',	'61'	)	;
INSERT INTO members_events VALUES(	'51',	'33'	)	;
INSERT INTO members_events VALUES(	'55',	'41'	)	;
INSERT INTO members_events VALUES(	'38',	'60'	)	;
INSERT INTO members_events VALUES(	'94',	'41'	)	;
INSERT INTO members_events VALUES(	'50',	'24'	)	;
INSERT INTO members_events VALUES(	'12',	'62'	)	;
INSERT INTO members_events VALUES(	'20',	'20'	)	;
INSERT INTO members_events VALUES(	'93',	'52'	)	;
INSERT INTO members_events VALUES(	'44',	'22'	)	;
INSERT INTO members_events VALUES(	'35',	'40'	)	;
INSERT INTO members_events VALUES(	'38',	'38'	)	;
INSERT INTO members_events VALUES(	'41',	'31'	)	;
INSERT INTO members_events VALUES(	'81',	'45'	)	;
INSERT INTO members_events VALUES(	'80',	'20'	)	;
INSERT INTO members_events VALUES(	'57',	'23'	)	;
INSERT INTO members_events VALUES(	'17',	'32'	)	;
INSERT INTO members_events VALUES(	'33',	'49'	)	;
INSERT INTO members_events VALUES(	'32',	'47'	)	;
INSERT INTO members_events VALUES(	'92',	'18'	)	;
INSERT INTO members_events VALUES(	'48',	'18'	)	;
INSERT INTO members_events VALUES(	'81',	'64'	)	;
INSERT INTO members_events VALUES(	'73',	'30'	)	;
INSERT INTO members_events VALUES(	'85',	'30'	)	;
INSERT INTO members_events VALUES(	'36',	'16'	)	;
INSERT INTO members_events VALUES(	'64',	'52'	)	;
INSERT INTO members_events VALUES(	'97',	'12'	)	;
INSERT INTO members_events VALUES(	'31',	'17'	)	;
INSERT INTO members_events VALUES(	'29',	'43'	)	;
INSERT INTO members_events VALUES(	'50',	'29'	)	;
INSERT INTO members_events VALUES(	'75',	'20'	)	;
INSERT INTO members_events VALUES(	'97',	'53'	)	;
INSERT INTO members_events VALUES(	'66',	'61'	)	;
INSERT INTO members_events VALUES(	'81',	'69'	)	;
INSERT INTO members_events VALUES(	'59',	'58'	)	;
INSERT INTO members_events VALUES(	'92',	'19'	)	;
INSERT INTO members_events VALUES(	'13',	'22'	)	;
INSERT INTO members_events VALUES(	'27',	'59'	)	;
INSERT INTO members_events VALUES(	'78',	'17'	)	;
INSERT INTO members_events VALUES(	'77',	'30'	)	;
INSERT INTO members_events VALUES(	'84',	'20'	)	;
INSERT INTO members_events VALUES(	'78',	'31'	)	;
INSERT INTO members_events VALUES(	'33',	'39'	)	;
INSERT INTO members_events VALUES(	'14',	'38'	)	;
INSERT INTO members_events VALUES(	'73',	'61'	)	;
INSERT INTO members_events VALUES(	'84',	'23'	)	;
INSERT INTO members_events VALUES(	'50',	'63'	)	;
INSERT INTO members_events VALUES(	'20',	'56'	)	;
INSERT INTO members_events VALUES(	'91',	'65'	)	;
INSERT INTO members_events VALUES(	'43',	'22'	)	;
INSERT INTO members_events VALUES(	'22',	'59'	)	;
INSERT INTO members_events VALUES(	'32',	'16'	)	;
INSERT INTO members_events VALUES(	'71',	'36'	)	;
INSERT INTO members_events VALUES(	'73',	'50'	)	;
INSERT INTO members_events VALUES(	'23',	'26'	)	;
INSERT INTO members_events VALUES(	'31',	'43'	)	;
INSERT INTO members_events VALUES(	'8',	'65'	)	;
INSERT INTO members_events VALUES(	'80',	'56'	)	;
INSERT INTO members_events VALUES(	'33',	'47'	)	;
INSERT INTO members_events VALUES(	'18',	'25'	)	;
INSERT INTO members_events VALUES(	'64',	'38'	)	;
INSERT INTO members_events VALUES(	'72',	'33'	)	;
INSERT INTO members_events VALUES(	'72',	'69'	)	;
INSERT INTO members_events VALUES(	'11',	'17'	)	;
INSERT INTO members_events VALUES(	'81',	'68'	)	;
INSERT INTO members_events VALUES(	'66',	'70'	)	;
INSERT INTO members_events VALUES(	'90',	'20'	)	;
INSERT INTO members_events VALUES(	'18',	'16'	)	;
INSERT INTO members_events VALUES(	'84',	'37'	)	;
INSERT INTO members_events VALUES(	'97',	'60'	)	;
INSERT INTO members_events VALUES(	'58',	'68'	)	;
INSERT INTO members_events VALUES(	'16',	'35'	)	;
INSERT INTO members_events VALUES(	'100',	'22'	)	;
INSERT INTO members_events VALUES(	'73',	'66'	)	;
INSERT INTO members_events VALUES(	'16',	'46'	)	;
INSERT INTO members_events VALUES(	'1',	'22'	)	;
INSERT INTO members_events VALUES(	'85',	'24'	)	;
INSERT INTO members_events VALUES(	'60',	'70'	)	;
INSERT INTO members_events VALUES(	'37',	'32'	)	;
INSERT INTO members_events VALUES(	'41',	'21'	)	;
INSERT INTO members_events VALUES(	'8',	'52'	)	;
INSERT INTO members_events VALUES(	'76',	'30'	)	;
INSERT INTO members_events VALUES(	'97',	'15'	)	;
INSERT INTO members_events VALUES(	'63',	'43'	)	;
INSERT INTO members_events VALUES(	'82',	'40'	)	;
INSERT INTO members_events VALUES(	'45',	'35'	)	;
INSERT INTO members_events VALUES(	'5',	'24'	)	;
INSERT INTO members_events VALUES(	'23',	'38'	)	;
INSERT INTO members_events VALUES(	'32',	'59'	)	;
INSERT INTO members_events VALUES(	'30',	'43'	)	;
INSERT INTO members_events VALUES(	'94',	'70'	)	;
INSERT INTO members_events VALUES(	'72',	'15'	)	;
INSERT INTO members_events VALUES(	'19',	'30'	)	;
INSERT INTO members_events VALUES(	'6',	'40'	)	;
INSERT INTO members_events VALUES(	'27',	'36'	)	;
INSERT INTO members_events VALUES(	'14',	'22'	)	;
INSERT INTO members_events VALUES(	'6',	'56'	)	;
INSERT INTO members_events VALUES(	'86',	'21'	)	;
INSERT INTO members_events VALUES(	'89',	'41'	)	;
INSERT INTO members_events VALUES(	'50',	'54'	)	;
INSERT INTO members_events VALUES(	'59',	'46'	)	;
INSERT INTO members_events VALUES(	'85',	'41'	)	;
INSERT INTO members_events VALUES(	'52',	'28'	)	;
INSERT INTO members_events VALUES(	'78',	'56'	)	;
INSERT INTO members_events VALUES(	'54',	'16'	)	;
INSERT INTO members_events VALUES(	'10',	'22'	)	;
INSERT INTO members_events VALUES(	'88',	'16'	)	;
INSERT INTO members_events VALUES(	'40',	'48'	)	;
INSERT INTO members_events VALUES(	'88',	'19'	)	;
INSERT INTO members_events VALUES(	'80',	'62'	)	;
INSERT INTO members_events VALUES(	'94',	'17'	)	;
INSERT INTO members_events VALUES(	'49',	'17'	)	;
INSERT INTO members_events VALUES(	'68',	'22'	)	;
INSERT INTO members_events VALUES(	'28',	'12'	)	;
INSERT INTO members_events VALUES(	'95',	'48'	)	;
INSERT INTO members_events VALUES(	'60',	'25'	)	;
INSERT INTO members_events VALUES(	'17',	'25'	)	;
INSERT INTO members_events VALUES(	'33',	'16'	)	;
INSERT INTO members_events VALUES(	'33',	'71'	)	;
INSERT INTO members_events VALUES(	'38',	'71'	)	;
INSERT INTO members_events VALUES(	'60',	'12'	)	;
INSERT INTO members_events VALUES(	'2',	'13'	)	;
INSERT INTO members_events VALUES(	'54',	'59'	)	;
INSERT INTO members_events VALUES(	'42',	'21'	)	;
INSERT INTO members_events VALUES(	'98',	'34'	)	;
INSERT INTO members_events VALUES(	'90',	'57'	)	;
INSERT INTO members_events VALUES(	'76',	'47'	)	;
INSERT INTO members_events VALUES(	'58',	'48'	)	;
INSERT INTO members_events VALUES(	'64',	'42'	)	;
INSERT INTO members_events VALUES(	'84',	'24'	)	;
INSERT INTO members_events VALUES(	'98',	'46'	)	;
INSERT INTO members_events VALUES(	'29',	'35'	)	;
INSERT INTO members_events VALUES(	'1',	'47'	)	;
INSERT INTO members_events VALUES(	'78',	'30'	)	;
INSERT INTO members_events VALUES(	'19',	'39'	)	;
INSERT INTO members_events VALUES(	'12',	'59'	)	;
INSERT INTO members_events VALUES(	'82',	'26'	)	;
INSERT INTO members_events VALUES(	'5',	'16'	)	;
INSERT INTO members_events VALUES(	'67',	'57'	)	;
INSERT INTO members_events VALUES(	'92',	'53'	)	;
INSERT INTO members_events VALUES(	'43',	'63'	)	;
INSERT INTO members_events VALUES(	'19',	'20'	)	;
INSERT INTO members_events VALUES(	'9',	'63'	)	;
INSERT INTO members_events VALUES(	'12',	'56'	)	;
INSERT INTO members_events VALUES(	'8',	'13'	)	;
INSERT INTO members_events VALUES(	'90',	'43'	)	;
INSERT INTO members_events VALUES(	'76',	'26'	)	;
INSERT INTO members_events VALUES(	'27',	'22'	)	;
INSERT INTO members_events VALUES(	'30',	'43'	)	;
INSERT INTO members_events VALUES(	'60',	'13'	)	;
INSERT INTO members_events VALUES(	'12',	'20'	)	;
INSERT INTO members_events VALUES(	'14',	'29'	)	;
INSERT INTO members_events VALUES(	'76',	'67'	)	;
INSERT INTO members_events VALUES(	'33',	'32'	)	;
INSERT INTO members_events VALUES(	'66',	'34'	)	;
INSERT INTO members_events VALUES(	'41',	'16'	)	;
INSERT INTO members_events VALUES(	'53',	'46'	)	;
INSERT INTO members_events VALUES(	'8',	'13'	)	;
INSERT INTO members_events VALUES(	'85',	'22'	)	;
INSERT INTO members_events VALUES(	'51',	'62'	)	;
INSERT INTO members_events VALUES(	'36',	'43'	)	;
INSERT INTO members_events VALUES(	'34',	'14'	)	;
INSERT INTO members_events VALUES(	'36',	'65'	)	;
INSERT INTO members_events VALUES(	'65',	'57'	)	;
INSERT INTO members_events VALUES(	'88',	'43'	)	;
INSERT INTO members_events VALUES(	'19',	'71'	)	;
INSERT INTO members_events VALUES(	'23',	'14'	)	;
INSERT INTO members_events VALUES(	'70',	'26'	)	;
INSERT INTO members_events VALUES(	'18',	'57'	)	;
INSERT INTO members_events VALUES(	'44',	'38'	)	;
INSERT INTO members_events VALUES(	'20',	'32'	)	;
INSERT INTO members_events VALUES(	'93',	'46'	)	;
INSERT INTO members_events VALUES(	'4',	'32'	)	;
INSERT INTO members_events VALUES(	'32',	'40'	)	;
INSERT INTO members_events VALUES(	'96',	'21'	)	;
INSERT INTO members_events VALUES(	'93',	'57'	)	;
INSERT INTO members_events VALUES(	'74',	'46'	)	;
INSERT INTO members_events VALUES(	'34',	'18'	)	;
INSERT INTO members_events VALUES(	'67',	'47'	)	;
INSERT INTO members_events VALUES(	'32',	'25'	)	;
INSERT INTO members_events VALUES(	'38',	'33'	)	;
INSERT INTO members_events VALUES(	'34',	'13'	)	;
INSERT INTO members_events VALUES(	'26',	'41'	)	;
INSERT INTO members_events VALUES(	'78',	'70'	)	;
INSERT INTO members_events VALUES(	'12',	'60'	)	;
INSERT INTO members_events VALUES(	'47',	'67'	)	;
INSERT INTO members_events VALUES(	'18',	'29'	)	;
INSERT INTO members_events VALUES(	'19',	'53'	)	;
INSERT INTO members_events VALUES(	'58',	'42'	)	;
INSERT INTO members_events VALUES(	'56',	'61'	)	;
INSERT INTO members_events VALUES(	'80',	'48'	)	;
INSERT INTO members_events VALUES(	'3',	'48'	)	;
INSERT INTO members_events VALUES(	'41',	'15'	)	;
INSERT INTO members_events VALUES(	'56',	'57'	)	;
INSERT INTO members_events VALUES(	'49',	'55'	)	;
INSERT INTO members_events VALUES(	'67',	'38'	)	;
INSERT INTO members_events VALUES(	'7',	'44'	)	;
INSERT INTO members_events VALUES(	'19',	'26'	)	;
INSERT INTO members_events VALUES(	'5',	'12'	)	;
INSERT INTO members_events VALUES(	'21',	'34'	)	;
INSERT INTO members_events VALUES(	'82',	'36'	)	;
INSERT INTO members_events VALUES(	'77',	'45'	)	;
INSERT INTO members_events VALUES(	'73',	'46'	)	;
INSERT INTO members_events VALUES(	'45',	'12'	)	;
INSERT INTO members_events VALUES(	'82',	'40'	)	;
INSERT INTO members_events VALUES(	'20',	'28'	)	;
INSERT INTO members_events VALUES(	'4',	'54'	)	;
INSERT INTO members_events VALUES(	'54',	'22'	)	;
INSERT INTO members_events VALUES(	'6',	'36'	)	;

INSERT INTO merchandise_tickets VALUES(	'1',	'Bag',	'25',	'36',	'FON'	)	;
INSERT INTO merchandise_tickets VALUES(	'2',	'Ball',	'41',	'37',	'FON'	)	;
INSERT INTO merchandise_tickets VALUES(	'3',	'Belt',	'40',	'13',	'Versace'	)	;
INSERT INTO merchandise_tickets VALUES(	'4',	'Blazer',	'40',	'36',	'Prada'	)	;
INSERT INTO merchandise_tickets VALUES(	'5',	'Blouse',	'27',	'31',	'Prada'	)	;
INSERT INTO merchandise_tickets VALUES(	'6',	'Boots',	'15',	'22',	'Fendy'	)	;
INSERT INTO merchandise_tickets VALUES(	'7',	'Cardigan',	'26',	'20',	'USPA'	)	;
INSERT INTO merchandise_tickets VALUES(	'8',	'Cargos',	'20',	'10',	'FON'	)	;
INSERT INTO merchandise_tickets VALUES(	'9',	'Coat',	'27',	'45',	'FON'	)	;
INSERT INTO merchandise_tickets VALUES(	'10',	'Cravat',	'11',	'36',	'Versace'	)	;
INSERT INTO merchandise_tickets VALUES(	'11',	'Cufflinks',	'11',	'35',	'Prada'	)	;
INSERT INTO merchandise_tickets VALUES(	'12',	'Cummerbund',	'23',	'71',	'U2'	)	;
INSERT INTO merchandise_tickets VALUES(	'13',	'U2 360° Tour',	'45',	'188',	'Ed Sheeran'	)	;
INSERT INTO merchandise_tickets VALUES(	'14',	'÷ Tour',	'43',	'38',	'Guns N Roses'	)	;
INSERT INTO merchandise_tickets VALUES(	'15',	'Not in This Lifetime... Tour',	'17',	'121',	'The Rolling Stones'	)	;
INSERT INTO merchandise_tickets VALUES(	'16',	'A Bigger Bang Tour',	'10',	'147',	'Coldplay'	)	;
INSERT INTO merchandise_tickets VALUES(	'17',	'A Head Full of Dreams Tour',	'33',	'745',	'Roger Waters'	)	;
INSERT INTO merchandise_tickets VALUES(	'18',	'The Wall Live',	'38',	'398',	'AC/DC'	)	;
INSERT INTO merchandise_tickets VALUES(	'19',	'Black Ice World Tour',	'28',	'366',	'Madonna'	)	;
INSERT INTO merchandise_tickets VALUES(	'20',	'Sticky & Sweet Tour',	'23',	'463',	'U2'	)	;
INSERT INTO merchandise_tickets VALUES(	'21',	'Vertigo Tour',	'49',	'615',	'Garth Brooks and Trisha Yearwood'	)	;
INSERT INTO merchandise_tickets VALUES(	'22',	'World Tour',	'48',	'614',	'The Police'	)	;
INSERT INTO merchandise_tickets VALUES(	'23',	'The Police Reunion Tour',	'44',	'172',	'Bruce Springsteen and the E Street Band'	)	;
INSERT INTO merchandise_tickets VALUES(	'24',	'Wrecking Ball World Tour',	'28',	'396',	'Taylor Swift'	)	;
INSERT INTO merchandise_tickets VALUES(	'25',	'Taylor Swifts Reputation Stadium Tour',	'21',	'633',	'The Rolling Stones'	)	;
INSERT INTO merchandise_tickets VALUES(	'26',	'Voodoo Lounge Tour',	'18',	'111',	'U2'	)	;
INSERT INTO merchandise_tickets VALUES(	'27',	'The Joshua Tree Tour 2017',	'16',	'488',	'The Rolling Stones'	)	;
INSERT INTO merchandise_tickets VALUES(	'28',	'Licks Tour',	'50',	'582',	'Bruce Springsteen and the E Street Band'	)	;
INSERT INTO merchandise_tickets VALUES(	'29',	'The River Tour 2016',	'27',	'728',	'Madonna'	)	;
INSERT INTO merchandise_tickets VALUES(	'30',	'The MDNA Tour',	'31',	'486',	'Billy Joel'	)	;
INSERT INTO merchandise_tickets VALUES(	'31',	'Billy Joel in Concert',	'40',	'336',	'One Direction'	)	;
INSERT INTO merchandise_tickets VALUES(	'32',	'Where We Are Tour',	'26',	'746',	'The Rolling Stones'	)	;
INSERT INTO merchandise_tickets VALUES(	'33',	'A Bigger Bang Tour',	'22',	'105',	'AC/DC'	)	;
INSERT INTO merchandise_tickets VALUES(	'34',	'Black Ice World Tour',	'41',	'675',	'Madonna'	)	;
INSERT INTO merchandise_tickets VALUES(	'35',	'Sticky & Sweet Tour',	'48',	'349',	'U2'	)	;
INSERT INTO merchandise_tickets VALUES(	'36',	'Vertigo Tour',	'28',	'610',	'The Police'	)	;
INSERT INTO merchandise_tickets VALUES(	'37',	'The Police Reunion Tour',	'35',	'190',	'The Rolling Stones'	)	;
INSERT INTO merchandise_tickets VALUES(	'38',	'Licks Tour',	'17',	'138',	'Celine Dion'	)	;
INSERT INTO merchandise_tickets VALUES(	'39',	'Taking Chances World Tour',	'27',	'323',	'Cher'	)	;
INSERT INTO merchandise_tickets VALUES(	'40',	'Living Proof: The Farewell Tour',	'26',	'190',	'Bruce Springsteen and the E Street Band'	)	;
INSERT INTO merchandise_tickets VALUES(	'41',	'Magic Tour',	'34',	'498',	'Bruce Springsteen and the E Street Band'	)	;
INSERT INTO merchandise_tickets VALUES(	'42',	'The Rising Tour',	'47',	'702',	'Bon Jovi'	)	;
INSERT INTO merchandise_tickets VALUES(	'43',	'Lost Highway Tour',	'18',	'452',	'Madonna'	)	;
INSERT INTO merchandise_tickets VALUES(	'44',	'Confessions Tour',	'21',	'545',	'Bruce Springsteen and the E Street Band'	)	;
INSERT INTO merchandise_tickets VALUES(	'45',	'Working on a Dream Tour',	'46',	'182',	'U2'	)	;
INSERT INTO merchandise_tickets VALUES(	'46',	'Elevation Tour',	'28',	'609',	'Tim McGraw and Faith Hill'	)	;
INSERT INTO merchandise_tickets VALUES(	'47',	'Soul2Soul II Tour',	'11',	'420',	'Tina Turner'	)	;
INSERT INTO merchandise_tickets VALUES(	'48',	'Tina!: 50th Anniversary Tour',	'15',	'628',	'Britney Spears'	)	;
INSERT INTO merchandise_tickets VALUES(	'49',	'The Circus Starring Britney Spears',	'20',	'755',	'Bon Jovi'	)	;
INSERT INTO merchandise_tickets VALUES(	'50',	'Have a Nice Day Tour',	'10',	'66',	'Genesis'	)	;
INSERT INTO merchandise_tickets VALUES(	'51',	'Turn It On Again: The Tour',	'41',	'53',	'Justin Timberlake'	)	;
INSERT INTO merchandise_tickets VALUES(	'52',	'FutureSex/LoveShow',	'16',	'198',	'The Rolling Stones'	)	;
INSERT INTO merchandise_tickets VALUES(	'53',	'U2 360° Tour',	'25',	'466',	'AC/DC'	)	;
INSERT INTO merchandise_tickets VALUES(	'54',	'Not in This Lifetime... Tour',	'19',	'121',	'Madonna'	)	;
INSERT INTO merchandise_tickets VALUES(	'55',	'A Head Full of Dreams Tour',	'29',	'585',	'U2'	)	;
INSERT INTO merchandise_tickets VALUES(	'56',	'The Wall',	'20',	'713',	'The Police'	)	;
INSERT INTO merchandise_tickets VALUES(	'57',	'Black Ice World Tour',	'17',	'211',	'The Rolling Stones'	)	;
INSERT INTO merchandise_tickets VALUES(	'58',	'The Garth Brooks World Tour with Trisha Yearwood',	'21',	'559',	'Celine Dion'	)	;
INSERT INTO merchandise_tickets VALUES(	'59',	'Wrecking Ball World Tour',	'34',	'439',	'Cher'	)	;
INSERT INTO merchandise_tickets VALUES(	'60',	'Taylor Swifts Reputation Stadium Tour',	'46',	'145',	'Bruce Springsteen and the E Street Band'	)	;
INSERT INTO merchandise_tickets VALUES(	'61',	'The Joshua Tree Tour 2017',	'20',	'412',	'Bruce Springsteen and the E Street Band'	)	;
INSERT INTO merchandise_tickets VALUES(	'62',	'The River Tour 2016',	'36',	'94',	'Bon Jovi'	)	;
INSERT INTO merchandise_tickets VALUES(	'63',	'The MDNA Tour',	'25',	'160',	'Madonna'	)	;
INSERT INTO merchandise_tickets VALUES(	'64',	'Billy Joel in Concert',	'26',	'752',	'Bruce Springsteen and the E Street Band'	)	;
INSERT INTO merchandise_tickets VALUES(	'65',	'Where We Are Tour',	'30',	'288',	'U2'	)	;
INSERT INTO merchandise_tickets VALUES(	'66',	'Out There! Tour',	'32',	'519',	'Tim McGraw and Faith Hill'	)	;
INSERT INTO merchandise_tickets VALUES(	'67',	'WorldWired Tour',	'32',	'76',	'Tina Turner'	)	;
INSERT INTO merchandise_tickets VALUES(	'68',	'Because We Can',	'50',	'219',	'Britney Spears'	)	;
INSERT INTO merchandise_tickets VALUES(	'69',	'Purpose World Tour',	'19',	'114',	'Bon Jovi'	)	;
INSERT INTO merchandise_tickets VALUES(	'70',	'The Formation World Tour',	'28',	'406',	'Genesis'	)	;
INSERT INTO merchandise_tickets VALUES(	'71',	'On the Run II Tour',	'40',	'640',	'Justin Timberlake'	)	;

INSERT INTO memebrs_merch_tick VALUES(	'15',	'6'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'40',	'5'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'56',	'11'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'88',	'4'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'64',	'7'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'26',	'2'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'57',	'5'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'53',	'5'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'70',	'8'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'25',	'7'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'87',	'1'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'3',	'1'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'84',	'1'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'58',	'3'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'42',	'8'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'84',	'5'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'74',	'6'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'57',	'10'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'22',	'3'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'1',	'1'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'95',	'2'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'55',	'8'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'51',	'7'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'74',	'2'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'4',	'6'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'8',	'1'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'47',	'9'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'37',	'2'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'92',	'4'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'57',	'9'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'93',	'4'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'8',	'10'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'89',	'6'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'6',	'9'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'5',	'4'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'69',	'4'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'10',	'7'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'51',	'2'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'45',	'1'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'3',	'7'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'6',	'4'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'66',	'4'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'86',	'3'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'79',	'5'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'97',	'4'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'98',	'7'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'54',	'4'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'24',	'4'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'24',	'1'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'68',	'11'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'59',	'11'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'83',	'9'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'57',	'3'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'46',	'7'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'100',	'1'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'86',	'6'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'14',	'8'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'55',	'3'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'61',	'10'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'61',	'1'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'23',	'5'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'32',	'8'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'98',	'2'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'17',	'3'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'30',	'4'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'96',	'4'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'6',	'5'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'94',	'7'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'7',	'8'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'71',	'10'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'11',	'10'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'8',	'11'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'70',	'6'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'52',	'6'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'88',	'3'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'19',	'1'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'16',	'9'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'4',	'11'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'25',	'9'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'24',	'7'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'97',	'7'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'10',	'11'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'31',	'3'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'94',	'6'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'50',	'2'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'93',	'10'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'82',	'6'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'26',	'7'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'56',	'1'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'40',	'8'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'11',	'2'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'68',	'2'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'62',	'6'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'29',	'1'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'61',	'9'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'56',	'10'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'2',	'11'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'17',	'8'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'22',	'6'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'49',	'7'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'51',	'3'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'42',	'7'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'32',	'8'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'70',	'8'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'57',	'2'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'21',	'10'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'93',	'4'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'76',	'8'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'96',	'6'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'40',	'11'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'17',	'2'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'6',	'11'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'75',	'8'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'65',	'6'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'75',	'10'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'65',	'5'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'3',	'10'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'85',	'4'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'6',	'6'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'51',	'6'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'4',	'3'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'84',	'3'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'61',	'7'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'74',	'5'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'99',	'4'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'58',	'9'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'79',	'6'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'21',	'9'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'86',	'9'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'10',	'6'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'27',	'10'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'61',	'2'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'86',	'9'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'30',	'3'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'6',	'6'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'79',	'1'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'75',	'11'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'92',	'1'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'12',	'6'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'1',	'6'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'69',	'8'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'67',	'2'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'78',	'4'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'27',	'1'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'62',	'2'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'9',	'7'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'1',	'8'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'39',	'8'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'98',	'5'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'90',	'11'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'72',	'1'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'29',	'3'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'13',	'9'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'96',	'11'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'97',	'1'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'29',	'10'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'27',	'11'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'47',	'11'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'93',	'9'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'6',	'2'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'94',	'9'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'78',	'7'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'62',	'9'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'32',	'8'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'5',	'2'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'18',	'6'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'1',	'9'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'20',	'11'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'25',	'10'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'35',	'4'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'34',	'9'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'27',	'4'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'29',	'6'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'39',	'8'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'5',	'1'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'32',	'2'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'100',	'8'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'11',	'3'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'88',	'6'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'76',	'2'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'3',	'7'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'99',	'3'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'9',	'3'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'68',	'10'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'31',	'1'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'100',	'8'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'43',	'5'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'12',	'4'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'38',	'9'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'99',	'5'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'32',	'8'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'87',	'1'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'13',	'4'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'34',	'11'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'42',	'10'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'2',	'8'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'97',	'8'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'5',	'10'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'64',	'9'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'7',	'11'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'8',	'3'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'91',	'10'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'13',	'3'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'93',	'10'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'36',	'3'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'16',	'7'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'15',	'2'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'79',	'4'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'58',	'10'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'55',	'6'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'42',	'7'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'97',	'5'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'67',	'5'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'9',	'1'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'81',	'8'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'81',	'1'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'90',	'1'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'93',	'9'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'47',	'4'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'19',	'2'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'26',	'6'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'34',	'10'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'15',	'2'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'16',	'2'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'17',	'11'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'43',	'10'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'80',	'10'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'4',	'4'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'7',	'6'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'5',	'6'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'41',	'10'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'67',	'11'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'79',	'7'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'94',	'8'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'100',	'10'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'64',	'8'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'27',	'7'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'50',	'11'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'99',	'7'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'74',	'4'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'40',	'4'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'13',	'4'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'64',	'4'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'9',	'3'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'49',	'9'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'3',	'11'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'19',	'4'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'63',	'8'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'60',	'11'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'42',	'5'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'4',	'7'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'70',	'9'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'95',	'9'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'59',	'9'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'51',	'10'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'60',	'8'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'77',	'4'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'7',	'3'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'14',	'10'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'21',	'6'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'45',	'9'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'77',	'11'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'52',	'10'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'72',	'3'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'83',	'3'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'7',	'7'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'44',	'8'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'76',	'5'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'15',	'10'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'98',	'10'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'83',	'3'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'51',	'5'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'17',	'8'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'6',	'9'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'4',	'3'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'71',	'6'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'29',	'5'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'83',	'4'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'48',	'10'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'45',	'4'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'78',	'2'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'53',	'6'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'100',	'8'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'71',	'4'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'44',	'6'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'94',	'2'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'72',	'6'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'58',	'1'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'55',	'2'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'13',	'11'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'98',	'2'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'72',	'3'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'91',	'2'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'58',	'6'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'82',	'9'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'86',	'6'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'47',	'9'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'65',	'1'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'36',	'2'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'15',	'9'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'59',	'1'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'3',	'11'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'57',	'9'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'88',	'9'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'3',	'4'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'37',	'8'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'18',	'61'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'50',	'32'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'56',	'38'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'51',	'70'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'96',	'13'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'63',	'35'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'10',	'70'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'72',	'30'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'74',	'30'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'21',	'12'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'43',	'21'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'53',	'40'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'57',	'37'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'16',	'47'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'56',	'53'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'63',	'35'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'4',	'59'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'26',	'39'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'5',	'36'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'94',	'49'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'40',	'33'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'85',	'69'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'71',	'61'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'51',	'33'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'55',	'41'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'38',	'60'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'94',	'41'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'50',	'24'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'12',	'62'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'20',	'20'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'93',	'52'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'44',	'22'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'35',	'40'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'38',	'38'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'41',	'31'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'81',	'45'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'80',	'20'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'57',	'23'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'17',	'32'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'33',	'49'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'32',	'47'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'92',	'18'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'48',	'18'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'81',	'64'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'73',	'30'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'85',	'30'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'36',	'16'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'64',	'52'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'97',	'12'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'31',	'17'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'29',	'43'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'50',	'29'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'75',	'20'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'97',	'53'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'66',	'61'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'81',	'69'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'59',	'58'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'92',	'19'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'13',	'22'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'27',	'59'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'78',	'17'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'77',	'30'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'84',	'20'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'78',	'31'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'33',	'39'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'14',	'38'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'73',	'61'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'84',	'23'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'50',	'63'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'20',	'56'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'91',	'65'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'43',	'22'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'22',	'59'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'32',	'16'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'71',	'36'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'73',	'50'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'23',	'26'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'31',	'43'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'8',	'65'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'80',	'56'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'33',	'47'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'18',	'25'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'64',	'38'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'72',	'33'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'72',	'69'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'11',	'17'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'81',	'68'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'66',	'70'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'90',	'20'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'18',	'16'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'84',	'37'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'97',	'60'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'58',	'68'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'16',	'35'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'100',	'22'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'73',	'66'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'16',	'46'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'1',	'22'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'85',	'24'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'60',	'70'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'37',	'32'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'41',	'21'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'8',	'52'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'76',	'30'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'97',	'15'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'63',	'43'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'82',	'40'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'45',	'35'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'5',	'24'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'23',	'38'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'32',	'59'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'30',	'43'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'94',	'70'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'72',	'15'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'19',	'30'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'6',	'40'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'27',	'36'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'14',	'22'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'6',	'56'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'86',	'21'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'89',	'41'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'50',	'54'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'59',	'46'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'85',	'41'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'52',	'28'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'78',	'56'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'54',	'16'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'10',	'22'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'88',	'16'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'40',	'48'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'88',	'19'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'80',	'62'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'94',	'17'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'49',	'17'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'68',	'22'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'28',	'12'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'95',	'48'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'60',	'25'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'17',	'25'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'33',	'16'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'33',	'71'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'38',	'71'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'60',	'12'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'2',	'13'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'54',	'59'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'42',	'21'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'98',	'34'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'90',	'57'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'76',	'47'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'58',	'48'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'64',	'42'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'84',	'24'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'98',	'46'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'29',	'35'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'1',	'47'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'78',	'30'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'19',	'39'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'12',	'59'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'82',	'26'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'5',	'16'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'67',	'57'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'92',	'53'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'43',	'63'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'19',	'20'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'9',	'63'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'12',	'56'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'8',	'13'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'90',	'43'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'76',	'26'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'27',	'22'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'30',	'43'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'60',	'13'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'12',	'20'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'14',	'29'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'76',	'67'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'33',	'32'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'66',	'34'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'41',	'16'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'53',	'46'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'8',	'13'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'85',	'22'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'51',	'62'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'36',	'43'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'34',	'14'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'36',	'65'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'65',	'57'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'88',	'43'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'19',	'71'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'23',	'14'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'70',	'26'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'18',	'57'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'44',	'38'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'20',	'32'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'93',	'46'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'4',	'32'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'32',	'40'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'96',	'21'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'93',	'57'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'74',	'46'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'34',	'18'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'67',	'47'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'32',	'25'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'38',	'33'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'34',	'13'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'26',	'41'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'78',	'70'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'12',	'60'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'47',	'67'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'18',	'29'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'19',	'53'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'58',	'42'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'56',	'61'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'80',	'48'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'3',	'48'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'41',	'15'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'56',	'57'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'49',	'55'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'67',	'38'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'7',	'44'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'19',	'26'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'5',	'12'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'21',	'34'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'82',	'36'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'77',	'45'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'73',	'46'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'45',	'12'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'82',	'40'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'20',	'28'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'4',	'54'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'54',	'22'	)	;
INSERT INTO memebrs_merch_tick VALUES(	'6',	'36'	)	;

INSERT INTO `admin` VALUES(	'Andre',	'LastName',	'andre@fon.com',	'password2019'	)	;















