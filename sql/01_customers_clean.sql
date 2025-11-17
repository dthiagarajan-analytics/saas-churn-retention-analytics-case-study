CREATE OR REPLACE TABLE `<project_id>.churn_demo.customers_clean` AS
SELECT
  CAST(customer_id AS STRING) AS customer_id,
  DATE(signup_date) AS signup_date,
  DATE(last_active_date) AS last_active_date,
  SAFE_CAST(tenure_days AS INT64) AS tenure_days,
  LOWER(TRIM(plan_type)) AS plan_type,
  SAFE_CAST(monthly_fee AS NUMERIC) AS monthly_fee,
  LOWER(TRIM(payment_method)) AS payment_method,
  SAFE_CAST(num_logins_30d AS INT64) AS num_logins_30d,
  SAFE_CAST(tickets_30d AS INT64) AS tickets_30d,
  SAFE_CAST(nps AS INT64) AS nps,
  SAFE_CAST(churned AS INT64) AS churned
FROM `<project_id>.churn_demo.customers_raw`;