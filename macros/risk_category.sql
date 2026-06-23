{% macro risk_category(score_column) %}

case
    when {{ score_column }} >= 6 then 'high'
    when {{ score_column }} >= 3 then 'medium'
    else 'low'
end

{% endmacro %}