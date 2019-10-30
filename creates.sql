CREATE DATABASE baseball;

USE baseball;

CREATE TABLE teams (
  id INT AUTO_INCREMENT,
  location VARCHAR(255),
  mascot VARCHAR(255),
  abbreviation VARCHAR(3),
  league ENUM('AL', 'NL') NOT NULL,
  division ENUM('East', 'Central', 'West') NOT NULL,
  createdAt DATETIME DEFAULT NOW(),
  updatedAt DATETIME DEFAULT NOW(),
  deletedAt DATETIME,
  PRIMARY KEY(id)
);

CREATE TABLE games (
  id INT AUTO_INCREMENT,
  homeTeamId INT NOT NULL,
  awayTeamId INT NOT NULL,
  homeScore INT,
  awayScore INT,
  startTime TIMESTAMP NOT NULL,
  createdAt DATETIME DEFAULT NOW(),
  updatedAt DATETIME DEFAULT NOW(),
  deletedAt DATETIME,
  PRIMARY KEY(id),
  FOREIGN KEY (homeTeamId) REFERENCES teams(id),
  FOREIGN KEY (awayTeamId) REFERENCES teams(id)
);

CREATE TABLE players (
  id INT AUTO_INCREMENT,
  firstName VARCHAR(255),
  lastName VARCHAR(255),
  position VARCHAR(10),
  throws ENUM('R','L','B'),
  hits ENUM('R','L','B'),
  currentTeamId INT NOT NULL,
  createdAt DATETIME DEFAULT NOW(),
  updatedAt DATETIME DEFAULT NOW(),
  deletedAt DATETIME,
  PRIMARY KEY(id),
  FOREIGN KEY (currentTeamId) REFERENCES teams(id)
);

CREATE TABLE hittingStats (
  playerId INT NOT NULL,
  gameId INT NOT NULL,
  teamId INT NOT NULL,
  atBats INT DEFAULT 0,
  runs INT DEFAULT 0,
  hits INT DEFAULT 0,
  doubles INT DEFAULT 0,
  triples INT DEFAULT 0,
  homeRuns INT DEFAULT 0,
  runsBattedIn INT DEFAULT 0,
  walks INT DEFAULT 0,
  strikeOuts INT DEFAULT 0,
  steals INT DEFAULT 0,
  createdAt DATETIME DEFAULT NOW(),
  updatedAt DATETIME DEFAULT NOW(),
  deletedAt DATETIME,
  PRIMARY KEY(playerId, gameId),
  FOREIGN KEY (playerId) REFERENCES players(id),
  FOREIGN KEY (gameId) REFERENCES games(id),
  FOREIGN KEY (teamId) REFERENCES teams(id)
);

CREATE TABLE pitchingStats (
  playerId INT NOT NULL,
  gameId INT NOT NULL,
  teamId INT NOT NULL,
  win TINYINT DEFAULT 0,
  inningsPitched DECIMAL(3,1),
  hits INT DEFAULT 0,
  runs INT DEFAULT 0,
  earnedRuns INT DEFAULT 0,
  walks INT DEFAULT 0,
  strikeOuts INT DEFAULT 0,
  createdAt DATETIME DEFAULT NOW(),
  updatedAt DATETIME DEFAULT NOW(),
  deletedAt DATETIME,
  PRIMARY KEY(playerId, gameId),
  FOREIGN KEY (playerId) REFERENCES players(id),
  FOREIGN KEY (gameId) REFERENCES games(id),
  FOREIGN KEY (teamId) REFERENCES teams(id)
);
