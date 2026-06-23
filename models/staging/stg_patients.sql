{{ config(materialized='view') }}

select
    subject_id,
    {{ standardize_gender('gender') }} as gender,
    anchor_age,
    anchor_year,
    anchor_year_group,
    dod,
    current_date() as load_date,
    current_timestamp() as load_timestamp,

    {{ patient_status('dod') }} as patient_status,

    (anchor_year - anchor_age) as estimated_birth_year

from {{ source('icu_raw', 'raw_patients') }}