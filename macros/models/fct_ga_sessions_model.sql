{% macro fct_ga_sessions_model(model_name, model_schema=none, is_source=false) %}
SELECT
  ga.session_id
  ,ga.visit_date
  ,ga.full_visitor_id
  ,ga.visit_id
  ,ga.client_id
  ,ga.visit_start_timestamp
  ,ga.visit_number
  ,ga.channel_grouping
  ,ga.hits
  ,ga.new_visits
  ,ga.total_screenviews
  ,ga.total_time_on_screen
  ,ga.total_time_on_site
  ,ga.total_lead_transactions
  ,ga.unique_screenviews
FROM {{ choose_ref_function(model_name, model_schema, is_source) }} ga
{% endmacro %}
