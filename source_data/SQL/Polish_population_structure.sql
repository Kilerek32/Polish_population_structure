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
from education_level;

-- live births as a percentage of total births

select ROUND((sum(total)/sum(total+still_births))*100,2) as live_births_percentage 
from voivodeship;

-- legitimate and illegitimate as percentage 

select ROUND((sum(legitimate)/sum(legitimate+illegitimate))*100,2) as legitimate_births_percentage,
ROUND((sum(illegitimate)/sum(legitimate+illegitimate))*100,2) as illegitimate_births_percentage 
from voivodeship;

-- voivodeships where illegitimate percentage is higher than average

Select t1.name, t1.illegitimate_births_percentage
from (
	Select name, (ROUND((illegitimate/(legitimate+illegitimate))*100,2)) as illegitimate_births_percentage
	from voivodeship
) as t1,
(
	Select ROUND((sum(illegitimate)/sum(legitimate+illegitimate))*100,2) as average_illegitimate
	from voivodeship
) as t2
WHERE t1.illegitimate_births_percentage > t2.average_illegitimate
order by t1.illegitimate_births_percentage  desc;


                