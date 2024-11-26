create table customers  (customer_name varchar(30))
insert into customers values ('Ankit Bansal')
,('Vishal Pratap Singh')
,('Michael'); 


with cte1 as (
select  customer_name , cardinality (string_to_array(customer_name , ' ')),string_to_array(customer_name , ' ') array_column
from customers 
) 

select customer_name,
case 
	when cardinality >=1 then array_column[1] 	else null end as first_name
,case when cardinality >=3 then array_column[2] else null  end as middle_name
,case when cardinality >=2  then coalesce ( array_column[3] , array_column[2] )  else null   end as last_name
from cte1 