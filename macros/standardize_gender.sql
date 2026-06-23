{% macro standardize_gender(gender_column) %}

case
    when upper({{ gender_column }}) in ('M', 'MALE') then 'Male'
    when upper({{ gender_column }}) in ('F', 'FEMALE') then 'Female'
    else 'Unknown'
end

{% endmacro %}