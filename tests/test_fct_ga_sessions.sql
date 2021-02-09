{{ fct_ga_sessions_model('fct_ga_sessions_input') }}

EXCEPT

SELECT * FROM {{ ref('fct_ga_sessions_expected') }}
