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

-- total births per 100000 inhabitants in Polish cities which count above 100 000 inhabitants

Select name, total, population, ROUND((100000*total)/population,0) as births_per_inhabitants 
	from city
		order by births_per_inhabitants desc;
        
-- 

select * from voivodeship





