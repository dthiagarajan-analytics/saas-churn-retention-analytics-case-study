# SaaS Customer Churn & Retention – Analytics Case Study

[🔗 View Dashboard (Looker Studio)] https://lookerstudio.google.com/reporting/3680a8a5-9493-4e74-8a44-348ec08b26e8

## Files in This Repo

- `sql/` – Core SQL scripts for table and view creation.
- `screenshots/` – Executive and journey/retention dashboards.
- `docs/` – Optional PDF export of the dashboard.
- `README.md` – This case study.

---

## 1. Business Context

A subscription-based SaaS business experiencing higher than expected customer churn. This project analyzes churn, retention and lifetime value using BigQuery & Looker Studio, and delivers actionable insights to reduce revenue loss.

This helps leadership understand:

- How bad is churn today (in customers and revenue)?
- Which plans and segments drive most churn?
- Where in the user journey customers are dropping off (onboarding vs later)?
- What behaviors predict churn risk, and what actions could reduce it?

This project simulates a realistic SaaS environment using synthetic data and demonstrates how I’d approach this problem as a data analyst.

---

## 2. Objectives

1. Quantify 30-day churn, active customer base, and MRR.
2. Identify which plans and cohorts contribute the most to churn.
3. Understand churn drivers across lifecycle stages and behaviors (logins, NPS).
4. Propose concrete retention actions and estimate financial impact.

---

## 3. Key Metrics

- **30-day Churn Rate:** ~25%
- **Active Customer Base:** ~4K
- **Monthly Recurring Revenue (MRR):** ~$126K
- **Revenue Lost to Churn (Monthly):** ~$33K
- **Estimated Annual Revenue at Risk:** ~$400K

---

## 4. Dashboards

### 4.1 Executive Summary (Page 1)

**Shows:**

- Churn Rate (30d), Active Customers, MRR, Revenue Lost to Churn
- Churn Rate by Plan & Churn Volume by Plan
- Active vs Churned Customers over time (by signup quarter)
- Key insights on where churn concentrates and financial impact

### 4.2 Customer Journey & Retention (Page 2)

**Shows:**

- Cohort retention heatmap (Signup Cohort vs Months After Signup)
- User Journey Funnel (Signed Up → Tried → Activated → Engaged → Churned)
- Churn Rate by Login Frequency
- Lifecycle insights and recommended actions

---


## 5. Data & Tools

**Data**

- Synthetic SaaS customer dataset (`customers_labeled`) with:
  - `customer_id`, `signup_date`, `last_active_date`, `tenure_days`
  - `plan_type`, `monthly_fee`, `payment_method`
  - `num_logins_30d`, `tickets_30d`, `nps`
  - `churn_flag_30d` (1 = churned, 0 = active)

**Tools**

- BigQuery (data cleaning, cohort and churn logic)
- Looker Studio (dashboards)
- GitHub (versioning and documentation)

SQL scripts are in [`sql/`](./sql). Dashboard screenshots are in [`screenshots/`](./screenshots).

---

## 6. Analytical Approach

1. **Data Preparation**
   - Import CSV into BigQuery.
   - Clean and type-cast fields (`customers_clean.sql`).
   - Define `churn_flag_30d` based on inactivity of ≥30 days.
   - Create views for cohort retention and churn drivers.

2. **Executive-Level Analysis**
   - Compute churn rate, active customer base, and MRR.
   - Slice churn by `plan_type` to identify Basic as the main churn source.
   - Estimate monthly and annual revenue lost to churn.

3. **Lifecycle & Root-Cause Analysis**
   - Build retention cohorts by signup month to see decay over time.
   - Define lifecycle stages based on login behavior (Signed up only, Tried, Activated, Engaged, Churned).
   - Visualize journey funnel to find major drop between Signed Up → Activated.
   - Analyze churn vs login frequency and NPS.

4. **Recommendations & Impact**
   - Propose activation nudges (Day-1 to Day-7) to push new users to ≥3 logins.
   - Route high-ticket users (3+ tickets) to priority support squads.
   - Focus product and onboarding improvements on Basic plan users.
   - Estimate ARR uplift from reducing churn by 3–5 percentage points in key segments.

---

## 7. Next Steps / Possible Extensions

- Add a simple churn risk model (logistic regression) using Python + BigQuery.
- Build a “Save Strategy” scenario: estimate ROI of reactivation campaigns.
- Extend dataset to include acquisition channels and analyze retention by source.

