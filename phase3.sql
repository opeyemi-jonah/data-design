USE ojonah;
ALTER DATABASE ojonah CHARACTER SET utf8 COLLATE utf8_unicode_ci;
DROP TABLE IF EXISTS bet;
DROP TABLE IF EXISTS sport;
DROP TABLE IF EXISTS user;

CREATE TABLE `user` (
	`userId` BINARY(16) NOT NULL ,
	`userEmail` VARCHAR(128) NOT NULL ,
	`userFirstName` VARCHAR(30) NOT NULL ,
	`userLastName` VARCHAR(30) NOT NULL,
	PRIMARY KEY (userId),
	UNIQUE (userEmail),
	INDEX (userEmail)
);

CREATE TABLE `sport` (
	`sportId` BINARY(16) NOT NULL ,
	`sportLeague` VARCHAR(30) NOT NULL ,
	`sportName` VARCHAR(30) NOT NULL,
	PRIMARY KEY (sportId),
	INDEX (sportName),
	INDEX(sportLeague)
);

CREATE TABLE `bet` (
	`betId` BINARY(16) NOT NULL ,
	`betUserId` BINARY(16) NOT NULL ,
	`betType` VARCHAR(15) NOT NULL ,
	`betSportId` BINARY(16) NOT NULL,
	PRIMARY KEY (betId),
	FOREIGN KEY (betSportId) REFERENCES sport(sportId),
	FOREIGN KEY (betUserId) REFERENCES user(userId),
INDEX (betSportId),
INDEX(betUserId)
);

