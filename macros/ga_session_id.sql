{% macro ga_session_id() -%}
CONCAT(CONCAT(date, fullVisitorId), visitId) AS session_id
{% endmacro -%}