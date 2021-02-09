{% macro convert_epoch_to_timestamp(table_alias, column_name) -%}
timestamp 'epoch' + cast({{ table_alias }}.{{ column_name }} AS bigint) * interval '1 second'
{%- endmacro -%}