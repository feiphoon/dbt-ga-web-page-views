{% macro ga_session_id(alias) -%}
CONCAT(CONCAT({{ alias }}.date, {{ alias }}.fullVisitorId), {{ alias }}.visitId) AS session_id
{%- endmacro -%}