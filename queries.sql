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
UPDATE ANIMALS SET species = 'Digimon' WHERE name LIKE '%mon';
UPDATE ANIMALS SET species = 'Pokemon' WHERE species = '';
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

/*Quaries transaction day 3*/

vet_clinic=# UPDATE ANIMALS SET species_id = 2 WHERE name LIKE '%mon';
UPDATE ANIMALS SET species_id = 1 WHERE species_id <> 2;

/*Quaries using JOIN */

SELECT name 
FROM animals 
INNER JOIN owners ON owners.full_name = 'Melody Pond' 
AND owners.id = animals.owner_id; /*What animals belong to Melody Pond? */

SELECT animals.name 
FROM animals 
JOIN species ON  species.name = 'Pokemon'; /*List of all animals that are pokemon*/

SELECT owners.full_name, animals.name  
FROM owners 
LEFT JOIN animals ON  owners.id = animals.owner_id;/*List all owners and their animals*/

SELECT species.name, COUNT(animals.name)  
FROM species 
LEFT JOIN animals ON species.id = animals.species_id GROUP BY species.name; /*How many animals are there per species?*/

SELECT name AS Jennifer_Animals 
FROM animals 
JOIN owners ON owners.id = animals.owner_id 
AND owners.full_name = 'Jennifer Orwell';/*List all Digimon owned by Jennifer Orwell*/

SELECT animals.name 
FROM animals 
JOIN owners ON owners.id = animals.owner_id 
AND owners.full_name = 'Dean Winchester' 
AND animals.escape_attempts = 0; /*List all animals owned by Dean Winchester that haven't tried to escape*/


SELECT owners.full_name, COUNT(animals.owner_id) AS how_has_more_pets
FROM animals 
INNER JOIN owners ON owners.id = animals.owner_id
GROUP BY owners.full_name
ORDER BY COUNT(animals.owner_id) DESC ;/*Who owns the most animals*/




