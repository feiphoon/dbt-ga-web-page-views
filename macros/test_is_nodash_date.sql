{# Check that a string date field always consists of 8 numbers only. #}
{% macro test_is_nodash_date(model, column_name) %}

with validation as (
  select
    {{ column_name }} as nodash_date_field
  from {{ model }}
),

validation_errors as (
  select
    nodash_date_field
    , regexp_count(nodash_date_field, '^[0-9]{8}$') as regexp_count
  from validation
  where regexp_count = 0
)

select count(*)
from validation_errors

{% endmacro %}