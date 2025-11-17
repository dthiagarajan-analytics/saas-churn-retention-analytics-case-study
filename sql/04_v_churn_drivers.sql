SELECT
  plan_type,
  payment_method,
  AVG(churn_flag_30d) AS churn_rate,
  AVG(num_logins_30d) AS avg_logins,
  AVG(tickets_30d) AS avg_tickets,
  AVG(nps) AS avg_nps,
  AVG(monthly_fee) AS avg_fee
FROM `<project_id>.churn_demo.customers_labeled`
GROUP BY 1,2
ORDER BY churn_rate DESC