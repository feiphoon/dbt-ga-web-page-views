{% macro test_is_nodash_date(model, column_name) %}

with validation as (
  select
    {{ column_name }} as nodash_date_field
  from {{ model }}
),

validation_errors as (
  select
    nodash_date_field
  from validation
  where nodash_date_field like '^[1-2][0-9][0-9][0-9][0-1][0-9][0-3][0-9]$'
)

select count(*)
from validation_errors

{% endmacro %}