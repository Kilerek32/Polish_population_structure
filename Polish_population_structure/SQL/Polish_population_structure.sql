Select v.voivodeship_id, v.name, c.name 
	from voivodeship as v
		join city as c
			on v.voivodeship_id=c.voivodeship_id
				order by voivodeship_id




