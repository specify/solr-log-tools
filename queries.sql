select collection, count(*) as total_queries
from solr_log
where start_row = 0 and timestamp < '2015-01-01'
group by collection order by collection;

select collection, count(distinct query) as distinct_queries
from solr_log
where start_row = 0 and timestamp < '2015-01-01'
group by collection order by collection;

select collection, extract(month from timestamp) as month, count(*) as total_queries
from solr_log
where start_row = 0 and timestamp < '2015-01-01'
group by collection, month order by collection, month;

select collection, query, count(*) as query_count, max(hits) as max_hits
from solr_log
where start_row = 0 and timestamp < '2015-01-01'
group by collection, query having count(*) > 5
order by collection, query_count desc;

select collection, sum(hits) as total_hits
from solr_log
where start_row = 0 and timestamp < '2015-01-01'
group by collection order by collection;
