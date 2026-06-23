select
    p.subject_id,
    p.gender,
    p.anchor_age,
    p.anchor_year,
    p.anchor_year_group,
    p.dod,
    p.patient_status,

    l.labevent_id,
    l.itemid,
    l.charttime,
    l.valuenum,
    l.valueuom,
    l.lab_status

from {{ ref('stg_patients') }} p
left join {{ ref('stg_lab_events') }} l
    on p.subject_id = l.subject_id