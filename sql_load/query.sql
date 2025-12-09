-- Query Analysis
SELECT 
    p.player_name,
    t.team_name,
    p.position, 
    a.assists,
    a.dribbles
FROM attacking_stats a
JOIN players p ON a.player_id = p.player_id
JOIN teams t ON p.team_id = t.team_id
ORDER BY a.assists DESC
LIMIT 20;