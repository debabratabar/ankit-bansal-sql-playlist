create table covid(city varchar(50),days date,cases int);
delete from covid;
insert into covid values('DELHI','2022-01-01',100);
insert into covid values('DELHI','2022-01-02',200);
insert into covid values('DELHI','2022-01-03',300);

insert into covid values('MUMBAI','2022-01-01',100);
insert into covid values('MUMBAI','2022-01-02',100);
insert into covid values('MUMBAI','2022-01-03',300);

insert into covid values('CHENNAI','2022-01-01',100);
insert into covid values('CHENNAI','2022-01-02',200);
insert into covid values('CHENNAI','2022-01-03',150);

insert into covid values('BANGALORE','2022-01-01',100);
insert into covid values('BANGALORE','2022-01-02',300);
insert into covid values('BANGALORE','2022-01-03',200);
insert into covid values('BANGALORE','2022-01-04',400);



-- using lead
with temp1 as (
select *, lead(cases) over(partition by city order by days)  , 
case when  lead(cases) over(partition by city order by days)   - cases  <= 0 then 0 else 1 end as check_covid

from covid ) 

select city  --, count(*) , sum(check) 
from temp1 
where lead is not null 
group  by city  
having count(lead) = sum(check_covid) 


-- using rank 
with temp1 as (
select *, rank() over(partition by city order by days)  rn_days, 
rank() over(partition by city order by cases)  rn_cases , 
rank() over(partition by city order by cases) - rank() over(partition by city order by days)   as check_covid

from covid
) 
select city 
from temp1 
group by city 
having count(distinct check_covid) =1 and sum(check_covid) = 0