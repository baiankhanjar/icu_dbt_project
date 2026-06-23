{{ config(
    materialized='view'
) }}

select
    labevent_id,
    subject_id,
    hadm_id,
    specimen_id,
    itemid,
    order_provider_id,
    charttime,
    storetime,
    value,
    valuenum,
    valueuom,
    ref_range_lower,
    ref_range_upper,
    flag,
    priority,
    comments,

    case
        when valuenum is null then 'no_numeric_value'
        when ref_range_upper is not null and valuenum > ref_range_upper then 'high'
        when ref_range_lower is not null and valuenum < ref_range_lower then 'low'
        else 'normal'
    end as lab_status

from {{ source('icu_raw', 'raw_lab_events') }}