SELECT
  {{ ga_session_id("ga") }}
  ,CAST(ga.date AS VARCHAR) AS visit_date
  ,CAST(ga.fullVisitorId AS VARCHAR) AS full_visitor_id
  ,ga.visitId AS visit_id
  ,ga.clientId AS client_id
  ,timestamp 'epoch' + cast(ga.visitStartTime AS bigint) * interval '1 second' AS visit_start_timestamp
  ,ga.visitNumber AS visit_number
  ,ga.channelGrouping AS channel_grouping
  ,ga.totals.hits AS hits
  ,ga.totals.newVisits AS new_visits
  ,ga.totals.screenviews AS total_screenviews
  ,ga.totals.timeOnScreen AS total_time_on_screen
  ,ga.totals.timeOnSite AS total_time_on_site
  ,ga.totals.transactions AS total_lead_transactions
  ,ga.totals.uniqueScreenViews AS unique_screenviews
  
FROM {{ source('dbt_source', 'ga_17') }} ga
