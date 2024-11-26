CREATE TABLE city_distance
(
    distance INT,
    source VARCHAR(512),
    destination VARCHAR(512)
);

delete from city_distance;
INSERT INTO city_distance(distance, source, destination) VALUES ('100', 'New Delhi', 'Panipat');
INSERT INTO city_distance(distance, source, destination) VALUES ('200', 'Ambala', 'New Delhi');
INSERT INTO city_distance(distance, source, destination) VALUES ('150', 'Bangalore', 'Mysore');
INSERT INTO city_distance(distance, source, destination) VALUES ('150', 'Mysore', 'Bangalore');
INSERT INTO city_distance(distance, source, destination) VALUES ('250', 'Mumbai', 'Pune');
INSERT INTO city_distance(distance, source, destination) VALUES ('250', 'Pune', 'Mumbai');
INSERT INTO city_distance(distance, source, destination) VALUES ('2500', 'Chennai', 'Bhopal');
INSERT INTO city_distance(distance, source, destination) VALUES ('2500', 'Bhopal', 'Chennai');
INSERT INTO city_distance(distance, source, destination) VALUES ('60', 'Tirupati', 'Tirumala');
INSERT INTO city_distance(distance, source, destination) VALUES ('80', 'Tirumala', 'Tirupati');




select *,
row_number()
from city_distance



-- 1st method 

select cd1.*
from city_distance cd1 left join city_distance cd2 
on cd1.source = cd2.destination
and cd2.source = cd1.destination
where cd2.source is null 
or cd1.distance !=cd2.distance
or cd1.source < cd1.destination




-- 2nd method

with cte as (
select 
--distinct  distance  
*
,row_number() over() rn
, case when source<destination then source else destination end as city1 
, case when source<destination then destination else  source  end as city2
from city_distance
), temp2 as (
select * , rank() over(partition by distance , city1 , city2  order by rn)
from cte 
--order by  city1 , city2
)
select distance , source , destination  from temp2 where rank =1