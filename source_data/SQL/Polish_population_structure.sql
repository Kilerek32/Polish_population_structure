-- biggest polish cities by voivodeship

Select v.name, c.name, c.population
From city as c
Join
( 
    Select  voivodeship_id, max(population) As population
    From city
    Group By voivodeship_id
) d On c.voivodeship_id = d.voivodeship_id And c.population = d.population

join voivodeship as v
	on v.voivodeship_id=c.voivodeship_id
	
order by population desc;

-- total births to population correlation percentage

Select name, total, population, ROUND((total/population)*100,2) as births_to_population
	from city
		order by births_to_population DESC;
        
-- Name top 3 cities by births

Select city_id, name, max(total) as total
	from city
		group by city_id
			order by total desc
			limit 3;
            
-- what is total education level of mothers?

Select sum(higher) as higher, 
sum(post_secondary) as post_secondary, 
sum(secondary) as secondary, 
sum(basic_vacational) as basic_vacational, 
sum(lower_secondary) as lower_secondary, 
sum(primary_and_incomplete_primary) as primary_and_incomplete_primary 
from education_level

-- 




