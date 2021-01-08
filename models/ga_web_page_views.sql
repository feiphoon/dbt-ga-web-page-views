select
    cast(date as VARCHAR) as visit_date
    , cast(fullVisitorId as VARCHAR) as full_visitor_id
    , concat(concat(visit_date, fullVisitorId), visitId) as session_id
    -- , device.deviceCategory AS device_category
    -- , device.operatingSystem AS device_os
    -- , totals.transactions AS total_lead_transactions
    -- , totals.bounces AS bounces
  from {{ source('dbt_source', 'ga_17') }}
