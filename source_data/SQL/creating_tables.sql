-- Project reffering to date from polish "GUS" (Central Statistical Office) about population structure in year 2021

-- creating a schema for data

CREATE SCHEMA IF NOT EXISTS poland_population_structure;

-- creating population structure data tables

DROP TABLE IF EXISTS poland_population_structure.voivodeship;
CREATE TABLE poland_population_structure.voivodeship (
voivodeship_id int 
,name text
,total int
,legitimate int
,illegitimate int
,still_births int
,PRIMARY KEY (voivodeship_id)


);

-- importing date from csv file

LOAD DATA INFILE 'F:/SQL-projects/Polish_population_structure/CSV/voivodeship.csv'
INTO TABLE voivodeship
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;

-- Creating table with data for cities with more than 100 000 inhabitants

DROP TABLE IF EXISTS poland_population_structure.city;
CREATE TABLE poland_population_structure.city (
city_id int
,voivodeship_id int 
,name text
,total int
,legitimate int
,illegitimate int
,still_births int
,population int
,area int

,PRIMARY KEY (city_id)


);

-- importing date from csv file

LOAD DATA INFILE 'F:/SQL-projects/Polish_population_structure/CSV/city.csv'
INTO TABLE city
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;



 
  