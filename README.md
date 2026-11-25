# Nepal Supermarket Sales Analysis

## Project Overview

An end-to-end data analytics project analysing supermarket sales across 25 simulated stores and 20 departments in Nepal from 2016 to 2024.

The project demonstrates a complete data analytics workflow, including data understanding, data cleaning, exploratory data analysis, SQL analysis, and interactive dashboard development using Power BI.

**Important:** This project uses synthetic educational data. It does not represent actual Nepal supermarket sales or market statistics.

## Tools & Technologies

- Python
- Pandas and NumPy
- Matplotlib and Seaborn
- MySQL
- SQL
- Microsoft Power BI
- DAX
- Jupyter Notebook

## Dataset

- 235,000 records
- 25 stores
- 20 departments
- 470 weekly dates
- Period: 2016–2024
- 14 columns covering sales, stores, departments, holidays, and external factors.

## Project Structure

supermarket-sales-analysis/
├── data/
│   ├── raw/
│   └── cleaned/
├── notebooks/
│   ├── 01_data_understanding.ipynb
│   ├── 02_data_cleaning.ipynb
│   └── 03_exploratory_analysis.ipynb
├── sql/
│   └── 01_sales_analysis.sql
├── visualizations/
├── dashboard/
│   ├── Nepal_Supermarket_Sales_Analysis.pbix
│   └── Nepal_Supermarket_Sales_Analysis.pdf
└── README.md


## Analysis Performed

### Python
- Dataset inspection and validation
- Missing-value analysis
- Duplicate and consistency checks
- Outlier detection
- Exploratory data analysis
- Sales trends and comparisons

### SQL
- Overall sales performance
- Yearly sales analysis
- Store and department performance
- Holiday versus non-holiday analysis
- Monthly sales trends
- Store-size comparisons
- Correlation analysis
- Year-over-year growth

### Power BI
- Interactive sales overview
- Store and department performance
- Holiday sales analysis
- KPI cards and charts
- Interactive slicers and cross-page filtering
- DAX measures and calendar table

## Key Findings

- Total recorded sales: approximately 1.585 billion (dataset units).
- Bhat-Bhateni recorded the highest total sales among the simulated stores.
- Household Care was the highest-performing department.
- Holiday-period average sales were approximately 23.13% higher than non-holiday average sales.
- March recorded the highest monthly average sales.
- August recorded the lowest monthly average sales.
- Overall yearly sales increased between 2016 and 2023, followed by a small decline in 2024.
- Store size and total sales showed a very strong positive correlation in the simulated dataset.

## Dashboard

The Power BI report contains three pages:

1. Sales Overview
2. Store & Department Analysis
3. Holiday Analysis

## Disclaimer

This project was developed for educational and portfolio purposes using synthetic supermarket sales data. All findings are based on the simulated dataset and should not be interpreted as actual business performance or real-world Nepal retail market statistics.
