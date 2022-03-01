select distinct(id_commande) , count(*) as nbr from hypermarcher group by id_commande
order by nbr desc
--
select distinct(categories) , count(*) as nbr from hypermarcher group by categories
order by nbr desc
--
select distinct(region) , count(*) as nbr from hypermarcher group by region
order by nbr desc
--
select distinct(zone_geographique) , count(*) as nbr from hypermarcher group by zone_geographique
order by nbr desc
--
select distinct(pays_region) , count(*) as nbr from hypermarcher group by pays_region
order by nbr desc
--
select distinct(segment) , count(*) as nbr from hypermarcher group by segment
order by nbr desc
--
select nom_produit,count(*) ,sum(profit) from hypermarcher  group by nom_produit
 order by 3 desc
--
select categories,zone_geographique, sum(ventes)::numeric as ventes, sum (profit)::numeric as profit
, sum (quantite) as qty  from hypermarcher group by categories,zone_geographique
--
select ville,zone_geographique, sum(ventes)::numeric as ventes, sum (profit)::numeric as profit
, sum (quantite) as qty  from hypermarcher group by ville,zone_geographique
order by profit desc
--
select date_commande ,count(*) as nbr_cmd ,sum(ventes)::numeric as ventes, sum (profit)::numeric as profit
, sum (quantite) as qty  from hypermarcher group by date_commande
order by  profit asc
--BAD PROFIT
select nom_produit , zone_geographique, remise ,quantite,ventes,profit from hypermarcher
where date_commande='2019-06-10'
--BAD PRODUCT
select nom_produit  ,sum(ventes) as vnt,sum(profit) as prf 
,(sum(ventes)  + sum(profit) ) as total
from hypermarcher where nom_produit='Hoover Plaque de cuisson. Blanc' 
group by nom_produit
--
SELECT 5 * FLOOR(Profit / 5),
SUM(CASE WHEN zone_geographique = 'Nord' THEN 1 ELSE 0 END) as Nord,
SUM(CASE WHEN zone_geographique = 'Centre' THEN 1 ELSE 0 END) as Centre
FROM hypermarcher
WHERE zone_geographique IN ('Nord', 'Centre')
 GROUP BY Profit
--Compte par mois de vente Cente-Nord-Sud 
SELECT zone_geographique,
SUM(CASE WHEN date_part('month',date_commande)  = 1 THEN 1 ELSE 0 END) as Jan,
SUM(CASE WHEN date_part('month',date_commande)  = 2 THEN 1 ELSE 0 END) as Fev,
SUM(CASE WHEN date_part('month',date_commande)  = 3 THEN 1 ELSE 0 END) as Mars,
SUM(CASE WHEN date_part('month',date_commande)  = 4 THEN 1 ELSE 0 END) as Avril,
SUM(CASE WHEN date_part('month',date_commande)  = 5 THEN 1 ELSE 0 END) as Mai,
SUM(CASE WHEN date_part('month',date_commande)  = 6 THEN 1 ELSE 0 END) as Juin,
SUM(CASE WHEN date_part('month',date_commande)  = 7 THEN 1 ELSE 0 END) as Juillet,
SUM(CASE WHEN date_part('month',date_commande)  = 8 THEN 1 ELSE 0 END) as Aout,
SUM(CASE WHEN date_part('month',date_commande)  = 9 THEN 1 ELSE 0 END) as Sept,
SUM(CASE WHEN date_part('month',date_commande)  = 10 THEN 1 ELSE 0 END) as Oct,
SUM(CASE WHEN date_part('month',date_commande)  = 11 THEN 1 ELSE 0 END) as Nov,
SUM(CASE WHEN date_part('month',date_commande)  = 12 THEN 1 ELSE 0 END) as Dec
FROM hypermarcher
GROUP BY zone_geographique
ORDER BY zone_geographique
--
select ville  ,sum(profit) as prft from hypermarcher group by ville order by
prft desc limit 20 

SELECT ville,
SUM(CASE WHEN date_part('month',date_commande)  = 1 THEN 1 ELSE 0 END) as Jan,
SUM(CASE WHEN date_part('month',date_commande)  = 2 THEN 1 ELSE 0 END) as Fev,
SUM(CASE WHEN date_part('month',date_commande)  = 3 THEN 1 ELSE 0 END) as Mars,
SUM(CASE WHEN date_part('month',date_commande)  = 4 THEN 1 ELSE 0 END) as Avril,
SUM(CASE WHEN date_part('month',date_commande)  = 5 THEN 1 ELSE 0 END) as Mai,
SUM(CASE WHEN date_part('month',date_commande)  = 6 THEN 1 ELSE 0 END) as Juin,
SUM(CASE WHEN date_part('month',date_commande)  = 7 THEN 1 ELSE 0 END) as Juillet,
SUM(CASE WHEN date_part('month',date_commande)  = 8 THEN 1 ELSE 0 END) as Aout,
SUM(CASE WHEN date_part('month',date_commande)  = 9 THEN 1 ELSE 0 END) as Sept,
SUM(CASE WHEN date_part('month',date_commande)  = 10 THEN 1 ELSE 0 END) as Oct,
SUM(CASE WHEN date_part('month',date_commande)  = 11 THEN 1 ELSE 0 END) as Nov,
SUM(CASE WHEN date_part('month',date_commande)  = 12 THEN 1 ELSE 0 END) as Dec,
SUM(profit) as profit

FROM hypermarcher
GROUP BY ville
ORDER BY profit desc
limit 50
--
SELECT sous_categories,
SUM(CASE WHEN date_part('month',date_commande)  = 1 THEN 1 ELSE 0 END) as Jan,
SUM(CASE WHEN date_part('month',date_commande)  = 2 THEN 1 ELSE 0 END) as Fev,
SUM(CASE WHEN date_part('month',date_commande)  = 3 THEN 1 ELSE 0 END) as Mars,
SUM(CASE WHEN date_part('month',date_commande)  = 4 THEN 1 ELSE 0 END) as Avril,
SUM(CASE WHEN date_part('month',date_commande)  = 5 THEN 1 ELSE 0 END) as Mai,
SUM(CASE WHEN date_part('month',date_commande)  = 6 THEN 1 ELSE 0 END) as Juin,
SUM(CASE WHEN date_part('month',date_commande)  = 7 THEN 1 ELSE 0 END) as Juillet,
SUM(CASE WHEN date_part('month',date_commande)  = 8 THEN 1 ELSE 0 END) as Aout,
SUM(CASE WHEN date_part('month',date_commande)  = 9 THEN 1 ELSE 0 END) as Sept,
SUM(CASE WHEN date_part('month',date_commande)  = 10 THEN 1 ELSE 0 END) as Oct,
SUM(CASE WHEN date_part('month',date_commande)  = 11 THEN 1 ELSE 0 END) as Nov,
SUM(CASE WHEN date_part('month',date_commande)  = 12 THEN 1 ELSE 0 END) as Dec,
SUM(profit) as profit

FROM hypermarcher
GROUP BY sous_categories
ORDER BY profit desc

--
select  date_part('year',date_commande) as annee ,date_part('month',date_commande) as mois,segment,sous_categories,sum(quantite) as S_quantite ,sum(ventes) as ventes , sum(profit)as profit from hypermarcher
 group by date_part('year',date_commande),date_part('month',date_commande),segment,sous_categories order by 1,2,3 asc


--partition by year
select year,month,profit_sum,profit_sum/sum(profit_sum)over (partition by year ) * 100 as prctvolume
from
(select  date_part('year',date_commande) as year, 
date_part('month',date_commande) as month 
,sum(profit) as profit_sum from hypermarcher 
group by date_part('year',date_commande),date_part('month',date_commande) order by year,month
) s where year=2017
 order by 1,2
 --partition by categories
 select categories,region,profit_sum,profit_sum/sum(profit_sum)over (partition by categories ) * 100 as prctvolume
from
(select  categories,region, sum(profit) as profit_sum from hypermarcher 
group by categories,region order by categories
) s where categories='Fournitures de bureau'
 order by prctvolume desc
 
--partition by segment
 select segment,region,profit_sum,profit_sum/sum(profit_sum)over (partition by segment ) * 100 as prctvolume
from
(select  segment,region, sum(profit) as profit_sum from hypermarcher 
group by segment,region order by segment
) s 
 order by 4 desc

