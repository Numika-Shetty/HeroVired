🏦 Bank Marketing Analysis using Power BI
📘 Project Overview

This project analyzes a Portuguese bank’s telemarketing campaign to promote term-deposit products. Using Power BI, the analysis identifies which customer segments are most receptive, what campaign factors influence success, and how future campaigns can be optimized for higher conversion and ROI.

The project transforms the Bank Marketing dataset into actionable insights through data profiling, transformation, and visualization — empowering data-driven decision-making in a competitive BFSI environment.

🎯 Business Objectives

Assess campaign effectiveness by channel, timing, and customer profile.
Identify high-value customer segments most likely to subscribe.
Build a forecasting model for predicting term-deposit uptake.
Recommend strategies for optimizing call duration, frequency, and targeting.

📂 Dataset Description

File: bank.csv
Records: 4,521
Fields: 17

Key features include:

Demographic: age, job, marital, education
Financial: balance, housing, loan
Campaign: contact, day, month, duration, campaign, pdays, previous, poutcome
Target Variable: y (subscription to term deposit: “yes” or “no”)

⚙️ Data Processing & Modeling
1. Data Ingestion & Profiling

Profiled each field: type, record count, distinct values, missing percentages.
Noted anomalies such as “unknown” categories for job and education.

2. Data Cleaning & Transformation

Re-coded missing categories as “Not Specified”.
Created clean data tables and relationships in Power BI.
Removed duplicate entries and normalized categorical labels.

3. Date Handling

Created a ContactDate column and linked Date Dimension (Year, Quarter, MonthName, Weekday) for time-based trend analysis.

4. Calculated Columns & Measures (DAX)

TotalCalls = COUNTROWS(bank)
SuccessCount = CALCULATE(COUNTROWS(bank), bank[y] = "yes")
SubscriptionRate = DIVIDE([SuccessCount],[TotalCalls])
AvgDuration = AVERAGE(bank[duration])
AvgBalance = AVERAGE(bank[balance])

📈 Dashboard Overview
Page 1: Campaign Performance Overview

KPIs: Total Calls, Success Count, Subscription Rate, Avg Call Duration
Charts: Outcome distribution, contact type breakdown
Insight: Success rate higher for “cellular” contact type than “telephone”.

Page 2: Customer Profile Analysis

Conversion rate by Job Role and Education Level
Filters for marital, housing loan, and personal loan

Insight:

Retired customers and university graduates show highest subscription rates.
Clients with personal loans less likely to subscribe.

Page 3: Trend & Seasonality

Time-series chart: Monthly subscription rate
Forecast: 3-month outlook using Power BI’s time-series forecasting
Insight: Peak success in May and August, lowest in December.

Page 4: Funnel Visualization

Stages: Contacts → Repeat Calls → Qualified Leads → Subscriptions
Drop-off analysis showing largest loss between initial and repeat contact.
Insight: Follow-ups improve success rate by ~22%.

Page 5: Customer Segmentation

Clustered customers into 4 segments based on age, balance, duration.
Segment Insights:
High-balance seniors: Highest subscription likelihood (46%)
Young low-balance: Low response (<10%)
Mid-career professionals: Balanced conversion (28%)

🔍 Actionable Insights & Recommendations
Area	Finding	Recommendation
Contact Strategy	Cellular contacts have 2x higher success than telephone	Prioritize mobile outreach
Timing	Success rates spike mid-year	Concentrate campaigns in Q2–Q3
Customer Targeting	Retirees & higher-education clients more receptive	Focus future offers on educated senior segments
Call Duration	Calls > 300 sec correlate with higher conversions	Train agents to maintain longer, engaging conversations
Loans	Clients with active personal loans show low interest	Exclude loan-heavy segments to save resources

🧠 Key Learnings
Effective use of Power BI modeling, DAX, and visualization can convert raw campaign data into clear strategic intelligence.
Segment-based analysis helps optimize resources and personalize outreach.
Time-intelligence functions reveal hidden seasonal performance patterns.

💾 Repository Structure
├── README.md                  # Project documentation
├── bank.csv                   # Dataset
├── Bank_Marketing.pbix        # Power BI dashboard file

🏁 Conclusion

This project demonstrates a complete data analytics workflow — from raw data ingestion to insight delivery — using Power BI.
The resulting dashboard provides marketing teams with evidence-based recommendations to improve future term-deposit campaigns, enhance targeting efficiency, and maximize ROI.
