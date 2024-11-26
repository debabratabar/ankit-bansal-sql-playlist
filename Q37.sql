CREATE TABLE public.sachin_score (
	Match int8 NULL,
	Innings float8 NULL,
	match_date text NULL,
	Versus text NULL,
	Ground text NULL,
	How Dismissed text NULL,
	Runs float8 NULL,
	Balls_faced float8 NULL,
	strike_rate float8 NULL
);

select * from sachin_score



-- find 1000 , 5000 , 10000 runs match & innings records 



with cte1 as ( 
select match ,  innings ,  runs , sum(runs) over(order by match ) as rn_sum
from sachin_score ss 
)
,  cte2 as ( 

select 1 as milestone_number , 1000 as milestones_runs  union all
select 2 as milestone_number , 5000 as milestones_runs  union all
select 3 as milestone_number , 10000 as milestones_runs union all
select 4 as milestone_number , 15000 as milestones_runs

)

select  a.milestone_number , a.milestones_runs ,min(match) , min(innings)
from cte2 a join cte1 b 
on b.rn_sum >= a.milestones_runs
group by a.milestone_number , a.milestones_runs 

