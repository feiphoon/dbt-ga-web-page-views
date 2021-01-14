{{ config(materialized='view', sort=['session_id', 'hit_id', 'hit_number']) }}
SELECT
    {{ ga_session_id("ga") }}
    ,{{ hit_id("session_id", "hits") }}
    ,hits.hitNumber::int AS hit_number
    ,cd.index::int
    ,cd.value
FROM {{ source('dbt_source', 'ga_17') }} ga
INNER JOIN ga.hits hits ON TRUE
INNER JOIN hits.customDimensions cd ON TRUE
