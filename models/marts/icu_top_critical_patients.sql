select
    subject_id,
    gender,
    anchor_age,
    patient_status,

    total_labs,
    high_labs,
    low_labs,
    risk_score,
    risk_category,

    total_med_orders,
    unique_medications,
    iv_med_orders,
    infusion_orders

from {{ ref('icu_patient_summary') }}

where risk_category = 'high'

order by risk_score desc