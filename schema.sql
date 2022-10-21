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