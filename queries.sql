/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT * FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = '1' and escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = '1';
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species is NULL;
COMMIT;

BEGIN;
TRUNCATE animals;
ROLLBACK;

BEGIN;

DELETE FROM animals WHERE date_of_birth > '2022-01-01';

SAVEPOINT DELETE_JAN_ONE;

UPDATE animals SET weight_kg = weight_kg * -1;

ROLLBACK TO DELETE_JAN_ONE;

UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;

COMMIT;

SELECT COUNT(name) FROM animals;

SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;

SELECT AVG(weight_kg) FROM animals;

SELECT neutered, SUM(escape_attempts) FROM animals GROUP BY neutered;

SELECT species, min(weight_kg), max(weight_kg) FROM animals GROUP BY species;

SELECT name, AVG(escape_attempts) FROM animals WHERE date_of_birth > '1990-01-01' AND date_of_birth < '2000-01-01' GROUP BY name;

SELECT vets.name, animals.name, visits.date_of_visit
FROM vets
JOIN visits
ON vets.id = visits.vet_id
JOIN animals
ON animals.id = visits.animal_id
WHERE visits.vet_id = 1 ORDER BY visits.date_of_visit desc LIMIT 1;

SELECT count (animals.name), vets.name
FROM animals
JOIN visits
ON animals.id = visits.animal_id
JOIN vets
ON vets.id = visits.vet_id
WHERE vets.name = 'Stephanie Mendez'
GROUP BY vets.name;

SELECT vets.name, species.name
FROM vets
FULL JOIN specializations
ON specializations.vet_id = vets.id
FULL JOIN species
ON species.id = specializations.species_id;

SELECT animals.name, vets.name
FROM animals
JOIN visits
ON visits.animal_id = animals.id
JOIN vets
ON visits.vet_id = vets.id
WHERE visits.date_of_visit >= '2020-04-01' AND visits.date_of_visit <= '2020-08-30' AND vets.name = 'Stephanie Mendez';

SELECT animals.name, count(visits.date_of_visit)
FROM animals
JOIN visits
on animals.id = visits.animal_id
GROUP BY animals.name ORDER BY count desc LIMIT 1;

SELECT animals.name, vets.name, visits.date_of_visit
FROM animals
JOIN visits
ON animals.id = visits.animal_id
JOIN vets
ON vets.id = visits.vet_id
WHERE vets.name = 'Maisy Smith' ORDER BY date_of_visit LIMIT 1;

SELECT animals.name, vets.name, visits.date_of_visit
FROM animals JOIN visits
ON animals.id = visits.animal_id
JOIN vets
ON vets.id = visits.vet_id ORDER BY date_of_visit desc LIMIT 1;

SELECT count(vet_id)
FROM visits
JOIN animals
ON visits.animal_id = animals.species_id;

SELECT COUNT(animals.species_id), species.name
FROM visits
JOIN vets ON visits.vet_id = vets.id
JOIN animals ON animals.id = visits.animal_id
JOIN species ON species.id = animals.species_id
WHERE visits.vet_id = (SELECT id from vets WHERE name = 'Maisy Smith')
GROUP BY species.name ORDER BY count desc LIMIT 1;
