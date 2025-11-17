WITH base AS (
  SELECT
    customer_id,
    DATE_TRUNC(signup_date, MONTH) AS cohort_month,
    DATE_TRUNC(last_active_date, MONTH) AS last_active_month
  FROM `<project_id>.churn_demo.customers_labeled`
),
expanded AS (
  SELECT
    customer_id,
    cohort_month,
    last_active_month,
    month AS calendar_month
  FROM base,
  UNNEST(GENERATE_DATE_ARRAY(cohort_month, CURRENT_DATE(), INTERVAL 1 MONTH)) AS month
)
SELECT
  FORMAT_DATE('%Y-%m', cohort_month) AS cohort,
  DATE_DIFF(calendar_month, cohort_month, MONTH) AS month_num,
  COUNTIF(last_active_month >= calendar_month) * 1.0 /
  COUNT(*) AS retention_rate
FROM expanded
GROUP BY 1,2
ORDER BY 1,2