

select
    subject_id,

    count(distinct pharmacy_id) as total_med_orders,
    count(distinct medication) as unique_medications,

    countif(route = 'IV') as iv_med_orders,
    countif(infusion_type is not null) as infusion_orders

from {{ ref('stg_pharmacy') }}

group by subject_id