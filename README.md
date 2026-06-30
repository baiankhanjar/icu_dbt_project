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
