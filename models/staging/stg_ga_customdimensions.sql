-- This is a wide table but it runs in reasonable time
SELECT
    {{ ga_session_id("ga") }}
    ,{{ dbt_utils.pivot(
        'cd.index',
        range(1, 200),
        agg='max',
        prefix='cd_',
        then_value='cd.value',
        else_value='null'
    ) }}
FROM {{ source('dbt_source', 'ga_17') }} ga
LEFT JOIN ga.customDimensions cd ON TRUE
GROUP BY 1