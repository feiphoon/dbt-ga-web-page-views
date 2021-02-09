{{ config(materialized='view', sort=['generated_number']) }}
{{ dbt_utils.generate_series(upper_bound=500) }}