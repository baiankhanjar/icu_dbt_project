with patients as (

    select *
    from {{ ref('stg_patients') }}

),

labs as (

    select *
    from {{ ref('stg_lab_events') }}

)

select
    p.subject_id,
    p.gender,
    p.anchor_age,
    p.patient_status,

    l.labevent_id,
    l.lab_status

from patients p
left join labs l
    on p.subject_id = l.subject_id

    