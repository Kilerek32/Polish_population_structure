-- Project reffering to date from polish "GUS" (Central Statistical Office) about population structure in year 2021

-- creating a schema for data

CREATE SCHEMA IF NOT EXISTS poland_population_structure;

-- creating population structure data tables

-- creating table with data for births by voivodeship

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

LOAD DATA INFILE 'F:/Polish_population_structure/source_data/CSV/voivodeship.csv'
INTO TABLE voivodeship
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;

-- creating table with data for births in cities with more than 100 000 inhabitants

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

LOAD DATA INFILE 'F:/Polish_population_structure/source_data/CSV/city.csv'
INTO TABLE city
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;

-- creating table with data for live births by education level of Mother and voivodeship

DROP TABLE IF EXISTS poland_population_structure.education_level;
CREATE TABLE poland_population_structure.education_level (
voivodeship_id int 
,name text
,higher int
,post_secondary int
,secondary int
,basic_vacational int
,lower_secondary int
,primary_and_incomplete_primary int

);

-- importing date from csv file

 LOAD DATA INFILE 'F:/Polish_population_structure/source_data/CSV/education_level.csv'
INTO TABLE education_level
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;
  