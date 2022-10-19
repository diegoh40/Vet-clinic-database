/*Queries that provide answers to the questions from all projects.*/

SELECT name FROM animals WHERE NAME LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', ' Pikachu');
SELECT name, escape_attempts FROM animals WHERE weigth_kg > 10.5;
SELECT * FROM animals WHERE neutered IN ('t');
SELECT * FROM animals WHERE name NOT IN ('Gabumon');
SELECT * FROM animals WHERE weigth_kg BETWEEN 10.4 AND 17.3;