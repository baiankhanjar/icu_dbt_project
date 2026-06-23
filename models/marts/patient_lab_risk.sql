select
    p.subject_id,
    p.gender,
    p.anchor_age,
    p.patient_status,

    countif(l.lab_status = 'high') as high_labs,
    countif(l.lab_status = 'low') as low_labs,
    countif(l.lab_status = 'no_numeric_value') as missing_labs,

    count(l.labevent_id) as total_labs,

    -- simple risk score
    (
        countif(l.lab_status = 'high') * 2 +
        countif(l.lab_status = 'low') * 1
    ) as risk_score

from {{ ref('stg_patients') }} p
left join {{ ref('stg_lab_events') }} l
    on p.subject_id = l.subject_id

group by
    p.subject_id,
    p.gender,
    p.anchor_age,
    p.patient_status