/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR(250),
  date_of_birth DATE,
  escape_attempts INT,
  neutered BIT,
  weight_kg FLOAT
);

ALTER TABLE animals
ADD species VARCHAR(250);

CREATE TABLE owners(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  full_name VARCHAR(250),
  age INT
);

CREATE TABLE species(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR(250)
);

ALTER TABLE animals DROP COLUMN species;

ALTER TABLE animals ADD species_id INT;

ALTER TABLE animals ADD FOREIGN KEY (species_id) REFERENCES species(id);

ALTER TABLE animals ADD owner_id INT;

ALTER TABLE animals ADD FOREIGN KEY (owner_id) REFERENCES owners(id);

CREATE TABLE vets(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR(250),
  age INT,
  date_of_graduation DATE
);

CREATE TABLE specializations(
  id INT GENERATED ALWAYS AS IDENTITY,
  species_id INT,
  vet_id INT
);

ALTER TABLE specializations ADD FOREIGN KEY (species_id) REFERENCES species(id);
ALTER TABLE specializations ADD FOREIGN KEY (vet_id) REFERENCES vets(id);

CREATE TABLE visits(
  id INT GENERATED ALWAYS AS IDENTITY,
  animal_id INT,
  vet_id INT,
  date_of_visit DATE
);

ALTER TABLE visits ADD FOREIGN KEY (animal_id) REFERENCES animals(id);

ALTER TABLE visits ADD FOREIGN KEY (vet_id) REFERENCES vets(id);
