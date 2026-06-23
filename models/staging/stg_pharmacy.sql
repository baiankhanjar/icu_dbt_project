{{ config(materialized='view') }}

select
    subject_id,
    hadm_id,
    pharmacy_id,
    poe_id,

    coalesce(nullif(trim(medication), ''), 'unknown') as medication,

    proc_type,
    status,

    route,
    frequency,
    disp_sched,
    infusion_type,

    sliding_scale,
    lockout_interval,
    basal_rate,
    one_hr_max,
    doses_per_24_hrs,

    duration,
    duration_interval,

    starttime,
    stoptime,
    entertime,
    verifiedtime,
    expirationdate,

    dispensation,
    fill_quantity

from {{ source('icu_raw', 'raw_pharmacy') }}