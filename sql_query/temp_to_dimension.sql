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

-- Insert data from temp tables to the created tables for dim and normalized model

-- Then, Insert data into dimension tables
-- region_dim
INSERT INTO region_dim (region_name, gender_category, year, total_non_regular, 
probationary, casual, contractual, seasonal, apprentices_learners)
SELECT 
    region_name, 
    gender_category, 
    year, 
    total_non_regular, 
    probationary, 
    casual, 
    contractual, 
    seasonal, 
    apprentices_learners
FROM temp_region;

-- industry_dim
INSERT INTO industry_dim (industry_category, gender_category, year, total_non_regular, 
probationary, casual, contractual, seasonal, apprentices_learners)
SELECT 
    industry_category, 
    gender_category, 
    year, 
    total_non_regular, 
    probationary, 
    casual, 
    contractual, 
    seasonal, 
    apprentices_learners
FROM temp_industry;

-- business_size_dim
INSERT INTO business_size_dim (business_size_category, gender_category, year, total_non_regular, 
probationary, casual, contractual, seasonal, apprentices_learners)
SELECT 
    business_size_category, 
    gender_category, 
    year, 
    total_non_regular, 
    probationary, 
    casual, 
    contractual, 
    seasonal, 
    apprentices_learners
FROM temp_business;

-- gender_dim
INSERT INTO gender_dim (gender_category_id, gender_category)
VALUES
    (1, 'male'),
    (2, 'female'),
    (3, 'both_sexes');

-- date_dim
INSERT INTO date_dim (year)
SELECT DISTINCT year
FROM (
    SELECT year FROM temp_region
    UNION
    SELECT year FROM temp_industry
    UNION
    SELECT year FROM temp_business
) AS year
ORDER BY year ASC;
