select name,count(*),sum(open),sum(high),sum(volume) as volume from all_stocks 
group by name order by volume desc limit 10

select name,count(*),sum(open),sum(high),sum(volume) as volume from all_stocks 
group by name order by volume asc limit 10
--
select name,max(open) as max_open ,max(high) as max_high,max(volume) as max_volume
,min(open) as min_open ,min(high) as min_high,min(volume) as min_volume
from all_stocks 
group by name  order by max_volume asc limit 10
--
select date,volume
,sum(volume) over (partition by date )as volume,
volume/sum(volume)over (partition by date ) * 100 as prctvolume
from all_stocks  where date='2013-02-08' order by 1,2
--
select date_part('year',date) as year, sum(volume) as sum_volume,avg(volume) as avg_volume
from all_stocks group by date_part('year',date) order by sum_volume desc
--
select date_part('day',date) as day,volume
from all_stocks where (date_part('month',date)=2 and  date_part('year',date)=2013) 
order by day desc
--
select year,month,volume_sum,volume_sum/sum(volume_sum)over (partition by year ) * 100 as prctvolume
from
(select  date_part('year',date) as year, 
date_part('month',date) as month 
,sum(open) as volume_sum from all_stocks 
group by date_part('year',date),date_part('month',date)
) s where year=2017
 order by 1,2
--
