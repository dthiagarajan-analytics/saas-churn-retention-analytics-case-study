CREATE OR REPLACE TABLE `<project_id>.churn_demo.customers_labeled` AS
SELECT
  *,
  CASE 
    WHEN DATE_DIFF(CURRENT_DATE(), last_active_date, DAY) >= 30 
    THEN 1 ELSE 0 
  END AS churn_flag_30d,
  
  CASE 
    WHEN num_logins_30d = 0 THEN 'Signed up only'
    WHEN num_logins_30d BETWEEN 1 AND 2 THEN 'Tried but not Activated'
    WHEN num_logins_30d BETWEEN 3 AND 5 THEN 'Activated'
    WHEN num_logins_30d > 5 THEN 'Engaged'
  END AS lifecycle_stage
FROM `<project_id>.churn_demo.customers_clean`;
