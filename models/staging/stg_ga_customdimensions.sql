SELECT
    {{ ga_session_id("ga") }}
    ,cd.index
    ,cd.value
FROM {{ source('dbt_source', 'ga_17') }} ga
LEFT JOIN ga.customDimensions cd ON TRUE