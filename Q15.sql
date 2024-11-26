drop table if exists transactions;
create table transactions(
order_id int,
cust_id int,
order_date date,
amount int
);
delete from transactions;
insert into transactions values 
(1,1,'2020-01-15',150)
,(2,1,'2020-02-10',150)
,(3,2,'2020-01-16',150)
,(4,2,'2020-02-25',150)
,(5,3,'2020-01-10',150)
,(6,3,'2020-02-20',150)
,(7,4,'2020-01-20',150)
,(8,5,'2020-02-20',150)
;



select * from transactions t 

select  --t1.cust_id ,t1.order_date , t2.order_date ,  extract ( month from age( date_trunc('Month' , t1.order_date)  , date_trunc('Month' , t2.order_date) ) ) 
to_char( t1.order_date , 'yyyy-MM') , count(distinct t2.cust_id) 
from transactions t1  left join 
transactions t2
on t1.cust_id = t2.cust_id  and extract ( month from age( date_trunc('Month' , t1.order_date)  , date_trunc('Month' , t2.order_date) ) )=1
group by to_char( t1.order_date , 'yyyy-MM') 
