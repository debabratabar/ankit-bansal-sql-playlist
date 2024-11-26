create table bms (seat_no int ,is_empty varchar(10));
insert into bms values
(1,'N')
,(2,'Y')
,(3,'N')
,(4,'Y')
,(5,'Y')
,(6,'Y')
,(7,'N')
,(8,'Y')
,(9,'Y')
,(10,'Y')
,(11,'Y')
,(12,'N')
,(13,'Y')
,(14,'Y');


select * from bms


-- 1st Method ( works for every consecutive day )
with temp1 as (
select * , row_number () over(order by seat_no) rn1 
, seat_no -row_number () over(order by seat_no) rn2
from bms
where is_empty='Y'

) 
, temp2 as (
select rn2, count(*) from temp1 
group by rn2 having count(*) >=4  ) 

select t1.seat_no , t2.count
from temp1 t1 join temp2 t2 on 
t1.rn2 = t2.rn2



-- 2nd method we can use lag , lead 