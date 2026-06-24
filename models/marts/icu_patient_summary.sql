with patients as (
    select *
    from {{ ref('stg_patients') }}
),

labs as (
    select *
    from {{ ref('patient_lab_risk') }}
),

pharmacy as (
    select *
    from {{ ref('fct_pharmacy_summary') }}
)

select
    {{ dbt_utils.generate_surrogate_key(['p.subject_id']) }} as patient_key, 

    p.subject_id,
    p.gender,
    p.anchor_age,
    p.patient_status,

    l.total_labs,
    l.high_labs,
    l.low_labs,
    l.risk_score,

    coalesce(ph.total_med_orders, 0) as total_med_orders,
    coalesce(ph.unique_medications, 0) as unique_medications,
    coalesce(ph.iv_med_orders, 0) as iv_med_orders,
    coalesce(ph.infusion_orders, 0) as infusion_orders,

    {{ risk_category('l.risk_score') }} as risk_category

from patients p
left join labs l
    on p.subject_id = l.subject_id
left join pharmacy ph
    on p.subject_id = ph.subject_id