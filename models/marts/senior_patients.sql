
select *
from {{ ref('stg_patients') }}
where anchor_age >= {{ var('senior_age') }}