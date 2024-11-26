CREATE TABLE emp(
 emp_id int NULL,
 emp_name varchar(50) NULL,
 salary int NULL,
 manager_id int NULL,
 emp_age int NULL,
 dep_id int NULL,
 dep_name varchar(20) NULL,
 gender varchar(10) NULL
) ;
insert into emp values(1,'Ankit',14300,4,39,100,'Analytics','Female');
insert into emp values(2,'Mohit',14000,5,48,200,'IT','Male');
insert into emp values(3,'Vikas',12100,4,37,100,'Analytics','Female');
insert into emp values(4,'Rohit',7260,2,16,100,'Analytics','Female');
insert into emp values(5,'Mudit',15000,6,55,200,'IT','Male');
insert into emp values(6,'Agam',15600,2,14,200,'IT','Male');
insert into emp values(7,'Sanjay',12000,2,13,200,'IT','Male');
insert into emp values(8,'Ashish',7200,2,12,200,'IT','Male');
insert into emp values(9,'Mukesh',7000,6,51,300,'HR','Male');
insert into emp values(10,'Rakesh',8000,6,50,300,'HR','Male');
insert into emp values(11,'Akhil',4000,1,31,500,'Ops','Male');


select * from emp


/*
 *  write a sql quary to find details of employees with 3rd highest salary in each department
 * in case there are less than 3 employees in a dep. return employee details with lowest salary in that dept.
 */ 

-- 1st method
with temp1 as (
select emp_id,emp_name,salary,dep_id,dep_name,  count(1) over(partition by dep_id) as tot_employee   
, rank() over(partition by dep_id order by salary desc ) 
from emp
) 

select emp_id,emp_name,salary,dep_id,dep_name from temp1 
where rank =3 
union  
select emp_id,emp_name, salary , dep_id,dep_name  from temp1 
where  
 (dep_id , salary ) in ( select dep_id  , min(salary) from temp1  where tot_employee < 3 group by 1  )



-- 2nd  method
 with temp1 as (
select emp_id,emp_name,salary,dep_id,dep_name,  count(1) over(partition by dep_id) as tot_employee   
, rank() over(partition by dep_id order by salary desc ) 
from emp
) 

select emp_id,emp_name,salary,dep_id,dep_name from temp1 
where rank =3 or ( tot_employee < 3 and tot_employee = rank)