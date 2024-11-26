create table numbers (n int);
insert into numbers values (1),(2),(3),(4),(5) ;
-- insert into numbers values (9);

select * from numbers;






-- approach 1 
select n1.n 

from numbers n1 cross join numbers n2 
where n1.n >= n2.n;
-- on n1.n= n2.n;

-- approach 2 
with recursive cte as ( 

select n  , 1  as num  from numbers 
 union all 
select n  ,  num+1 from cte
where num+1 <=n 
)
select num  from cte 
order by  n , num ;
