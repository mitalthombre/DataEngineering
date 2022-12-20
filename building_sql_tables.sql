create database e_scooter;

USE e_scooter;

CREATE TABLE cities(
	cityid INT NOT NULL AUTO_INCREMENT,
	city VARCHAR(30),
    city_ascii VARCHAR(30),
    lat FLOAT(4),
    lng FLOAT(4),
    country VARCHAR(30),
    iso2 VARCHAR(2),
    iso3 VARCHAR(3),
    admin_name VARCHAR(50),
    population INT,
	PRIMARY KEY (cityid)
);

CREATE TABLE weather(
  `cityid` INT NULL DEFAULT NULL,
  `country` TEXT NULL DEFAULT NULL,
  `rain` TEXT NULL DEFAULT NULL,
  `temperature` DOUBLE NULL DEFAULT NULL,
  `time_for_forecast` DATETIME NULL DEFAULT NULL,
  `weatherid` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`weatherid`),
  FOREIGN KEY (cityid) REFERENCES cities(cityid)
);

CREATE TABLE airports(
	cityid INT,
    icao VARCHAR(4),
    PRIMARY KEY (icao),
    FOREIGN KEY (cityid) REFERENCES cities(cityid)
);

CREATE TABLE flights(
	flightid INT NOT NULL AUTO_INCREMENT,
	arrival_icao VARCHAR(4),
	`arrival.scheduledTimeLocal` DATETIME, 
	`number` VARCHAR(10), 
	`status` VARCHAR(20),
	`aircraft.model` VARCHAR(100), 
	`airline.name` VARCHAR(30), 
	codeshareStatus VARCHAR(30),
	PRIMARY KEY (flightid),
    FOREIGN KEY (arrival_icao) REFERENCES airports(icao)
);