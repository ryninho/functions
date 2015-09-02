-- thanks to http://tapoueh.org/blog/2014/02/21-PostgreSQL-histogram

--TODO: create function histogram(query, binning_metric, min = min(binning_metric), max = max(binning_metric), buckets = 10, bar_height = 50)

with deltas as (
/*
query goes in this CTE, replacing the next three lines- should have rows that are to be counted for bar heights and a bin-able metric
 */
  SELECT extract(EPOCH from ratings.updated_at - order_deliveries.delivered_at)/(60*60*24) as days_rated_later
  FROM ratings
  INNER JOIN order_deliveries on order_deliveries.id = ratings.rateable_id
)
, histogram as (select width_bucket(days_rated_later, 0, 7, 7) as bucket --replace days_rated_later with binning metric (1 replacement), also set min, max and # of buckets
  , int4range(min(days_rated_later)::int, max(days_rated_later)::int, '[]') as range --replace days_rated_later with binning metric (2 replacements)
  , count(*) as ratings  --name should be changed from ratings to what the rows represent
  , round(count(*) / sum(count(*)) over ()::numeric, 2) as pct
from deltas
  where days_rated_later >= 0 --replace days_rated_later with binning metric (1 replacement); also change threshold if needed
GROUP BY 1
ORDER BY 1)

select bucket
  , range
  , ratings  --name should be changed from ratings to what the rows represent
  , repeat('*', (ratings::float / max(ratings) over() * 50)::int) as bar --name should be changed from ratings to what the rows represent (2 replacements); also change max bar height here if needed
  , pct
from histogram
