drop table if exists drivers cascade ; 
drop table if exists riders ;
create table drivers(id varchar(10), start_time time, end_time time, start_loc varchar(10), end_loc varchar(10));
insert into drivers values('dri_1', '09:00', '09:30', 'a','b'),('dri_1', '09:30', '10:30', 'b','c'),('dri_1','11:00','11:30', 'd','e');
insert into drivers values('dri_1', '12:00', '12:30', 'f','g'),('dri_1', '13:30', '14:30', 'c','h');
insert into drivers values('dri_2', '12:15', '12:30', 'f','g'),('dri_2', '13:30', '14:30', 'c','h');




select * from drivers


/* Write a sql query to print total rides and profit rides for each driver 
 * profit ride is when the ens location of current ride is same as start location of next ride 
 */

-- 1st method  ( using lead )

with temp1 as 
( select * , lead(start_loc,1) over(partition by id order by end_time) as next_start_loc , count(1) over(partition by id ) as tot_rides 
from drivers d  ) 
select id , 
tot_rides , 
sum( case when end_loc = next_start_loc then 1 else 0 end ) as profit_rides
from temp1 
group by 1,2


-- 2nd method  ( using self join )


with temp1 as (
 select * , row_number () over(partition by id  order by start_time) as rn 
 from drivers
)
select t1.id ,  count(1) as tot_rides , count(t2.id) as profit_rides 

from temp1 t1  left join temp1  t2 
on t1.id = t2.id and t1.rn+1 = t2.rn and t1.end_loc = t2.start_loc 
group by 1


select id , 
max(rn) +1  tot_rides , 
sum( case when end_loc = next_start_loc then 1 else 0 end ) as profit_rides
from temp1  where rn =1
group by 1
