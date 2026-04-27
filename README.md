# 🏥 Healthcare Analytics End-to-End Project

## 📌 Project Overview

This project simulates a real-world **hospital management system** and demonstrates an end-to-end data analytics workflow using:

* **SQL (PostgreSQL)** → Data cleaning, transformation, and joins
* **Python** → Exploratory Data Analysis (EDA) & visualization
* **Power BI** → Interactive dashboard for insights

The goal is to transform raw healthcare data into a **clean, structured, and analysis-ready dataset** and generate meaningful business insights.

---

## 📂 Dataset Description

The dataset consists of multiple related tables:

* **patients.csv** → Patient demographics and registration details
* **doctors.csv** → Doctor profiles and specializations
* **appointments.csv** → Appointment records and status
* **treatments.csv** → Treatment details and costs
* **billing.csv** → Billing and payment information

---

## ⚙️ Workflow

### 🔹 1. Data Import (PostgreSQL)

* Imported CSV files into PostgreSQL
* Used flexible schema (TEXT format) to avoid import errors

---

### 🔹 2. Data Cleaning (SQL)

* Handled missing values
* Removed duplicates
* Standardized categorical columns (e.g., status, treatment type)
* Ensured consistency across tables

---

### 🔹 3. Data Type Conversion

* Converted columns to appropriate formats:

  * `DATE` → appointment_date, treatment_date
  * `TIME` → appointment_time
  * `NUMERIC` → amount, money_spent
  * `VARCHAR` → IDs for consistency

---

### 🔹 4. Data Modeling (SQL Joins)

Created a **Master Data View** by joining all tables:

* patients → appointments
* appointments → doctors
* appointments → treatments
* treatments → billing

👉 Result: A **single analytical dataset** for further analysis

---

### 🔹 5. Data Analysis (Python)

* Loaded final dataset using Pandas
* Performed EDA:

  * Revenue analysis
  * Treatment trends
  * Monthly patterns
* Created visualizations using Matplotlib

---

### 🔹 6. Dashboard (Power BI)

Designed an interactive dashboard including:

* 📊 Total Revenue
* 👥 Total Patients
* 🏥 Revenue by Treatment Type
* 📈 Monthly Revenue Trend
* 🥧 Payment Method Distribution

---

## 📊 Key Insights

* Identified top revenue-generating treatments
* Analyzed patient spending patterns
* Observed monthly revenue trends
* Compared doctor specializations performance

---

## 🛠️ Tech Stack

* **Database:** PostgreSQL
* **Language:** Python (Pandas, Matplotlib)
* **Visualization:** Power BI
* **Tools:** pgAdmin, Jupyter Notebook

---

## 📁 Project Structure

```
healthcare-analytics-end-to-end/
│
├── sql/          # SQL queries (cleaning, joins, transformations)
├── python/       # EDA and analysis scripts
├── powerbi/      # Dashboard file (.pbix)
├── data/         # Dataset (optional/sample)
└── README.md
```

---

## 🚀 How to Run

1. Import dataset into PostgreSQL
2. Perform data cleaning & type conversion using SQL
3. Create master dataset using joins
4. Export final dataset as CSV
5. Load into Python / Power BI for analysis

---

## 🎯 Learning Outcomes

* Hands-on experience with **real-world data pipelines**
* Strong understanding of **SQL joins and data cleaning**
* Ability to build **end-to-end analytics projects**
* Experience with **data visualization and storytelling**

---

## 📌 Future Improvements

* Add Machine Learning models (prediction tasks)
* Enhance dashboard with more KPIs
* Automate pipeline using ETL tools

---

## 🤝 Connect

If you found this project useful or have suggestions, feel free to connect!

---

⭐ Don’t forget to star the repo if you like it!
