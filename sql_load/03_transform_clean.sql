-- Attacking Dataset
INSERT INTO teams (team_name)
SELECT DISTINCT club
FROM attacking_raw
ORDER BY club;

INSERT INTO players (player_name, position, team_id)
SELECT DISTINCT
    ar.player_name,
    ar.position,
    t.team_id
FROM attacking_raw ar
JOIN teams t
    ON ar.club = t.team_name
ORDER BY ar.player_name;

INSERT INTO attacking_stats (
    player_id, assists, corner_taken, offsides, dribbles, match_played
)
SELECT 
    p.player_id,
    ar.assists,
    ar.corner_taken,
    ar.offsides,
    ar.dribbles,
    ar.match_played
FROM attacking_raw ar
JOIN players p
    ON ar.player_name = p.player_name;

-- Goals Dataset
INSERT INTO teams (team_name)
SELECT DISTINCT club
FROM goals_raw
ORDER BY club
ON CONFLICT (team_name) DO NOTHING;

INSERT INTO players (player_name, position, team_id)
SELECT DISTINCT
    gr.player_name,
    gr.position,
    t.team_id
FROM goals_raw gr
JOIN teams t
    ON gr.club = t.team_name
ORDER BY gr.player_name;

INSERT INTO goals_stats (
    player_id, 
    goals,
    right_foot,
    left_foot,
    headers,
    others,
    inside_area,
    outside_areas,
    penalties,
    match_played
)
SELECT
    p.player_id,
    gr.goals,
    gr.right_foot,
    gr.left_foot,
    gr.headers,
    gr.others,
    gr.inside_area,
    gr.outside_areas,
    gr.penalties,
    gr.match_played
FROM goals_raw gr
JOIN players p
    ON gr.player_name = p.player_name
ORDER BY gr.player_name;