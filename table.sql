drop table solr_log;

create table solr_log (
       timestamp timestamp not null,
       collection text not null,
       query text not null,
       start_row integer not null,
       requested_rows integer,
       hits integer not null,
       query_milliseconds integer not null
);
