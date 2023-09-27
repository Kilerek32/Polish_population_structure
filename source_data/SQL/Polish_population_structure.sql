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

/*

+ --------- + --------- + --------------- +
| name      | name      | population      |
+ --------- + --------- + --------------- +
| Mazowieckie | Warszawa  | 1863056       |
| Małopolskie | Kraków    | 802583        |
| Dolnośląskie | Wrocław   | 674312       |
| Łódzkie   | Łódź      | 664860          |
| Wielkopolskie | Poznań    | 545073      |
| Pomorskie | Gdańsk    | 486271          |
| Zachodniopomorskie | Szczecin  | 394482 |
| Kujawsko-pomorskie | Bydgoszcz | 334026 |
| Lubelskie | Lublin    | 332852          |
| Podlaskie | Białystok | 293413          |
| Śląskie   | Katowice  | 282755          |
| Podkarpackie | Rzeszów   | 196374       |
| Świętokrzyskie | Kielce    | 185478     |
| Warmińsko-mazurskie | Olsztyn   | 169251|
| Lubuskie  | Zielona Góra | 139667       |
| Opolskie  | Opole     | 126775          |
+ --------- + --------- + --------------- +

*/

-- total births to population correlation percentage

Select name, total, population, ROUND((total/population)*100,2) as births_to_population
	from city
		order by births_to_population DESC;
        
/*

+ --------- + ---------- + --------------- + ------------------------- +
| name      | total      | population      | births_to_population      |
+ --------- + ---------- + --------------- + ------------------------- +
| Kraków    | 8695       | 802583          | 1.08                      |
| Rzeszów   | 2096       | 196374          | 1.07                      |
| Wrocław   | 7177       | 674312          | 1.06                      |
| Warszawa  | 19810      | 1863056         | 1.06                      |
| Gdańsk    | 5174       | 486271          | 1.06                      |
| Białystok | 3069       | 293413          | 1.05                      |
| Poznań    | 5549       | 545073          | 1.02                      |
| Lublin    | 3276       | 332852          | 0.98                      |
| Zielona Góra | 1273       | 139667          | 0.91                   |
| Szczecin  | 3433       | 394482          | 0.87                      |
| Opole     | 1108       | 126775          | 0.87                      |
| Olsztyn   | 1448       | 169251          | 0.86                      |
| Koszalin  | 894        | 104891          | 0.85                      |
| Toruń     | 1684       | 197112          | 0.85                      |
| Chorzów   | 863        | 103229          | 0.84                      |
| Bielsko-Biała | 1395       | 168106          | 0.83                  |
| Bydgoszcz | 2789       | 334026          | 0.83                      |
| Bytom     | 1256       | 151691          | 0.83                      |
| Ruda Śląska | 1102       | 132766          | 0.83                    |
| Radom     | 1632       | 199904          | 0.82                      |
| Rybnik    | 1086       | 132923          | 0.82                      |
| Łódź      | 5454       | 664860          | 0.82                      |
| Gdynia    | 1993       | 244676          | 0.81                      |
| Kielce    | 1509       | 185478          | 0.81                      |
| Katowice  | 2289       | 282755          | 0.81                      |
| Gliwice   | 1370       | 172628          | 0.79                      |
| Tychy     | 952        | 124139          | 0.77                      |
| Zabrze    | 1196       | 156935          | 0.76                      |
| Gorzów Wielkopolski | 892        | 118011          | 0.76            |
| Włocławek | 778        | 103535          | 0.75                      |
| Płock     | 842        | 113660          | 0.74                      |
| Tarnów    | 729        | 105014          | 0.69                      |
| Sosnowiec | 1296       | 191676          | 0.68                      |
| Częstochowa | 1420       | 210773          | 0.67                    |
| Dąbrowa Górnicza | 775        | 115955          | 0.67               |
| Elbląg    | 760        | 114401          | 0.66                      |
| Wałbrzych | 627        | 103263          | 0.61                      |
+ --------- + ---------- + --------------- + ------------------------- +

*/
        
-- Name top 3 cities by births

Select city_id, name, max(total) as total
	from city
		group by city_id
			order by total desc
			limit 3;
            
/*

+ ------------ + --------- + ---------- +
| city_id      | name      | total      |
+ ------------ + --------- + ---------- +
| 31           | Warszawa  | 19810      |
| 16           | Kraków    | 8695       |
| 33           | Wrocław   | 7177       |
+ ------------ + --------- + ---------- +

*/
            
-- what is total education level of mothers?

Select sum(higher) as higher, 
sum(post_secondary) as post_secondary, 
sum(secondary) as secondary, 
sum(basic_vacational) as basic_vacational, 
sum(lower_secondary) as lower_secondary, 
sum(primary_and_incomplete_primary) as primary_and_incomplete_primary 
from education_level;

/*

+ ----------- + ------------------- + -------------- + --------------------- + -------------------- + ----------------------------------- +
| higher      | post_secondary      | secondary      | basic_vacational      | lower_secondary      | primary_and_incomplete_primary      |
+ ----------- + ------------------- + -------------- + --------------------- + -------------------- + ----------------------------------- +
| 165436      | 2438                | 96827          | 27137                 | 8674                 | 8404                                |
+ ----------- + ------------------- + -------------- + --------------------- + -------------------- + ----------------------------------- +

*/

-- live births as a percentage of total births

select ROUND((sum(total)/sum(total+still_births))*100,2) as live_births_percentage 
from voivodeship;

/*

+ --------------------------- +
| live_births_percentage      |
+ --------------------------- +
| 99.63                       |
+ --------------------------- +

*/

-- legitimate and illegitimate as percentage 

select ROUND((sum(legitimate)/sum(legitimate+illegitimate))*100,2) as legitimate_births_percentage,
ROUND((sum(illegitimate)/sum(legitimate+illegitimate))*100,2) as illegitimate_births_percentage 
from voivodeship;

/*

+ --------------------------------- + ----------------------------------- +
| legitimate_births_percentage      | illegitimate_births_percentage      |
+ --------------------------------- + ----------------------------------- +
| 73.30                             | 26.70                               |
+ --------------------------------- + ----------------------------------- +

*/

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

 /*
 
+ --------- + ----------------------------------- +
| name      | illegitimate_births_percentage      |
+ --------- + ----------------------------------- +
| Zachodniopomorskie | 43.07                      |
| Lubuskie  | 42.64                               |
| Warmińsko-mazurskie | 36.97                     |
| Dolnośląskie | 35.58                            |
| Kujawsko-pomorskie | 33.84                      |
| Pomorskie | 30.93                               |
| Łódzkie   | 30.67                               |
| Wielkopolskie | 29.96                           |
| Opolskie  | 27.18                               |
+ --------- + ----------------------------------- +

*/