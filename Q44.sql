create table rental_amenities (
rental_id int, 
amenity varchar(50)
)

insert into rental_amenities(rental_id ,amenity)
values 
(123  , 'pool'),
(123  , 'kitchen'),
(234  , 'hot tub'),
(234  , 'fireplace'),
(345  , 'kitchen'),
(345  , 'pool'),
(456 , 'pool');


--matching rental Amenities 




with temp1 as (
select  rental_id , amenity   , row_number () over(partition by rental_id order by amenity) rn
from rental_amenities
) , cte1 as (
select rental_id , string_agg( amenity , ',' order by  rn ) --over( partition by rental_id order by  rn ) as score 
from temp1 
group by rental_id
) 
select count(1)
from cte1 c1  left join cte1 c2
on c1.rental_id !=c2.rental_id and c1.rental_id >c2.rental_id 
where  c1.string_agg  = c2.string_agg