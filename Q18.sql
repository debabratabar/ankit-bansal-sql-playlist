create table billings 
(
emp_name varchar(10),
bill_date date,
bill_rate int
);
delete from billings;
insert into billings values
('Sachin','01-JAN-1990',25)
,('Sehwag' ,'01-JAN-1989', 15)
,('Dhoni' ,'01-JAN-1989', 20)
,('Sachin' ,'05-Feb-1991', 30)
;

create table HoursWorked 
(
emp_name varchar(20),
work_date date,
bill_hrs int
);
insert into HoursWorked values
('Sachin', '01-JUL-1990' ,3)
,('Sachin', '01-AUG-1990', 5)
,('Sehwag','01-JUL-1990', 2)
,('Sachin','01-JUL-1991', 4)



with temp1 as (
select emp_name , bill_date ,lead(bill_date) over (partition by emp_name order by bill_date)-1 
   last_bill_date , bill_rate
from billings
order by emp_name )

select hw.emp_name , sum(bill_hrs*bill_rate)
from temp1 t1 join HoursWorked hw on
t1.emp_name = hw.emp_name 
where hw.work_date >= t1.bill_date and hw.work_date <= coalesce ( t1.last_bill_date , hw.work_date) 
group  by hw.emp_name
select * from HoursWorked;

