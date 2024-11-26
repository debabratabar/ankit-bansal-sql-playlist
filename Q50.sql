create table section_data
(
section varchar(5),
number integer
)
insert into section_data
values ('A',5),('A',7),('A',10) ,('B',7),('B',9),('B',10) ,('C',9),('C',7),('C',9) ,('D',10),('D',3),('D',8);


select * from section_data


with temp1 as (
select * , rank() over(partition by section order by number desc ) rn from section_data
) , temp2 as (
select * , sum(number) over(partition by section) 
, max(number) over(partition by section) as sec_max
from temp1 where rn<3)
, temp3 as (
select * , dense_rank() over( order by sum desc ,sec_max desc ) rn2 
from temp2 )

select section , number from temp3 where rn2<3 
