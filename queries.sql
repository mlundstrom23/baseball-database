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