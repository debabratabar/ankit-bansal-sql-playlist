create table business_city (
business_date date,
city_id int
);
delete from business_city;
insert into business_city
values(cast('2020-01-02' as date),3),(cast('2020-07-01' as date),7),(cast('2021-01-01' as date),3),(cast('2021-02-03' as date),19)
,(cast('2022-12-01' as date),3),(cast('2022-12-15' as date),3),(cast('2022-02-28' as date),12);



select * from business_city

/*
 * business_city has data from the day udaan has started their operation 
 * write a sql query to identify yearwise count of new cities where udaan started their operations  
 */


-- 1st method ( using group by ) 
 
with temp1 as (
select city_id , min(business_date) as dates  from business_city
group by 1) 

select extract(year from dates ) as year, count(city_id)
from temp1 
group by 1 


-- 2nd method ( self join )  



with temp1 as (
select extract (year from business_date)  business_date, city_id from business_city
)


select a.business_date ,count(a.city_id)
from temp1 a
left join temp1 b
on a.city_id = b.city_id and a.business_date > b.business_date
where b.business_date is null 
group by a.business_date