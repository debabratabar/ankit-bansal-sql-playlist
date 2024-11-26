CREATE TABLE friends (
    user_id INT,
    friend_id INT
);

-- Insert data into friends table
INSERT INTO friends VALUES
(1, 2),
(1, 3),
(1, 4),
(2, 1),
(3, 1),
(3, 4),
(4, 1),
(4, 3);

-- select * from friends;


CREATE TABLE likes (
    user_id INT,
    page_id CHAR(1)
);

-- Insert data into likes table
INSERT INTO likes VALUES
(1, 'A'),
(1, 'B'),
(1, 'C'),
(2, 'A'),
(3, 'B'),
(3, 'C'),
(4, 'B');


select 
distinct  user_id , page_id 
from (
select distinct  f.user_id , l.page_id
from friends f  join likes  l 
on f.friend_id  = l.user_id  
) a  where not exists 
( select 1 from 
(
-- user_friend_likes 
select distinct  f.user_id , l.page_id
from friends f  join likes  l 
on f.user_id  = l.user_id
) b 
where  a.user_id = b.user_id
and a.page_id = b.page_id 
-- order by f.user_id
);




-- 2nd method 

select distinct  f.user_id , l.page_id
from friends f  join likes  l 
on f.friend_id  = l.user_id  
where  (f.user_id , l.page_id) not in 
( select distinct  f.user_id , l.page_id
  
from friends f  join likes  l 
on f.user_id  = l.user_id )
;
