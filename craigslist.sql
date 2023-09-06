DROP DATABASE craigslist;
CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE regions (
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(15) UNIQUE NOT NULL,
    firstname TEXT,
    lastname TEXT,
    pref_region INTEGER REFERENCES regions NOT NULL
);

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    description TEXT NOT NULL,
    userID INTEGER REFERENCES users NOT NULL,
    regionID INTEGER REFERENCES regions NOT NULL,
    location TEXT NOT NULL
)