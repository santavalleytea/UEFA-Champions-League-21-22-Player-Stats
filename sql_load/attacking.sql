SELECT current_database();
-- Raw csv data table creation
CREATE TABLE attacking_raw (
    serial INT, 
    player_name TEXT,
    club TEXT, 
    position TEXT,
    assists INT,
    corner_taken INT,
    offsides INT,
    dribbles INT,
    match_played INT
);

-- Import attacking.csv 
COPY attacking_raw
FROM 'D:\VSCode\UCL 2021-2022 Stats\csv_files\attacking.csv'
WITH (
    FORMAT csv,
    HEADER true,
    DELIMITER ',',
    ENCODING 'UTF8'
);

-- Teams table creation
CREATE TABLE teams (
    team_id SERIAL PRIMARY KEY,
    team_name TEXT UNIQUE
);

-- Include only clubs into team table
INSERT INTO teams (team_name)
SELECT DISTINCT club
FROM attacking_raw
ORDER BY club;

-- Players table creation
CREATE TABLE players (
    player_id SERIAL PRIMARY KEY,
    player_name TEXT,
    position TEXT,
    team_id INT REFERENCES teams(team_id)
);

INSERT INTO players (player_name, position, team_id)
SELECT DISTINCT
    ar.player_name,
    ar.position,
    t.team_id
FROM attacking_raw ar
JOIN teams t
    ON ar.club = t.team_name
ORDER BY ar.player_name;

-- Attacking stats table creation
CREATE TABLE attacking_stats (
    player_id INT REFERENCES players(player_id),
    assists INT,
    corner_taken INT,
    offsides INT,
    dribbles INT,
    match_played INT
);

ALTER TABLE attacking_stats
RENAME COLUMN off_sides TO offsides;

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