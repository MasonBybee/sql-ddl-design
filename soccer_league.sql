DROP DATABASE soccer_league;
CREATE DATABASE soccer_league;

\c soccer_league

CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL,
    ranking INTEGER UNIQUE NOT NULL
);

CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    firstname TEXT NOT NULL,
    lastname TEXT NOT NULL,
    player_number INTEGER NOT NULL,
    team INTEGER REFERENCES teams NOT NULL
);

CREATE TABLE matches (
    id SERIAL PRIMARY KEY,
    team1 INTEGER REFERENCES teams NOT NULL,
    team2 INTEGER REFERENCES teams NOT NULL,
    match_date DATE NOT NULL
)
;

CREATE TABLE referees (
    id SERIAL PRIMARY KEY,
    firstname TEXT NOT NULL,
    lastname TEXT NOT NULL
);

CREATE TABLE match_referees (
    id SERIAL PRIMARY KEY,
    match_id INTEGER REFERENCES matches NOT NULL,
    referee_id INTEGER REFERENCES referees NOT NULL
);

CREATE TABLE player_goals (
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES players NOT NULL,
    match_id INTEGER REFERENCES matches NOT NULL,
    gametime INTEGER
);

CREATE TABLE seasons (
    id SERIAL PRIMARY KEY,
    start_date DATE UNIQUE NOT NULL,
    end_date DATE UNIQUE NOT NULL
);