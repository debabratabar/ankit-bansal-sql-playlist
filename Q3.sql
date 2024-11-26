create table entries ( 
name varchar(20),
address varchar(20),
email varchar(20),
floor int,
resources varchar(10));

insert into entries 
values ('A','Bangalore','A@gmail.com',1,'CPU'),('A','Bangalore','A1@gmail.com',1,'CPU'),('A','Bangalore','A2@gmail.com',2,'DESKTOP')
,('B','Bangalore','B@gmail.com',2,'DESKTOP'),('B','Bangalore','B1@gmail.com',2,'DESKTOP'),('B','Bangalore','B2@gmail.com',1,'MONITOR')



select * from entries


with temp1 as ( 
select distinct name , floor , resources ,  count(*) over(partition by name )  as total_visits
, count(*) over(partition by name , floor ) as floor_visit_count
from entries ) 
, temp2 as (
select  * , string_agg(resources  , ',') over(partition by name ) as resources_used,
rank() over(partition by name order by floor_visit_count desc ) as rn 
from temp1) 
select name , total_visits , floor as most_visited_floor , resources_used
from temp2
where rn =1 