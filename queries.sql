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
WHERE owners.full_name = 'Dean Winchester'
AND animals.escape_attempts = 0; /*List all animals owned by Dean Winchester that haven't tried to escape*/


SELECT owners.full_name, COUNT(animals.owner_id) AS how_has_more_pets
FROM animals 
INNER JOIN owners ON owners.id = animals.owner_id
GROUP BY owners.full_name
ORDER BY COUNT(animals.owner_id) DESC ;/*Who owns the most animals*/


/*Quaries using JOIN TABLE vets and specializations*/

select animals.name, visits.date_of_visit
from animals
join visits on visits.animal_id = animals.id
inner join vets on visits.vet_id = vets.id
where vets.name = 'william tatcher'
order by visits.date_of_visit desc
limit 1; /*Who was the last animal seen by William Tatcher*/


Select Count(name) from (
   Select animals.name 
   from animals join visits on visits.animal_id = animals.id 
   join vets on vets.id = visits.vet_id and vets.name = 'Stephanie Mendez' Group by animals.name 
) as derivedTable;/*How many different animals did Stephanie Mendez see*/

select vets.name as vet, species.name as specialties
from vets
left join specializations on specializations.vet_id = vets.id
left join species on species.id = specializations.species_id;/*List all vets and their specialties*/

Select animals.name 
from animals join visits on visits.animal_id = animals.id 
join vets on vets.id = visits.vet_id 
and vets.name = 'Stephanie Mendez' 
where visits.date_of_visit between '2020-02-01' and '2020-08-30'; /*List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020*/

SELECT animals.name, COUNT(visits.date_of_visit) AS most_visits_pets
FROM animals
JOIN visits ON visits.animal_id = animals.id
GROUP BY animals.name
ORDER BY most_visits_pets DESC;/*What animal has the most visits to vets*/

Select animals.name 
from animals 
join visits on visits.animal_id = animals.id 
join vets on vets.id = visits.vet_id 
and vets.name = 'Maisy Smith' 
order by visits.date_of_visit ASC limit 1; /*Who was Maisy Smith's first visit*/

Select * 
from animals 
join visits on visits.animal_id = animals.id 
join vets on vets.id = visits.vet_id
 order by visits.date_of_visit DESC limit 1;/*Details for most recent visit: animal information, vet information, and date of visit*/

select count(visits.animal_id)
from visits
join vets on visits.vet_id = vets.id
join animals on animals.id = visits.animal_id
join specializations on specializations.species_id = vets.id
where specializations.species_id != animals.species_id;/*How many visits were with a vet that did not specialize in that animal's species*/

Select species.name, Count(*) 
from visits join vets on vets.id = visits.vet_id 
and vets.name = 'Maisy Smith' 
join animals on animals.id = visits.animal_id 
join species on species.id = animals.species_id 
Group by species.name order by Count(*) DESC limit 1; /*What specialty should Maisy Smith consider getting? Look for the species she gets the most*/











