select
    subject_id,
    anchor_year,

    {{ dbt_utils.generate_surrogate_key(
        ['subject_id', 'anchor_year']
    ) }} as patient_year_key

from {{ ref('stg_patients') }}

limit 20