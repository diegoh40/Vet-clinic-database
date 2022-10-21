/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
id              INT GENERATED ALWAYS AS IDENTITY,
name            VARCHAR(100),
date_of_birth   DATE,
escape_attempts INT,
neutered        BOOLEAN,
weigth_kg       NUMERIC,
PRIMARY KEY(id)
);

/* Add new column */

ALTER TABLE ANIMALS   
ADD COLUMN species VARCHAR(100);  

/* add multiple tables */

CREATE TABLE owners (
    id int GENERATED ALWAYS AS IDENTITY,
    full_name varchar(255),
    Age int,
    PRIMARY KEY (id)
);

CREATE TABLE species (
    id int GENERATED ALWAYS AS IDENTITY,
    name varchar(255),
    PRIMARY KEY (id)
);

ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD FOREIGN KEY (species_id) REFERENCES species (id);
ALTER TABLE animals ADD FOREIGN KEY (owner_id) REFERENCES owners (id);

/*FOREIGN KEY*/

ALTER TABLE animals ADD COLUMN species_id INT REFERENCES species(id);
ALTER TABLE animals ADD COLUMN owners_id INT REFERENCES owners(id);

/*Creation vets*/

CREATE TABLE vets (
id              INT GENERATED ALWAYS AS IDENTITY,
name            VARCHAR(100),
age             INT,
date_of_birth   DATE,
PRIMARY KEY(id)
);

/*Creation JOIN TABLES */

CREATE TABLE specializations (
date_of_visit   DATE
);

CREATE TABLE visits();

/*Foreigns keys----visits*/

ALTER TABLE visits ADD COLUMN animal_id INT REFERENCES animal(id);
ALTER TABLE visits ADD COLUMN vet_id INT REFERENCES vets(id);

/*Foreigns keys----specializations*/

ALTER TABLE specializations ADD COLUMN species_id INT REFERENCES species(id);
ALTER TABLE specializations ADD COLUMN vet_id INT REFERENCES vets(id);
