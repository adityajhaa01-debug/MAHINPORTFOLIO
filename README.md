# Revenue Leakage & Pricing Intelligence

## Executive case study

A portfolio-grade Business Analyst project investigating why revenue growth is not translating into profit growth.

### Business problem
Management reports **18.2% YoY revenue growth** while gross margin has fallen from **21.0% to 16.4%**. The objective is to identify controllable revenue leakage, quantify the opportunity, prioritize customers/products/territories, and recommend actions.

> **Note:** All numbers are synthetic and created for portfolio demonstration. They are not claims about a real company.

## Skills demonstrated

- **SQL / Data Analysis:** multi-table joins, CTEs, window functions, price variance, customer profitability and leakage analysis.
- **Advanced Excel:** pricing simulator, scenario analysis, margin bridge, sensitivity analysis and decision modeling.
- **Power BI:** executive KPI design, profitability storytelling, drill-down analysis and management reporting.
- **Business Analysis:** business case, stakeholder questions, requirements-to-KPI traceability, root-cause analysis, recommendations and implementation roadmap.

## Core findings

1. Discounting is the largest modeled controllable leak: **₹3.1 Cr** annually.
2. Contract-price variance contributes a further **₹1.6 Cr**.
3. The top 20 customers generate 41% of revenue but only 27% of contribution profit.
4. Modeled annual recovery opportunity is **₹4.2 Cr+** after prioritization.

## Portfolio deliverables

- Executive decision dashboard: `index.html`
- Business requirements and KPI traceability: included in dashboard
- SQL analysis plan: `sql/analysis.sql`
- Excel decision model specification: `excel/model-spec.md`
- Data dictionary: `data/data-dictionary.md`

## Architecture

`Raw transactions → SQL transformation → analytical model → Excel scenario model → Power BI-style executive dashboard → business recommendation`

## Disclaimer

Synthetic case study created for demonstration of analytical and Business Analysis capability.
