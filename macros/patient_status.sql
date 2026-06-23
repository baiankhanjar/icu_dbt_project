{% macro patient_status(dod_column) %}

case
    when {{ dod_column }} is null then 'alive'
    else 'deceased'
end

{% endmacro %}