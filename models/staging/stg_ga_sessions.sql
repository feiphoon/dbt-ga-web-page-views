SELECT
  CAST(date AS VARCHAR) AS visit_date
  ,CAST(fullVisitorId AS VARCHAR) AS full_visitor_id
  ,CONCAT(CONCAT(visit_date, fullVisitorId), visitId) AS session_id
FROM {{ source('dbt_source', 'ga_17') }}
