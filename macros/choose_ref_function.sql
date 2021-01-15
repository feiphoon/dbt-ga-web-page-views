{% macro choose_ref_function(model_name, model_schema=none, is_source=false) %}
    {%- if is_source -%}
        {{ source(model_schema, model_name) }}
    {%- elif model_schema is not none -%}
        {{ ref(model_schema, model_name) }}
    {%- else -%}
        {{ ref(model_name) }}
    {%- endif -%}
{% endmacro %}