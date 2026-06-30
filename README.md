# ICU Patient Clinical Analytics Pipeline (dbt + BigQuery + Power BI)

## 1. Project Overview

This project demonstrates a complete analytics engineering pipeline for ICU patient data using dbt and BigQuery.

The goal is to transform raw healthcare data into analytics-ready models that support clinical insights such as patient risk stratification, lab severity analysis, medication usage patterns, and ICU population insights.

---

## 2. Tech Stack

- dbt (Data transformation & modeling)
- BigQuery (Data warehouse)
- GitHub (Version control)
- VS Code (Development environment)
- dbt-utils (Reusable macros and utilities)
- Power BI (Data visualization)

---

## 3. Data Architecture

### Raw Layer (Sources)
Defined using `sources.yml`:
- raw_patients
- raw_lab_events
- raw_pharmacy

---

### Staging Layer (Data Cleaning)
Standardized and cleaned raw data:
- stg_patients
- stg_lab_events
- stg_pharmacy

Transformations:
- Standardized categorical values (gender, status)
- Cleaned raw fields
- Prepared consistent formats for modeling

---

### Star Schema Design

This project follows a **star schema architecture** to organize ICU healthcare data for analytics.

#### Fact Table (Central Measurements)
- fct_pharmacy_summary
  - total_med_orders
  - iv_med_orders
  - infusion_orders
  - medication usage metrics

#### Dimension Tables (Descriptive Context)
- stg_patients → patient demographics
- stg_lab_events → lab measurements & risk indicators
- stg_pharmacy → medication reference data

#### Analytical Hub Table
- icu_patient_summary
  - joins patient + lab + pharmacy data at patient level
  - enables patient-level analytics and risk stratification

#### Why this matters
- Separates facts (events) from dimensions (context)
- Improves scalability and query performance
- Standard analytics engineering modeling approach
- Enables clean BI reporting layer

---

### Mart Layer (Business Logic)
Final analytics-ready models:
- icu_patient_summary
- patient_lab_risk
- fct_pharmacy_summary
- icu_dashboard_patients
- icu_top_critical_patients

---

## 4. Key Transformations

### Patient Enrichment Model
Combined:
- Demographics
- Lab risk metrics
- Pharmacy usage

Output: `icu_patient_summary`

---

### Risk Scoring System
Built:
- risk_score
- risk_category (low / medium / high)

Based on laboratory abnormalities.

---

### Pharmacy Aggregation
Metrics:
- total_med_orders
- unique_medications
- iv_med_orders

---

## 5. dbt Macros & Utilities

Used dbt-utils:

dbt_utils.generate_surrogate_key(['subject_id'])

Purpose:
- Unique patient identifiers
- Improve join consistency
- Avoid reliance on raw business keys

---

## 6. Core dbt Concepts

### ref()
Used for model dependencies:
from {{ ref('stg_patients') }}

Enables automatic DAG creation.

---

### source()
Used for raw data ingestion:
from {{ source('icu_raw', 'raw_patients') }}

---

### DAG (Lineage Graph)

Raw → Staging → Marts → Dashboard

---

## 7. Model Execution

dbt run  
dbt run --select model  
dbt run --select +model  
dbt run --select model+

---

## 8. Git Workflow

git add .  
git commit -m "update models"  
git push  

---

## 9. Data Quality Testing

Implemented dbt tests:
- unique
- not_null
- relationships
- accepted_values

---

## 10. Documentation Layer

Each model includes:
- descriptions
- column definitions
- business definitions (risk_score, patient_status)

---

## 11. BigQuery Integration

- dbt builds views/tables in BigQuery
- surrogate keys appear as hashed values
- data updates only when dbt runs

---

## 12. Key Insights

- High-risk patients have significantly higher lab abnormalities
- Medication usage increases with risk category
- Clear separation between low / medium / high ICU patients
- Treatment intensity aligns with clinical severity

---

## 13. Final Outcome

End-to-end analytics engineering pipeline including:
- dbt transformations
- risk scoring system
- data quality testing
- DAG orchestration
- BigQuery deployment
- Git version control
- Power BI dashboard

---

## 14. Business Impact

- Patient risk stratification (low / medium / high)
- Clinical severity analysis
- Medication usage tracking
- ICU population insights

---

## 15. Dashboard & Architecture

### ICU Patient Clinical Dashboard
This dashboard shows ICU patient risk distribution, lab severity, and medication usage patterns.

<img width="1301" height="732" alt="image" src="https://github.com/user-attachments/assets/0fcaeddf-0e42-4444-8fd0-97d2aaaa3726" />

---

## 16. How to Run

dbt deps  
dbt run  
dbt test  

---

## 17. Skills Demonstrated

- Data modeling with dbt
- Analytics engineering
- Healthcare data analysis
- SQL transformation logic
- Data pipeline design
- BI dashboarding (Power BI)
- Version control (Git/GitHub)

---

## 18. Final Summary

This project transforms raw ICU healthcare data into a structured analytics pipeline using dbt and BigQuery, enabling insights into patient risk, clinical severity, and treatment intensity.
