USE ojonah;
ALTER DATABASE ojonah CHARACTER SET utf8 COLLATE utf8_unicode_ci;
DROP TABLE IF EXISTS BET;
DROP TABLE IF EXISTS SPORT;
DROP TABLE IF EXISTS USER;

CREATE TABLE `USER` (
	`userId` BINARY(16) NOT NULL ,
	`userEmail` VARCHAR(128) NOT NULL ,
	`userFirstName` VARCHAR(30) NOT NULL ,
	`userLastName` VARCHAR(30) NOT NULL,
	PRIMARY KEY (userId),
	UNIQUE (userEmail),
	INDEX (userEmail)
);

CREATE TABLE `SPORT` (
	`sportId` BINARY(16) NOT NULL ,
	`sportLeague` VARCHAR(30) NOT NULL ,
	`sportName` VARCHAR(30) NOT NULL,
	PRIMARY KEY (sportId),
	INDEX (sportName,sportLeague)
);

CREATE TABLE `BET` (
	`betId` BINARY(16) NOT NULL ,
	`betUserId` BINARY(16) NOT NULL ,
	`betType` VARCHAR(15) NOT NULL ,
	`betSportId` BINARY(16) NOT NULL,
	PRIMARY KEY (betId),
	FOREIGN KEY (betSportId) REFERENCES SPORT(sportId),
	FOREIGN KEY (betUserId) REFERENCES USER(userId),
INDEX (betSportId,betUserId)
);

