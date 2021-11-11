/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-01-01';
SELECT name FROM animals WHERE neutred IS TRUE AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutred IS TRUE;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

-- TRANSACTIONS
BEGIN TRANSACTION;
  UPDATE animals SET species = 'unspecified';
  SELECT species FROM animals;
ROLLBACK;
SELECT species FROM animals;

BEGIN TRANSACTION;
  UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
  UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
COMMIT;
SELECT name, species FROM animals;

BEGIN TRANSACTION;
  DELETE FROM animals;
ROLLBACK;

BEGIN TRANSACTION;
  DELETE FROM animals WHERE date_of_birth > '2022-01-01';
  SAVEPOINT before_update_weight;
  UPDATE animals SET weight_kg = weight_kg * -1;
  ROLLBACK TO before_update_weight;
  UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;
-- END OF TRANSACTIONS

SELECT COUNT(*) FROM animals;
SELECT * FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) avg_weight_of_animals FROM animals;
SELECT neutred, ROUND(AVG(escape_attempts)) avg_escape_attempts FROM animals GROUP BY neutred;
SELECT species, MIN(weight_kg) minimmum_weight, MAX(weight_kg) maximum_weight FROM animals GROUP BY species ORDER BY species;
SELECT species, ROUND(AVG(escape_attempts)) avg_escape_attempts FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-01-01' GROUP BY species ORDER BY species;