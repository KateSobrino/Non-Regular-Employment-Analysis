-- SQL queries for creating temp tables, copying data into temp tables

-- Create temp tables
-- Create temporary table for region data
DROP TABLE IF EXISTS temp_region;
CREATE TEMPORARY TABLE temp_region (
    region_name VARCHAR(100),
    gender_category VARCHAR(20),
    year INT,
    total_non_regular INT,
    probationary INT,
    casual INT,
    contractual INT,
    seasonal INT,
    apprentices_learners INT
);

-- Create temporary table for industry data
DROP TABLE IF EXISTS temp_industry;
CREATE TEMPORARY TABLE temp_industry (
    industry_category VARCHAR(100),
    gender_category VARCHAR(20),
    year INT,
    total_non_regular INT,
    probationary INT,
    casual INT,
    contractual INT,
    seasonal INT,
    apprentices_learners INT
);

-- Create temporary table for business data
DROP TABLE IF EXISTS temp_business;
CREATE TEMPORARY TABLE temp_business (
    business_size_category VARCHAR(100),
	gender_category VARCHAR(20),
    year INT,
    total_non_regular INT,
    probationary INT,
    casual INT,
    contractual INT,
    seasonal INT,
    apprentices_learners INT
);

-- Copy data into temp tables from datasets
COPY temp_region (region_name, gender_category, year, total_non_regular, 
probationary, casual, contractual, seasonal, apprentices_learners)
FROM 'D:\Downloads\SPCapstone004_AKSobrino\datasets\cleaned_region.csv'
DELIMITER ','
CSV HEADER;

COPY temp_industry (industry_category, gender_category, year, total_non_regular, 
probationary, casual, contractual, seasonal, apprentices_learners)
FROM 'D:\Downloads\SPCapstone004_AKSobrino\datasets\cleaned_industry.csv'
DELIMITER ','
CSV HEADER;

COPY temp_business (business_size_category, gender_category, year, total_non_regular, 
probationary, casual, contractual, seasonal, apprentices_learners)
FROM 'D:\Downloads\SPCapstone004_AKSobrino\datasets\cleaned_business_size.csv'
DELIMITER ','
CSV HEADER;

-- Insert data from temp tables to the created tables for normalized model
-- region
INSERT INTO region (region_name)
SELECT region_name
FROM (
    SELECT DISTINCT region_name 
    FROM temp_region
) AS subquery
ORDER BY 
    CASE 
        WHEN region_name = 'ph' THEN 1
        WHEN region_name LIKE 'region_%' THEN 2
        ELSE 3
    END,
    region_name;


-- industry
INSERT INTO industry (industry_category)
SELECT industry_category
FROM (
    SELECT DISTINCT industry_category
    FROM temp_industry
) AS subquery
ORDER BY 
    CASE industry_category
        WHEN 'all_industries' THEN 1
        WHEN 'other_service_activities' THEN 3
        ELSE 2
    END,
    industry_category;


-- business_size
INSERT INTO business_size (business_size_category)
SELECT business_size_category
FROM (
    SELECT DISTINCT business_size_category
    FROM temp_business
) AS subquery
ORDER BY 
    CASE business_size_category
        WHEN 'all_sizes' THEN 1
        WHEN 'large_size' THEN 2
        WHEN 'medium_size' THEN 3
        WHEN 'small_size' THEN 4
        ELSE 5
    END;


-- gender_dim
INSERT INTO gender (gender_category_id, gender_category)
VALUES
    (1, 'both_sexes'),
    (2, 'female'),
    (3, 'male');

-- date
INSERT INTO date (year)
SELECT DISTINCT year
FROM (
    SELECT year FROM temp_region
    UNION
    SELECT year FROM temp_industry
    UNION
    SELECT year FROM temp_business
) AS year
ORDER BY year ASC;
