{{ config(materialized='table', pre_hook=["SET json_serialization_enable TO true"]) }}
WITH hits as (
  SELECT
    ga.session_id
    ,hits.hit_id
    ,hits.hit_number
    ,JSON_EXTRACT_ARRAY_ELEMENT_TEXT(ga.hits, hits.hit_number::int, true) AS hit
  FROM {{ ref('stg_ga_hits') }} hits
  LEFT JOIN {{ ref('stg_ga_hit_counts') }} ga USING(session_id)
),

custom_dimensions AS (
  SELECT 
    h.session_id
    ,h.hit_id
    ,h.hit_number
    ,REPLACE(REPLACE(REGEXP_REPLACE(TRANSLATE(JSON_EXTRACT_PATH_TEXT(h.hit, 'customDimensions', true), '[]', ''), '("index":)|("value":)', ''), '","', '":"'), '},{', ',') AS cd_map
  FROM hits h
)

SELECT
  cd.session_id
  ,cd.hit_id
  ,cd.hit_number
  {% for dimension in range(1, 201) -%}
  ,JSON_EXTRACT_PATH_TEXT(cd.cd_map, {{ dimension }}, true) AS cd_{{ dimension }}
  {% endfor -%}
FROM custom_dimensions cd