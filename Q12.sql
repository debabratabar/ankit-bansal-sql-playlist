drop table if exists sales
create table sales (
product_id int,
period_start date,
period_end date,
average_daily_sales int
);

insert into sales values(1,'2019-01-25','2019-02-28',100),(2,'2018-12-01','2020-01-01',10),(3,'2019-12-01','2020-01-31',1);


select * from sales 



with recursive temp1 as ( 
	
	select   min(period_start) as period_start  , max(period_end)  as period_end from sales 
	union all
	select period_start+1  , period_end  from temp1 where  period_start <=period_end 

)
--, with temp2 
select  product_id , extract ( year from t1.period_start) , sum(average_daily_sales)
from sales s ,  temp1 t1 
where t1.period_start >= s.period_start and t1.period_start <= s.period_end
group by product_id , extract ( year from t1.period_start) 
order by product_id , extract ( year from t1.period_start)

