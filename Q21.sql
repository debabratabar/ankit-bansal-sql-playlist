CREATE TABLE STORES (
Store varchar(10),
Quarter varchar(10),
Amount int);

INSERT INTO STORES (Store, Quarter, Amount)
VALUES ('S1', 'Q1', 200),
('S1', 'Q2', 300),
('S1', 'Q4', 400),
('S2', 'Q1', 500),
('S2', 'Q3', 600),
('S2', 'Q4', 700),
('S3', 'Q1', 800),
('S3', 'Q2', 750),
('S3', 'Q3', 900);



-- using cross join 

/*
 *  instead below query we can use 
 *  select distinct s1.store , s2.quarter from stores s1 , stores s2  [main cross join ]
 * 
 */

with temp1 as (
select store , quarter from 
(
select distinct store from stores  s ) a 
join
(select distinct quarter from stores  s )  b
on a.store !=b.quarter
) 

select t1.store , t1.quarter
from temp1 t1 left join stores s
on t1.store = s.store 
and t1.quarter  = s.quarter 
where s.store is null 


-- shortcut and cool method 



select  store , concat( 'Q' ,  (10 - sum(substring(quarter from 2 for 1 )::int))::varchar)  from stores 
group by 1 
