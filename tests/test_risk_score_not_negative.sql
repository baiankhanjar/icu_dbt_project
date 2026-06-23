select *
from {{ ref('patient_lab_risk') }}
where risk_score < 0