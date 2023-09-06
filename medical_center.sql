DROP DATABASE medical_center;
CREATE DATABASE medical_center;

\c medicalcenter

CREATE TABLE doctors (
    id SERIAL PRIMARY KEY,
    firstname TEXT NOT NULL,
    lastname TEXT NOT NULL
);

CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    firstname TEXT NOT NULL,
    lastname TEXT NOT NULL
);

CREATE TABLE diseases (
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL
);

CREATE TABLE visits (
    id SERIAL PRIMARY KEY,
    doctorID INTEGER REFERENCES doctors NOT NULL,
    patientID INTEGER REFERENCES patients NOT NULL,
    disease_diagnosis INTEGER REFERENCES diseases
);