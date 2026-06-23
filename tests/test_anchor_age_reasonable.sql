select *
from {{ ref('stg_patients') }}
where anchor_age < 0
   or anchor_age > 120