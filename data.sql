/* Populate database with sample data. */

INSERT INTO animals(
  name,
  date_of_birth,
  escape_attempts,
  neutered,
  weight_kg
) VALUES(
  'Agumon',
  '2020-02-03',
  0,
  '1',
  10.23
);

INSERT INTO animals(
  name,
  date_of_birth,
  escape_attempts,
  neutered,
  weight_kg
) VALUES(
  'Gabumon',
  '2018-11-15',
  2,
  '1',
  8.0
);

INSERT INTO animals(
  name,
  date_of_birth,
  escape_attempts,
  neutered,
  weight_kg
) VALUES(
  'Pikachu',
  '2021-01-07',
  1,
  '0',
  15.04
);

INSERT INTO animals(
  name,
  date_of_birth,
  escape_attempts,
  neutered,
  weight_kg
) VALUES(
  'Devinom',
  '2017-05-05',
  1,
  '5',
  11.0
);

INSERT INTO animals(
  name,
  date_of_birth,
  escape_attempts,
  neutered, weight_kg
) VALUES(
  'Charmander',
  '2020-02-08',
  0,
  '0',
  -11
);

INSERT INTO animals(
  name,
  date_of_birth,
  escape_attempts,
  neutered,
  weight_kg
) VALUES(
  'Plantmon',
  '2022-12-15',
  2,
  '1',
  -5.7
);

INSERT INTO animals(
  name,
  date_of_birth,
  escape_attempts,
  neutered,
  weight_kg
) VALUES(
  'Squirtle',
  '1993-04-02',
  3,
  '0',
  -12.13
);

INSERT INTO animals(
  name,
  date_of_birth,
  escape_attempts,
  neutered,
  weight_kg
) VALUES(
  'Angemon',
  '2005-06-12',
  1,
  '1',
  -45
);

INSERT INTO animals(
  name,
  date_of_birth,
  escape_attempts,
  neutered,
  weight_kg
) VALUES(
  'Boarmon',
  '2005-06-07',
  7,
  '1',
  20.4
);

INSERT INTO animals(
  name,
  date_of_birth,
  escape_attempts,
  neutered,
  weight_kg
) VALUES(
  'Blosson',
  '1998-10-13',
  3,
  '1',
  17
);

INSERT INTO owners(
  full_name, age
) VALUES(
  'Sam Smith', 34
);

INSERT INTO owners(
  full_name,
  age
) VALUES(
  'Jennifer Orwell',
  19
);

INSERT INTO owners(
  full_name,
  age
) VALUES(
  'Bob',
  45
);

INSERT INTO owners(
  full_name,
  age) VALUES(
  'Melony Pond',
  77
);

INSERT INTO owners(
  full_name,
  age
) VALUES(
  'Dean Winchester',
  14
);

INSERT INTO species(
  name
) VALUES(
  'Pokemon'
);

INSERT INTO species(
  name
)VALUES(
  'Digimon'
);

UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';
UPDATE animals SET species_id = 1 WHERE species_id is NULL;
UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owner_id = 2 WHERE name = 'Gabumon' OR name = 'Pikachu';
UPDATE animals SET owner_id = 3 WHERE name = 'Devimon' OR name = 'Plantmon';
UPDATE animals SET owner_id = 4 WHERE name = 'Squirtle' OR name = 'Charmander' OR name = 'Blosson';
UPDATE animals SET owner_id = 5 WHERE name = 'Boarmon' OR name = 'Angemon';

SELECT name, full_name FROM animals JOIN owners ON owner_id = owners.id WHERE owners.full_name = 'Melony Pond';
SELECT animals.name FROM animals JOIN species ON species_id = species.id WHERE species.id = 2;
SELECT name, full_name FROM animals JOIN owners ON owner_id = owners.id;
SELECT COUNT(animals.name), species.name FROM animals JOIN species ON animals.species_id = species.id GROUP BY species.name;
SELECT name, full_name FROM animals JOIN owners ON owner_id = owners.id WHERE name = 'Digiwon' AND full_name = 'Jennifer Orwell';
SELECT name, full_name FROM animals JOIN owners ON owner_id = owners.id WHERE animals.escape_attempts = 0 AND full_name = 'Dean Winchester';
SELECT full_name, COUNT(animals.owner_id) AS a FROM owners JOIN animals ON owners.id = animals.owner_id GROUP BY full_name ORDER BY a desc LIMIT 1;

INSERT INTO vets(
  name,
  age,
  date_of_graduation
) VALUES(
  'William Tatcher',
  45,
  '2000-04-23'
);

INSERT INTO vets(
  name,
  age,
  date_of_graduation
) VALUES(
  'Maisy Smith',
  26,
  '2019-01-17'
);

INSERT INTO vets(
  name,
  age,
  date_of_graduation
) VALUES(
  'Stephanie Mendez',
  64,
  '1981-05-04'
);

INSERT INTO vets(
  name,
  age,
  date_of_graduation
) VALUES(
  'Jack Harkness',
  38,
  '2008-06-08'
);

INSERT INTO specializations(
  species_id,
  vet_id
) VALUES(
  1,
  1
);

INSERT INTO specializations(
  species_id,
  vet_id
) VALUES(
  2,
  3
);

INSERT INTO specializations(
  species_id,
  vet_id
) VALUES(
  1,
  3
);

INSERT INTO specializations(
  species_id,
  vet_id
) VALUES(
  2,
  4
);

INSERT INTO visits(
  animal_id,
  vet_id,
  date_of_visit
) VALUES(
  1,
  1,
  '2020-05-04'
);

INSERT INTO visits(
  animal_id,
  vet_id,
  date_of_visit
) VALUES(
  1,
  3,
  '2020-07-22'
);

INSERT INTO visits(
  animal_id,
  vet_id,
  date_of_visit
) VALUES(
  2,
  4,
  '2021-02-02'
);

INSERT INTO visits(
  animal_id,
  vet_id,
  date_of_visit
) VALUES(
  3,
  2,
  '2020-01-05'
);

INSERT INTO visits(
  animal_id,
  vet_id,
  date_of_visit
) VALUES(
  3,
  2,
  '2020-05-08'
);

INSERT INTO visits(
  animal_id,
  vet_id,
  date_of_visit
) VALUES(
  3,
  2,
  '2020-05-14'
);

INSERT INTO visits(
  animal_id,
  vet_id,
  date_of_visit
) VALUES(
  10,
  3,
  '2021-05-04'
);

INSERT INTO visits(
  animal_id,
  vet_id,
  date_of_visit
) VALUES(
  4,
  4,
  '2021-02-04'
);

INSERT INTO visits(
  animal_id,
  vet_id,
  date_of_visit
) VALUES(
  5,
  3,
  '2019-12-21'
);

INSERT INTO visits(
  animal_id,
  vet_id,
  date_of_visit
) VALUES(
  5,
  1,
  '2020-08-10'
);

INSERT INTO visits(
  animal_id,
  vet_id,
  date_of_visit
) VALUES(
  5,
  2,
  '2021-07-04'
);

INSERT INTO visits(
  animal_id,
  vet_id,
  date_of_visit
) VALUES(
  6,
  3,
  '2019-09-29'
);

INSERT INTO visits(
  animal_id,
  vet_id,
  date_of_visit
) VALUES(
  7,
  4,
  '2020-10-03'
);

INSERT INTO visits(
  animal_id,
  vet_id,
  date_of_visit
) VALUES(
  7,
  4,
  '2020-11-04'
);

INSERT INTO visits(
  animal_id,
  vet_id,
  date_of_visit
) VALUES(
  8,
  2,
  '2019-01-04'
);

INSERT INTO visits(
  animal_id,
  vet_id,
  date_of_visit
) VALUES(
  8,
  2,
  '2019-05-15'
);

INSERT INTO visits(
  animal_id,
  vet_id,
  date_of_visit
) VALUES(
  8,
  2,
  '2020-02-27'
);

INSERT INTO visits(
  animal_id,
  vet_id,
  date_of_visit
) VALUES(
  8,
  2,
  '2020-08-03'
);

INSERT INTO visits(
  animal_id,
  vet_id,
  date_of_visit
) VALUES(
  8,
  3,
  '2020-05-24'
);

INSERT INTO visits(
  animal_id,
  vet_id,
  date_of_visit
) VALUES(
  8,
  1,
  '2021-01-11'
);
