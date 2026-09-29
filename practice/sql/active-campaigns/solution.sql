select ad_campaign,
       count(*) as impressions,
       sum(revenue) as total_revenue,
       round(100.0 * sum(clicked) / count(*), 1) as ctr
from ad_impressions
group by ad_campaign
having count(*) > 15
order by ctr desc, ad_campaign asc;
