/* Populate database with sample data. */


INSERT INTO animals (name, date_of_birth,escape_attempts, neutered, weigth_kg) VALUES('Agumon', '2020-02-03',0, TRUE, 10.23 );
INSERT INTO animals (name, date_of_birth,escape_attempts, neutered, weigth_kg) VALUES('Gabumon', '2018-11-15',2, TRUE, 8 );
INSERT INTO animals (name, date_of_birth,escape_attempts, neutered, weigth_kg) VALUES('Pikachu', '2021-02-7',1, FALSE, 15.04 );
INSERT INTO animals (name, date_of_birth,escape_attempts, neutered, weigth_kg) VALUES('Devimon', '2017-05-12',5, TRUE, 11 );
INSERT INTO 
animals 
(name, date_of_birth,escape_attempts, neutered, weigth_kg)
VALUES
('Charmander', '2020-02-8',0, FALSE, -11 ),
('Plantmon', '2021-11-15',2, TRUE, -5.7 ),
('Squirtle', '1993-04-2',3, FALSE, -12.13 ),
('Angemon', '2005-06-12',1, TRUE, -45 ),
('Boarmon', '2005-06-7',7, TRUE, 20.4 ),
('Blossom', '1998-10-13',3, TRUE, 17 ),
('Ditto', '2022-05-14',4, TRUE, 22 );

/* owners data */
INSERT INTO 
owners 
(full_name, age)
VALUES
('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);

/* species data */
INSERT INTO 
species 
(name)
VALUES
('Pokemon'),
('Digimon');

/* animals species_id, owner_id  data*/

UPDATE ANIMALS SET owner_id = 1 WHERE id = 1; 
UPDATE ANIMALS SET owner_id = 2 WHERE id = 2; 
UPDATE ANIMALS SET owner_id = 2 WHERE id = 3; 
UPDATE ANIMALS SET owner_id = 3 WHERE id = 4; 
UPDATE ANIMALS SET owner_id = 3 WHERE id = 6; 
UPDATE ANIMALS SET owner_id = 4 WHERE id = 5; 
UPDATE ANIMALS SET owner_id = 4 WHERE id = 7; 
UPDATE ANIMALS SET owner_id = 4 WHERE id = 10; 
UPDATE ANIMALS SET owner_id = 5 WHERE id = 8; 
UPDATE ANIMALS SET owner_id = 5 WHERE id = 9;