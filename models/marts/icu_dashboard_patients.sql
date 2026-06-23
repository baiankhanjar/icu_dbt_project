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
    infusion_orders,

    case
        when risk_category = 'high' then 3
        when risk_category = 'medium' then 2
        when risk_category = 'low' then 1
        else 0
    end as risk_priority_score,

    case
        when risk_score >= 6 then 'CRITICAL ICU'
        when risk_score >= 3 then 'WATCH'
        else 'STABLE'
    end as clinical_status

from {{ ref('icu_patient_summary') }}