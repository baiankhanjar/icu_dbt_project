ICU dbt Project
1. Project Goal

I built a modern analytics engineering pipeline for ICU patient data using dbt and BigQuery.
The goal was to: Transform raw ICU healthcare data into analytics-ready tables

2. Tech Stack
dbt (data transformations)
BigQuery (data warehouse)
GitHub (version control)
VS Code (development environment)
dbt-utils package (reusable macros)

3. Data Architecture Layers
I structured the project into 3 layers:
- Raw Data (BigQuery sources)
Defined using sources.yml
raw_patients
raw_lab_events
raw_pharmacy

- Staging Layer
Cleaned and standardized data:
stg_patients
stg_lab_events
stg_pharmacy

Key transformations:
standardized gender values
cleaned patient attributes
prepared consistent formats

- Mart Layer (Business Logic)

Final analytics models:
icu_patient_summary
patient_lab_risk
fct_pharmacy_summary
icu_dashboard_patients
icu_top_critical_patients
These are used for reporting and dashboards.

4- Key Transformations Built
* Patient-level enrichment
Combined:
demographics
lab risk metrics
pharmacy utilization
into a single model: icu_patient_summary

*Risk scoring system
I created:
risk_score
risk_category
based on lab abnormalities.

* Pharmacy aggregation
Built metrics for example:
total_med_orders
unique_medications
iv_med_orders


5. dbt Macros Used
dbt_utils package
Installed via: dbt-labs/dbt_utils

Used for:
Surrogate Key Generation
{{ dbt_utils.generate_surrogate_key(['subject_id']) }}

Created unique hashed keys for patients.

Why surrogate keys matter:
ensure uniqueness
support joins across models
avoid relying on raw IDs


6. dbt Core Concepts Applied
ref()
Used for model dependencies: from {{ ref('stg_patients') }}
Enabled automatic DAG creation.

source()
Used for raw BigQuery tables: from {{ source('icu_raw', 'raw_patients') }}


DAG (Lineage Graph)
dbt automatically built model relationships:
raw → staging → marts → dashboards


7. Model Execution Understanding
dbt run
Executes transformations and creates tables/views in BigQuery
git push
Only saves code to GitHub (NO data changes)


8. Git Workflow
implemented:
git add .
git commit -m "update model"
git push

Key understanding:
Git = code versioning
dbt = execution engine
BigQuery = data storage


9. Debugging & Errors Solved
fixed real dbt issues:
SQL syntax errors
ambiguous column references
macro misuse (p.subject_id inside dbt_utils)
join aliasing issues


10. Testing Layer

We implemented:
unique tests
not_null tests
relationships tests
accepted_values tests
Ensured data quality across models.

11. Documentation Layer

We added:
model descriptions
column descriptions
business meaning for risk_score and patient_status

Built a mini data catalog.

12. Model Selection (DAG operations)

applied how to run specific parts of pipeline:

dbt run --select model
dbt run --select +model
dbt run --select model+

Used for efficient development.

13. BigQuery Integration

confirmed:
dbt creates views/tables in BigQuery
surrogate keys appear as hashed values
data updates only when dbt runs

14. Key Outcome of Project

successfully built a: End-to-end dbt analytics pipeline for ICU data

including:

staging layer
marts layer
transformations
tests
documentation
Git workflow
BigQuery deployment

Built an end-to-end dbt project on ICU healthcare data using BigQuery, implementing staging and mart layers, surrogate keys via dbt-utils, data quality tests, and documentation. The project includes modular SQL transformations, automated DAG-based dependencies, and Git version control for collaborative development.
