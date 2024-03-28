{% macro log_macro(a,b) %}
    {% set a = 5 %}
    {% set b = 'bob' %}

    {{ log("Running some_macro: " ~ a ~ ", " ~ b, info=True) }}
  
{% endmacro %}