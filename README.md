# Non-Regular-Employment-Analysis
Analysis of Non-Regular Employment in the Philippines is the final capstone project for my data engineering pathway course. This project aims to analyze and provide insights into the state of non-regular employment in the Philippines using data from openstat.psa.gov.ph.

### Description
Analysis of Non-Regular Employment in the Philippines is the final capstone project for a data engineering course. This project aims to analyze and provide insights into the state of non-regular employment in the Philippines using data from OpenStat Philippines.

### Project Objective
The objective of this project is to analyze non-regular employment trends in the Philippines by business size, industry group, and region. Insights are derived to support Sustainable Development Goals (SDG) 8 (Decent Work and Economic Growth) and SDG 5 (Gender Equality).

### Dataset Source
The datasets used in this project are sourced from the OpenStat Philippines website. They include:
1. Total Non-Regular Employment by Business Size
2. Total Non-Regular Employment by Industry Group
3. Total Non-Regular Employment by Region

### Questions (KPIs)
1. How does business size affect gender representation in non-regular employment?
2. What are the gender differences in non-regular employment across industries?
3. Are there regional disparities in non-regular employment across the Philippines?
4. Which types of non-regular employment are most common for different business sizes?

### Process
1. **Data Cleaning**:
   - Removed duplicate records in Excel.
   - Imported the datasets into Jupyter Notebook for further cleaning.
   - Used Python for further cleaning, including renaming columns to use underscores and correcting numerical values.

2. **Database Creation**:
   - Used PostgreSQL to create tables from the cleaned datasets.
   - Combined and queried tables to normalize and denormalize tables.

3. **Dashboard Development**:
   - Connected the database to Power BI.
   - Created SQL queries to produce insights.
   - Developed two dashboards:
     - SDG 8 Dashboard: Decent Work and Economic Growth
     - SDG 5 Dashboard: Gender Equality

### Dashboard
1. **SDG 8 Dashboard**:
   - Focuses on employment trends and economic growth.
   - Highlights non-regular employment by region, industry group, and business size.

2. **SDG 5 Dashboard**:
   - Centers on gender equality.
   - Shows gender distribution and disparities in non-regular employment.

### Project Insight
1. Regions with the highest and lowest numbers of non-regular workers were identified.
2. Industries with significant reliance on non-regular workers were highlighted.
3. Male workers dominate non-regular employment in both small and large businesses, highlighting a gender imbalance.
4. Most industries employ more male non-regular workers, with mining, quarrying, and construction as exceptions where women have higher representation.
5. Regional disparities in non-regular employment show BARMM has the highest rate, while Region XII has the lowest.
6. Large businesses employ more probationary workers, while apprentices are the least hired across all business sizes.

### Final Conclusion
This project highlights key disparities in non-regular employment in the Philippines. Male workers are predominantly employed in non-regular roles across regions, industries, and business sizes, revealing a significant gender imbalance. Companies can address this by implementing inclusive hiring practices, offering flexible work arrangements, and promoting diversity.

Regional disparities suggest the need for targeted policies to address labor market conditions. High non-regular employment areas could benefit from programs promoting job stability, while low-employment regions may need initiatives fostering economic growth.

Lastly, the insights emphasize the need for structured programs to support apprentices and probationary roles to ensure opportunities across business sizes and sectors. Aligning with SDGs 8 and 5, this analysis supports efforts to achieve decent work, economic growth, and gender equality in the Philippine labor market.
