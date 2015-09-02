-- thanks to http://tapoueh.org/blog/2014/02/21-PostgreSQL-histogram

--TODO: create function histogram(query, binning_metric, min = min(binning_metric), max = max(binning_metric), buckets = 10, bar_height = 50)

-- how soon are order issues reported?

with deltas as (
/*
query goes in this CTE, replacing the next three lines- should have rows that are to be counted for bar heights and a bin-able metric
 */
  SELECT extract(EPOCH from first_issues.first_issue - order_deliveries.delivered_at)/(60*60) as hours_later
  FROM (select order_delivery_id, min(created_at) as first_issue from order_issues GROUP BY 1) first_issues
  INNER JOIN order_deliveries on order_deliveries.id = first_issues.order_delivery_id
  WHERE order_deliveries.delivered_at > '2015-08-01'
)
, histogram as (select width_bucket(hours_later, 0, 72, 72) as bucket
  , int4range(min(hours_later)::int, max(hours_later)::int, '[]') as range --replace hours_later with binning metric (2 replacements)
  , count(*) as records  --name should be changed from ratings to what the rows represent
  , round(count(*) / sum(count(*)) over ()::numeric, 2) as pct
from deltas
  where hours_later >= 0 --replace hours_later with binning metric (1 replacement); also change threshold if needed
GROUP BY 1
ORDER BY 1)

select bucket
  , range
  , records  --name should be changed from ratings to what the rows represent
  , repeat('*', (records::float / max(records) over() * 50)::int) as frequency --name should be changed from ratings to what the rows represent (2 replacements); also change max bar height here if needed
  , pct
from histogram
