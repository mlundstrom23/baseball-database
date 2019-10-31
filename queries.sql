USE baseball;

UPDATE teams
SET abbreviation = 'WAS'
WHERE id = 19;

SELECT startTime, homeScore, awayScore
FROM games
WHERE startTime < '2019-06-06 17:00:00';

SELECT *
FROM teams
WHERE league = 'NL';

SELECT CONCAT(firstName, ' ', lastName) AS FullName,
       players.position,
       players.throws,
       players.hits,
       teams.location,
       teams.mascot,
       teams.abbreviation
FROM teams
	JOIN players ON players.currentTeamId = teams.id
WHERE teams.mascot = 'Red Sox';    

SELECT CONCAT(firstName, ' ', lastName) AS FullName,
       players.position,
       teams.abbreviation,
       hittingStats.homeRuns
FROM hittingStats
	JOIN games ON hittingStats.gameId = games.id
	JOIN teams ON hittingStats.teamId = teams.id
	JOIN players ON hittingStats.playerId = players.id
WHERE games.startTime > '2019-06-06'    
ORDER BY hittingStats.homeRuns DESC LIMIT 5;

SELECT CONCAT(players.firstName, ' ', players.lastName) AS FullName,
       (earnedRuns / inningsPitched) AS ERA,
       pitchingStats.inningsPitched,
       teams.abbreviation
FROM pitchingStats
        JOIN games ON pitchingStats.gameId = games.id
	JOIN teams ON pitchingStats.teamId = teams.id
	JOIN players ON pitchingStats.playerId = players.id
WHERE games.startTime > '2019-06-06' AND pitchingStats.inningsPitched >= 4     
ORDER BY ERA ASC LIMIT 5;

SELECT CONCAT(firstName, ' ', lastName) AS FullName,
       MAX(hittingStats.doubles) AS Doubles,
       games.startTime,
       players.position,
       teams.abbreviation,
       home.abbreviation AS HomeTeam,
       away.abbreviation AS AwayTeam
FROM games, hittingStats
       JOIN games AS g1 ON hittingStats.gameId = g1.id
       JOIN teams ON hittingStats.teamId = teams.id
       JOIN players ON hittingStats.playerId = players.id
       JOIN teams AS home ON g1.homeTeamId = home.id
       JOIN teams AS away ON g1.awayTeamId = away.id
WHERE games.startTime > '2019-06-06'
GROUP BY hittingStats.doubles, 
	 players.firstName, 
         players.lastName, 
         games.startTime, 
         players.position,
         teams.abbreviation,
         home.abbreviation,
         away.abbreviation
ORDER BY doubles DESC LIMIT 1;   
