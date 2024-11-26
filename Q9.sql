drop table if exists users 
create table users (
user_id         int     ,
 join_date       date    ,
 favorite_brand  varchar(50));

drop table if exists orders ; 
 create table orders (
 order_id       int     ,
 order_date     date    ,
 item_id        int     ,
 buyer_id       int     ,
 seller_id      int 
 );


drop table if exists items;
 create table items
 (
 item_id        int     ,
 item_brand     varchar(50)
 );


 insert into users values (1,'2019-01-01','Lenovo'),(2,'2019-02-09','Samsung'),(3,'2019-01-19','LG'),(4,'2019-05-21','HP');

 insert into items values (1,'Samsung'),(2,'Lenovo'),(3,'LG'),(4,'HP');

 insert into orders values (1,'2019-08-01',4,1,2),(2,'2019-08-02',2,1,3),(3,'2019-08-03',3,2,3),(4,'2019-08-04',1,4,2)
 ,(5,'2019-08-04',1,3,4),(6,'2019-08-05',2,2,4);
 

select * from orders 

select * from users

select * from items 


with temp1 as (
select  o.seller_id ,  u.favorite_brand   , i.item_brand , 
rank() over(partition by o.seller_id  order by order_date) as rn 
from users u   join  orders o on o.seller_id = u.user_id
 join items i on o.item_id = i.item_id ) 
select u1.user_id , case when t1.favorite_brand = item_brand then 'Yes' else 'No' end as second_item_fav_brand  from 
users u1 left  join  temp1 t1 
on u1.user_id =t1.seller_id 
and rn=2
order by 1