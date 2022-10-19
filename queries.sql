/*Queries that provide answers to the questions from all projects.*/

SELECT name FROM animals WHERE NAME LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', ' Pikachu');
SELECT name, escape_attempts FROM animals WHERE weigth_kg > 10.5;
SELECT * FROM animals WHERE neutered IN ('t');
SELECT * FROM animals WHERE name NOT IN ('Gabumon');
SELECT * FROM animals WHERE weigth_kg BETWEEN 10.4 AND 17.3;

/*Queries transaction */

BEGIN;
UPDATE ANIMALS SET species = unspecified
ROLLBACK;

BEGIN;
UPDATE ANIMALS SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE ANIMALS SET species = 'pokemon' WHERE species = '';
COMMIT;

BEGIN;
DELETE FROM animals;
ROLLBACK;

DELETE FROM animals WHERE date_of_birth > '2022-01-1';
BEGIN;
SAVEPOINT SAVE1;
UPDATE ANIMALS SET weigth_kg = weigth_kg * -1;
ROLLBACK TO SAVE1
UPDATE ANIMALS SET weigth_kg = weigth_kg * -1 WHERE weigth_kg < 0 ;
COMMIT;

/*Queries answer questions */

SELECT COUNT(*) FROM animals;

SELECT COUNT(*) FROM animals WHERE escape_attempts > 0;
SELECT AVG(weigth_kg) FROM ANIMALS;
SELECT neutered, AVG(escape_attempts) FROM animals GROUP BY neutered;
SELECT  species, MIN(escape_attempts) FROM animals GROUP BY species;
SELECT  species, MIN(weigth_kg) FROM animals GROUP BY species;
SELECT  species, MIN(weigth_kg) FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;
