--Mustafa Ajmal

CREATE TABLE Lab1.Persons (
    personID INT PRIMARY KEY,
    personName VARCHAR(40),
    personAddress VARCHAR(60),
    birthDate DATE
);

CREATE TABLE Lab1.Actors (
    actorID INT PRIMARY KEY REFERENCES Lab1.Persons(personID),
    isActorsEquity BOOLEAN,
    equityJoinDate DATE,
    roleCount INT
);

CREATE TABLE Lab1.ShakespearePlays (
    playTitle VARCHAR(40) PRIMARY KEY,
    yearWritten INT,
    category CHAR(1)
);

CREATE TABLE Lab1.Characters (
    playTitle VARCHAR(40) REFERENCES Lab1.ShakespearePlays(playTitle),
    characterName VARCHAR(40),
    PRIMARY KEY (playTitle, characterName)
);

CREATE TABLE Lab1.Theaters (
    theaterID INT PRIMARY KEY,
    theaterName VARCHAR(40),
    theaterAddress VARCHAR(60),
    theaterFeePerDay NUMERIC(4,2)
);

CREATE TABLE Lab1.Productions (
    playTitle VARCHAR(40) REFERENCES Lab1.ShakespearePlays(playTitle),
    productionNum INT,
    directorID INT REFERENCES Lab1.Persons(personID),
    theaterID INT REFERENCES Lab1.Theaters(theaterID),
    productionStartDate DATE,
    productionEndDate DATE,
    PRIMARY KEY (playTitle, productionNum)
);

CREATE TABLE Lab1.CastMembers (
    playTitle VARCHAR(40),
    productionNum INT,
    actorID INT REFERENCES Lab1.Actors(actorID),
    salaryPerDay NUMERIC(3,2),
    applausePosition INT,
    PRIMARY KEY (playTitle, productionNum, actorID),
    FOREIGN KEY (playTitle, productionNum) REFERENCES Lab1.Productions(playTitle, productionNum)
);

CREATE TABLE Lab1.Roles (
    playTitle VARCHAR(40),
    productionNum INT,
    actorID INT,
    characterName VARCHAR(40),
    PRIMARY KEY (playTitle, productionNum, actorID, characterName),
    FOREIGN KEY (playTitle, productionNum, actorID) REFERENCES Lab1.CastMembers(playTitle, productionNum, actorID),
    FOREIGN KEY (playTitle, characterName) REFERENCES Lab1.Characters(playTitle, characterName)
);
