use foodblog;
CREATE TABLE foodblogger (
	username varchar(30) NOT NULL,
	password varchar(30) NOT NULL,
	firstName varchar(30) NOT NULL,
	lastName varchar(30) NOT NULL,
	email varchar(40) NOT NULL,
	PRIMARY KEY (username)
);
CREATE TABLE blog (
	headline varchar(250) NOT NULL,
	username varchar(50) NOT NULL,
	body longtext,
	date datetime default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (headline)
);
