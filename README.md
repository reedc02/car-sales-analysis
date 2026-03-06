# Car Sales Analysis (2022–2023)
Data Source: [Kaggle — Car Sales Report](https://www.kaggle.com/datasets/missionjee/car-sales-report)
Tools: Python (pandas, numpy, matplotlib, seaborn, scipy), SQL (SQLite), Tableau Public  
Author: Courtney Reed  
GitHub: [reedc02](https://github.com/reedc02)  


---------------------------------------------


## Overview
Exploratory data analysis of a car dealership sales dataset covering January 2022-December 2023 across seven U.S. regions. This project follows a full analytics workflow, including data cleaning and analysis in Python, structured business queries in SQL, and an interactive dashboard in Tableau.

## Main Question
What factors drive car sale price, and how do sales patterns vary across regions, manufacturers, and time?

## Sub-Questions
- Which vehicle attributes (body style, engine type, transmission) are associated with higher prices?
- Which brands and models drive the highest average sale prices?
- How do sales volume and pricing differ across dealer regions?
- Are there seasonal trends in sales volume or pricing over the 2022–2023 period?
- Does buyer annual income correlate with the price of the car purchased?

## Data Limitations & Caveats
It is important to note that this is a synthetic dataset from Kaggle. Several data quality issues were noticed 
and handled during cleaning:

- **Placeholder values:** 'Annual Income' contains 5,273 entries (~22% of the dataset). An annual income of $13,500 appeared in the 'Annual Income' Column 5,273 times, approximately 22x more than any other value in this column. Hence, each appearence of that value was treated as a placeholder null and excluded from any income-related analysis.

- **Unrealistic brand-price relationships:** In this dataset, luxury brands like BMW, Porsche, and Jaguar surprisingly ranked near the bottom in terms of average sale price, while Cadillac and Buick ranked at the top. This is not consistent with real-world automotive market trends, but consistent with the synthetic/automated nature of the dataset. Hence, all brand-level findings in this analysis are relative to only the dataset, and not to actual automotive market dynamics.
  rank near the bottom in average sale price, while Cadillac and Buick rank at the top. This is 
- **Gender column Inconsistencies:** It is worth noting that several entries have Female first names labeled as Male, suggesting a possible error in gender encoding (again, a likely result of the synthetic nature of the dataset). For this reason, the gender field is not used in any analysis.
- **Engine encoding artifact:** The Engine column contained a UTF-8/Latin-1 mismatch 
  (`\xa0` non-breaking space) that was corrected during cleaning.
- **City geocoding:** Dealer regions in this dataset are city names without any state information. Five of the cities 
  (Aurora, Austin, Greenville, Janesville, Middletown) hence required manual geocoding in Tableau is a result of city naming ambiguity across U.S. states.


---


## Key Findings

### What drives car sale price?

- **Body style** show the largest price variation among vehicle attributes. Sedan and Hardtop models had higher price distributions, while SUV and Hatchback had lower price distributions.
- **Engine type, transmission, and color** show minimal price differentiation. Distributions overlap quite heavily across all categories, suggesting that these characteristics alone are weak price predictors.
- **Brand** is the strongest categorical price predictor within this dataset. Cadillac, Buick, and Saab have the highest median prices (Note: see caveats above in 'Data Limitations & Caveats' section).
- **Buyer income** has little to no correlation with purchase price. Pearson r = 0.007, p = 0.37. All income brackets purchase cars at similar average price points (~$28k), and the result is not statistically significant

### Regional patterns
- **Austin, TX** leads all of the seven U.S. regions in this dataset in sales volume (4,135 transactions). Middletown, CT and Greenville, SC ranked the lowest in terms of sales volume (3,128 each).
- **Average sale price** is essentially identical across all seven regions. Average sale price only ranged from $27,834 to $28,342. This suggests a uniform pricing strategy regardless of geographical location.
- **Chevrolet** is the top-selling brand in 6 of 7 regions, with Dodge leading only in Middletown, CT.

### Time trends
- **Both 2022 and 2023 show consistent seasonal patterns**. For both years, sales volume is lowest in January/February and peaks in September and November/December
- **We see evident year-over-year growth**. 2023 monthly volumes exceed those in 2022. December 2023 was the single highest volume month in the dataset (1,921 sales).
- **End-of-year months generate ~6x the revenue of the slowest months**. November and December 2023 each exceeded $50M in total revenue compared to ~$8.9M in January 2022.
- **Average sale price remains stable year-round**. This value ranged from $26,750–$29,175, suggesting that fluctuations in revenue are driven by volume, not pricing.


---


## Tableau Dashboard
[View Interactive Dashboard on Tableau Public](https://public.tableau.com/views/CarSalesAnalysis2022-2023/CarSalesAnalysisDashboard2022-2023?:language=en-US&publish=yes&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

This dashboard includes:
- **Regional Sales Map**: bubble map of the 7 dealer regions sized by sales volume and colored by average sale price
- **Brand Performance Chart**: horizontal bar chart of all 30 brands ranked by total sales volume, colored by average sale price


---


## How to Run Locally

### Interactive Python Notebook
1. Clone the repo
2. Install the necessary dependencies: `pip install pandas numpy matplotlib seaborn scipy`
3. Open `notebooks/car-sales-analysis.ipynb` in Jupyter or VSCode
4. Update the file path in the loading cell to match your local directory
5. Run all cells in order

### SQL
1. Open `sql/car_sales.db` in [DB Browser for SQLite](https://sqlitebrowser.org/)
2. Navigate to the Execute SQL tab
3. Copy and run queries from `sql/car_sales_queries.sql`

### Tableau
1. Open `tableau/car_sales_analysis.twbx` in [Tableau Public Desktop](https://public.tableau.com/en-us/s/download) OR see the published version via the dashboard link above# car-sales-analysis
