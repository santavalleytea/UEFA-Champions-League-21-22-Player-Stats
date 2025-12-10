SELECT current_database();
-- Attacking.csv
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

-- Teams table creation
CREATE TABLE teams (
    team_id SERIAL PRIMARY KEY,
    team_name TEXT UNIQUE
);

-- Players table creation
CREATE TABLE players (
    player_id SERIAL PRIMARY KEY,
    player_name TEXT,
    position TEXT,
    team_id INT REFERENCES teams(team_id)
);

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

-- Goals.csv
CREATE TABLE goals_raw (
    serial INT,
    player_name TEXT,
    club TEXT,
    position TEXT,
    goals INT,
    right_foot INT,
    left_foot INT,
    headers INT,
    others INT,
    inside_area INT,
    outside_areas INT,
    penalties INT,
    match_played INT
);

CREATE TABLE goals_stats (
    player_id INT REFERENCES players(player_id),
    goals INT,
    right_foot INT,
    left_foot INT,
    headers INT,
    others INT,
    inside_area INT,
    outside_areas INT,
    penalties INT,
    match_played INT
);