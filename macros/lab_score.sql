{% macro lab_score(status_column) %}

case
    when {{ status_column }} = 'high' then 2
    when {{ status_column }} = 'low' then 1
    else 0
end

{% endmacro %}