# ICU Patient Clinical Analytics Pipeline (dbt + BigQuery + Power BI)

## 1. Project Overview

This project demonstrates a complete analytics engineering pipeline for ICU patient data using dbt and BigQuery.
The goal is to transform raw healthcare data into analytics-ready models that support clinical insights such as patient risk stratification, lab severity analysis, and medication usage patterns.


## 2. Tech Stack

- dbt (Data transformation & modeling)
- BigQuery (Data warehouse)
- GitHub (Version control)
- VS Code (Development environment)
- dbt-utils (Reusable macros and utilities)
- Power BI (Data visualization)



## 3. Data Architecture

The project follows a modern layered dbt architecture:

### Raw Layer (Sources)
Defined using `sources.yml`:

- raw_patients  
- raw_lab_events  
- raw_pharmacy  


### Staging Layer (Data Cleaning)
Standardized and cleaned raw data:

- stg_patients  
- stg_lab_events  
- stg_pharmacy  

Key transformations:
- Standardized categorical values (gender, status)
- Cleaned and structured raw fields
- Prepared consistent formats for modeling



### Mart Layer (Business Logic)
Final analytics-ready models:

- icu_patient_summary  
- patient_lab_risk  
- fct_pharmacy_summary  
- icu_dashboard_patients  
- icu_top_critical_patients  

These models are used directly for reporting and dashboarding.


## 4. Key Transformations

### Patient Enrichment Model
Combined:
- Demographics
- Lab risk metrics
- Pharmacy utilization
into a unified patient-level analytics table:
- `icu_patient_summary`


### Risk Scoring System
Developed a clinical risk framework:

- `risk_score`
- `risk_category` (low / medium / high)
based on laboratory abnormalities.


### Pharmacy Aggregation
Built medication usage metrics:

- total_med_orders  
- unique_medications  
- iv_med_orders  
to measure treatment intensity.


## 5. dbt Macros & Utilities

Used `dbt-utils` package:

```sql
{{ dbt_utils.generate_surrogate_key(['subject_id']) }}

Purpose of surrogate keys:
Ensure unique patient identifiers
Improve join consistency
Avoid reliance on raw business keys


6. dbt Core Concepts Applied
🔹 ref()

Used for model dependencies:

from {{ ref('stg_patients') }}

Enables automatic DAG creation and modular SQL.

🔹 source()

Used for raw data ingestion:

from {{ source('icu_raw', 'raw_patients') }}
🔹 DAG (Lineage Graph)

dbt automatically manages dependencies:

Raw → Staging → Marts → Dashboard
7. Model Execution
dbt run

Executes transformations and builds models in BigQuery.

Git vs dbt
Git → version control (code only)
dbt → executes transformations
BigQuery → stores final data
8. Git Workflow

Standard workflow implemented:

git add .
git commit -m "update models"
git push
9. Data Quality & Testing

Implemented dbt tests:

unique
not_null
relationships
accepted_values

Ensures reliability of healthcare data models.

10. Documentation Layer

Each model includes:

descriptions
column-level documentation
business definitions (e.g., risk_score, patient_status)

This effectively creates a mini data catalog.

11. Model Selection (dbt Commands)

Used selective execution for efficiency:

dbt run --select model
dbt run --select +model
dbt run --select model+
12. BigQuery Integration
dbt builds views and tables in BigQuery
surrogate keys appear as hashed identifiers
data refresh occurs only when dbt runs
13. Key Outcome

Successfully built an end-to-end analytics engineering pipeline for ICU healthcare data, including:

Modular dbt transformations
Risk scoring system
Data quality testing
DAG-based orchestration
BigQuery deployment
Git version control
Power BI dashboard integration
14. Final Business Impact

This project enables:

Patient risk stratification (low / medium / high)
Clinical severity analysis (lab abnormalities)
Medication usage tracking
ICU patient population insights
