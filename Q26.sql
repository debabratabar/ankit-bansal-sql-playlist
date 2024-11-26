CREATE TABLE subscriber (
 sms_date date ,
 sender varchar(20) ,
 receiver varchar(20) ,
 sms_no int
);
-- insert some values
INSERT INTO subscriber VALUES ('2020-4-1', 'Avinash', 'Vibhor',10);
INSERT INTO subscriber VALUES ('2020-4-1', 'Vibhor', 'Avinash',20);
INSERT INTO subscriber VALUES ('2020-4-1', 'Avinash', 'Pawan',30);
INSERT INTO subscriber VALUES ('2020-4-1', 'Pawan', 'Avinash',20);
INSERT INTO subscriber VALUES ('2020-4-1', 'Vibhor', 'Pawan',5);
INSERT INTO subscriber VALUES ('2020-4-1', 'Pawan', 'Vibhor',8);
INSERT INTO subscriber VALUES ('2020-4-1', 'Vibhor', 'Deepak',50);



-- new concept 
/*
 * verical sorting 
 * where we use two column value to sort vartically 
 */
with temp1 as ( 
select sms_date ,  
case when sender  < receiver  then sender else receiver end as sender_per
,case when sender  > receiver  then sender else receiver end as receiver_per
,sms_no
from subscriber s )
select sms_date , sender_per , receiver_per , sum(sms_no) from temp1
group by 1 , 2,3
order by 1,2