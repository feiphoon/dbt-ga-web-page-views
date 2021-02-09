{% macro choose_ref_function(model_name, model_package=none, is_source=false) %}
    {%- if is_source -%}
        {{ source(model_package, model_name) }}
    {%- elif model_package is not none -%}
        {{ ref(model_package, model_name) }}
    {%- else -%}
        {{ ref(model_name) }}
    {%- endif -%}
{% endmacro %}