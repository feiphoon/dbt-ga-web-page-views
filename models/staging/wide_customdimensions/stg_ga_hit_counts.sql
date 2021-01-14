{{ config(materialized='view', sort='session_id', dist='session_id', pre_hook=["SET json_serialization_enable TO true"]) }}
SELECT
    {{ ga_session_id("ga") }}
    ,JSON_ARRAY_LENGTH(ga.hits, true) AS number_of_hits
    ,ga.hits
FROM {{ source('dbt_source', 'ga_17') }} ga