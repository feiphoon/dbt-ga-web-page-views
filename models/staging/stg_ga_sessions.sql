SELECT
  {{ ga_session_id() }}
  ,CAST(date AS VARCHAR) AS visit_date
  ,CAST(fullVisitorId AS VARCHAR) AS full_visitor_id
  
FROM {{ source('dbt_source', 'ga_17') }}
