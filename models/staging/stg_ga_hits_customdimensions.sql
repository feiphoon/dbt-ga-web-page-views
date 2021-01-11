SELECT
    {{ ga_session_id("ga") }}
    ,{{ hit_id("session_id", "hits") }}
    ,hits.hitNumber AS hit_number
    ,cd.index
    ,cd.value
FROM {{ source('dbt_source', 'ga_17') }} ga
LEFT JOIN ga.hits hits ON TRUE
LEFT JOIN hits.customDimensions cd ON TRUE