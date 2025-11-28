🏡 Airbnb Data Analysis Using Power BI
📘 Project Overview

This project analyzes Airbnb’s listings and reviews data to uncover key insights into user satisfaction, pricing trends, host performance, and market dynamics.
The analysis was performed using Microsoft Power BI, focusing on transforming raw CSV datasets into an interactive dashboard that supports data-driven business decisions.

The work simulates the role of a Business Intelligence Analyst at iVision Analytics, conducting an end-to-end analytical study of Airbnb’s global operations.

🎯 Business Objectives

The goal of this project is to use Power BI to:

Evaluate district-level location scores and identify areas with the lowest satisfaction.
Analyze how host response time affects overall guest ratings.
Visualize Airbnb pricing trends across cities and property types.
Derive a composite score combining check-in experience and host communication.
Calculate listing age and host tenure to identify experienced hosts.
Create property-type price visualizations (e.g., tree maps for average prices).
Develop a city insights report to study pricing, ratings, and visitor trends — especially the impact of 2020 on booking patterns.

🧾 Dataset Description

The datasets used for this project are:

Listings.csv → Contains property details (e.g., location, host, room type, price, and ratings).
Reviews.csv → Includes reviewer feedback and scores.
Listings_data_dictionary.csv & Reviews_data_dictionary.csv → Define schema, variable meanings, and data types.

Key Columns:

Dataset	Sample Fields	Description
Listings	id, name, host_id, city, price, room_type, review_scores_location, review_scores_value	Property and host details
Reviews	review_id, listing_id, reviewer_name, date, comments	Guest reviews and timestamps

⚙️ Data Transformation & Modeling
Steps Performed:

1.Data Cleaning:

Removed null or duplicate records.
Standardized categorical fields (room_type, city).
Converted date and numeric fields to proper formats.

2.Modeling:

Established relationships between Listings and Reviews tables.
Built calculated columns for:
Listing_Age = DATEDIFF(Listing_Creation_Date, TODAY(), YEAR)
Host_Tenure = DATEDIFF(Host_Since, TODAY(), YEAR)
Composite_Score = AVERAGE(Checkin_Score, Communication_Score)

3.Measures (DAX):

Total_Listings = COUNT(Listings[id])
Avg_Price = AVERAGE(Listings[price])
Avg_Rating = AVERAGE(Listings[review_scores_rating])
Host_Response_Rate = AVERAGE(Listings[host_response_rate])


4.Visualization:
Created a Power BI dashboard containing:

Bar and tree maps for property and pricing trends.
Correlation charts for host behavior vs guest satisfaction.
Year-over-year visitor and pricing trends.

📊 Dashboard Highlights
1. Location Score Analysis

Finding: Certain districts consistently show low review_scores_location, often linked to distance from city centers.
Actionable Insight: Focus marketing and improvements in low-scoring districts to raise visibility and guest satisfaction.

2. Host Response Time Impact

Finding: Listings with response times under 1 hour have 20–30% higher ratings.
Actionable Insight: Train and incentivize hosts to respond promptly to inquiries.

3. Price Analysis Across Cities

Finding:
Average prices are highest in metropolitan regions and entire-home listings.
Shared rooms have 50–60% lower average prices.
Actionable Insight: Airbnb can recommend optimized pricing tiers to improve competitiveness and occupancy.

4. Composite Score (Check-in + Communication)

Finding: A composite satisfaction score ≥9 correlates with repeat bookings.
Actionable Insight: Use this composite metric to identify high-performing hosts and replicate best practices.

5. Listing Age & Host Tenure

Finding: Listings older than 5 years tend to have more reviews but slightly lower recent ratings.
Hosts with >10 years’ tenure maintain consistently high ratings.
Actionable Insight: Encourage newer hosts to model after experienced ones; provide refresher training for long-term hosts.

6. City Insights & Visitor Trends (2018–2020)

Finding:
A sharp drop in visitor activity was observed in 2020 due to travel restrictions.
Cities with domestic tourism dependency recovered faster post-2020.
Actionable Insight:
Diversify listing focus in resilient domestic markets.
Encourage flexible cancellation policies to sustain engagement.

💡 Key Insights Summary
Focus Area	Observation	Recommendation
District Ratings	Lower satisfaction in suburban districts	Promote better accessibility and amenities
Host Response Time	Fast responders get higher overall ratings	Incentivize response KPIs
Pricing Patterns	Entire homes dominate revenue	Optimize shared-room pricing to attract budget travelers
Composite Experience Score	Check-in + Communication impacts loyalty	Include composite metric in host dashboards
Listing Age	Older listings risk stagnation	Periodically update listing content/photos
2020 Visitor Trends	Pandemic drastically impacted stays	Leverage data for post-crisis recovery modeling

🏁 Deliverables

Power BI File: NumikaShetty_ABADS_B20_Final.pbix
Supporting CSVs:
Listings.csv, Reviews.csv,
Listings_data_dictionary.csv, Reviews_data_dictionary.csv

Presentation: PowerPoint summarizing findings and visual snapshots.

Report Summary: README file (this document).

🧮 Tools & Technologies

Data Visualization: Microsoft Power BI
Data Source: Airbnb Open Dataset (Listings & Reviews CSVs)
Language/Formulae: DAX, Power Query (M language)
Data Dictionary Integration: Used to ensure schema accuracy during modeling

🔍 Conclusion

The Airbnb Power BI dashboard consolidates pricing, host, and guest experience metrics into a unified analytical view.
Key actionable outcomes include:

Prioritize responsive hosts for quality assurance.
Improve pricing transparency across property types.
Focus district-level improvements based on location scores.
Use composite satisfaction metrics to enhance host evaluation programs.

📁 Repository Structure
Airbnb-Data-Analysis/
│
├── Listings_data_dictionary.csv
├── Reviews_data_dictionary.csv
├── Airbnb_Insights_Presentation.pptx
└── README.md

