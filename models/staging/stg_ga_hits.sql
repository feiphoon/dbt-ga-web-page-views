{{ config(materialized='table', sort='session_id', dist='session_id') }}
SELECT
    {{ ga_session_id("ga") }}
    ,{{ hit_id("session_id", "hits") }}
    ,hits.hitNumber::int AS hit_number
    ,hits.type AS hit_type 
    ,hits.hour AS hit_hour
    ,hits.minute AS hit_minute
    ,ROUND(hits.time/1000.0, 3) AS hit_time
    ,hits.isEntrance AS is_entrance
    ,hits.isExit AS is_exit
    ,hits.dataSource AS data_source
    ,hits.page.pagePathLevel1 AS page_path_level_1
    ,hits.page.pagePathLevel2 AS page_path_level_2
    ,hits.page.pagePathLevel3 AS page_path_level_3
    ,hits.page.pagePathLevel4 AS page_path_level_4
    ,hits.contentGroup.contentGroup2 AS content_group
    ,hits.contentGroup.previousContentGroup2 AS previous_content_group
FROM {{ source('dbt_source', 'ga_17') }} ga
INNER JOIN ga.hits hits ON TRUE