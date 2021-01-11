{% macro hit_id(session_id, hits_alias) -%}
CONCAT({{ session_id }}, {{ hits_alias }}.hitNumber) AS hit_id
{%- endmacro -%}