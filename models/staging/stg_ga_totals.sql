SELECT
    {{ ga_session_id() }}
    ,ga.totals.bounces
    ,ga.totals.transactions AS total_lead_transactions
FROM {{ source('dbt_source', 'ga_17') }} ga