{% snapshot patient_snapshot %}

{{
    config(
      target_schema='snapshots',
      unique_key='subject_id',
      strategy='check',
      check_cols=['patient_status']
    )
}}

select
    subject_id,
    patient_status
from {{ ref('stg_patients') }}

{% endsnapshot %}