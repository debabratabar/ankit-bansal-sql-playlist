create table tasks (
date_value date,
state varchar(10)
);

insert into tasks  values ('2019-01-01','success'),('2019-01-02','success'),('2019-01-03','success'),('2019-01-04','fail')
,('2019-01-05','fail'),('2019-01-06','success')


-- we have to first group the date with a older date then use aggregation to get min & max dates 

with temp1 as (
select * , rank() over(partition  by state order by date_value )  as rn 
, date_value - rank() over(partition  by state order by date_value )::int as grp_date
from tasks
order by 1 )
select min(date_value ) as start_date , max(date_value) as end_date , state 
from temp1 
group by grp_date , state
order by grp_date