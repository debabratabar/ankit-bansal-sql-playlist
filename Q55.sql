Create table candidates(
id int primary key,
positions varchar(10) not null,
salary int not null);

--test case 1:
insert into candidates values(1,'junior',5000);
insert into candidates values(2,'junior',7000);
insert into candidates values(3,'junior',7000);
insert into candidates values(4,'senior',10000);
insert into candidates values(5,'senior',30000);
insert into candidates values(6,'senior',20000);

truncate table candidates;
--test case 2:
insert into candidates values(20,'junior',10000);
insert into candidates values(30,'senior',15000);
insert into candidates values(40,'senior',30000);

--test case 3:
insert into candidates values(1,'junior',15000);
insert into candidates values(2,'junior',15000);
insert into candidates values(3,'junior',20000);
insert into candidates values(4,'senior',60000);

--test case 4:
insert into candidates values(10,'junior',10000);
insert into candidates values(40,'junior',10000);
insert into candidates values(20,'senior',15000);
insert into candidates values(30,'senior',30000);
insert into candidates values(50,'senior',15000);



select * from candidates 

with cte as ( 
select 
* , 50000 - sum(salary) over(order by salary, id) as budget
from candidates
where positions = 'senior'
) , cte1 as (
select 
* , (select coalesce  ( min(budget) , 50000 )  from cte where budget >0) - sum(salary) over(order by salary, id) as budget
from candidates
where positions = 'junior'
)
select --cte.* , cte1.*
count( distinct  case when cte.budget >=0 then cte.id end ) as senior
,count( distinct case when cte1.budget >=0 then cte1.id end ) as junior

from cte , cte1 

