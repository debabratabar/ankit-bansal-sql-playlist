create table candidates (
emp_id int,
experience varchar(20),
salary int
);
delete from candidates;
insert into candidates values
(1,'Junior',10000),(2,'Junior',15000),(3,'Junior',40000),(4,'Senior',16000),(5,'Senior',20000),(6,'Senior',50000);



select * from candidates


/*A company wants to hire new employees. The budget of the company for the salaries is $70009. 
 * The company's criteria for hiring are
 * Keep hiring the senior with the smallest salary until you cannot hire any more seniors.
 * Use the remaining budget to hire the junior with the smallest salary. Keep hiring the junior with the smallest salary 
 * until you cannot hire any more juniors.
 * Write an SQL query to find the seniors and juniors hired under the mentioned criteria.
*/




-- 1st method using cte for senior and junior seperately and running sum 

with seniorlist as ( 
select * , sum(salary) over(order by salary) as rn_sum , 70000 as budget
from candidates
where experience ='Senior'
), junior_list as (
select * , sum(salary) over(order by salary) as rn_sum , 70000 -  ( select max(rn_sum) from seniorlist where rn_sum < budget) as budget
from candidates
where experience ='Junior'
) 
select emp_id,experience,salary
from seniorlist where  rn_sum < budget
union all 
select emp_id,experience,salary
from junior_list where  rn_sum < budget
