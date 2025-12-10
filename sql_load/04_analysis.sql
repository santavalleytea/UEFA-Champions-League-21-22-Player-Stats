-- Top Assisters
SELECT 
    p.player_name,
    t.team_name,
    p.position, 
    a.assists,
    a.dribbles
FROM attacking_stats a
-- joins each stat to the correct player
JOIN players p ON a.player_id = p.player_id
-- each player to the correct team
JOIN teams t ON p.team_id = t.team_id
ORDER BY a.assists DESC
LIMIT 20;

-- Top Dribblers
SELECT 
    p.player_name,
    t.team_name,
    p.position,
    a.dribbles
FROM attacking_stats a
JOIN players p ON a.player_id = p.player_id
JOIN teams t ON p.team_id = t.team_id
ORDER BY a.dribbles DESC
LIMIT 20;

-- Total Attacking Contributions
SELECT
    t.team_name,
    SUM(a.assists) AS total_assists,
    SUM(a.dribbles) AS total_dribbles
FROM attacking_stats a
JOIN players p ON a.player_id = p.player_id
JOIN teams t ON p.team_id = t.team_id
-- grous all team x players together
GROUP BY t.team_name
ORDER BY total_assists DESC;

-- Position Based Analysis
SELECT 
    p.position,
    AVG(a.assists) as avg_assists,
    AVG(a.dribbles) as avg_dribbles
FROM attacking_stats a
JOIN players p ON a.player_id = p.player_id
GROUP BY p.position;

-- Player Goals Analysis
SELECT DISTINCT
    p.player_name,
    g.goals
FROM goals_stats g
JOIN players p ON g.player_id = p.player_id
ORDER BY g.goals DESC;
