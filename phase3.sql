USE ojonah;
ALTER DATABASE ojonah CHARACTER SET utf8 COLLATE utf8_unicode_ci;
DROP TABLE IF EXISTS BET;
DROP TABLE IF EXISTS SPORT;
DROP TABLE IF EXISTS USER;

CREATE TABLE `USER` (
	`userId` BINARY(16) NOT NULL ,
	`userEmail` VARCHAR(30) NOT NULL ,
	`userFirstName` VARCHAR(30) NOT NULL ,
	`userLastName` VARCHAR(30) NOT NULL,
	PRIMARY KEY (userId),
	UNIQUE (userEmail,userId),
	INDEX (userEmail)
);

CREATE TABLE `SPORT` (
	`sportId` BINARY(32) NOT NULL ,
	`sportBetType` VARCHAR(15) NOT NULL ,
	`sportLeague` VARCHAR(25) NOT NULL ,
	`sportName` VARCHAR(15) NOT NULL,
	PRIMARY KEY (sportId),
	UNIQUE (sportBetType),
	INDEX (sportName,sportLeague)
);

CREATE TABLE `BET` (
	`betId` BINARY(16) NOT NULL ,
	`betUserId` BINARY(32) NOT NULL ,
	`betType` VARCHAR(15) NOT NULL ,
	`betSportId` BINARY(16) NOT NULL,
	PRIMARY KEY (betId),
	FOREIGN KEY (betSportId) REFERENCES SPORT(sportId),
	FOREIGN KEY (betType) REFERENCES SPORT(sportBetType),
	FOREIGN KEY (betUserId) REFERENCES USER(userId)
);

