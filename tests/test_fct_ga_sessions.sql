SELECT
    * 
FROM (
    {{ fct_ga_sessions_model('fct_ga_sessions_input') }}

    EXCEPT

    SELECT * FROM {{ ref('fct_ga_sessions_expected') }}
)

UNION ALL

SELECT
    * 
FROM (
    SELECT * FROM {{ ref('fct_ga_sessions_expected') }}

    EXCEPT

    {{ fct_ga_sessions_model('fct_ga_sessions_input') }}
)