{# Check that a string date field always consists of 8 numbers only. #}
{% macro test_is_nodash_date(model, column_name) %}

WITH validation AS (
  SELECT
    {{ column_name }} AS nodash_date_field
  FROM {{ model }}
),

validation_errors AS (
  SELECT
    nodash_date_field
    , regexp_count(nodash_date_field, '^[0-9]{8}$') AS regexp_count
  FROM validation
  WHERE regexp_count = 0
)

SELECT count(*)
FROM validation_errors

{% endmacro %}