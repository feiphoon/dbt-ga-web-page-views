SELECT
    CONCAT(CONCAT(ga.visit_date, ga.fullVisitorId), ga.visitId) AS session_id
    ,ga.totals.visits
    ,ga.totals.bounces
    ,ga.totals.transactions AS total_lead_transactions
FROM {{ source('dbt_source', 'ga_17') }} ga