-- Create dimension models

CREATE TABLE IF NOT EXISTS date_dim (
    date_id SERIAL PRIMARY KEY,
    year INT
);

CREATE TABLE IF NOT EXISTS gender_dim (
    gender_category_id SERIAL PRIMARY KEY,
    gender_category VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS business_size_dim (
    business_size_id SERIAL PRIMARY KEY,
    business_size_category VARCHAR(50) NOT NULL,
	gender_category VARCHAR(20),
    year INT,
    total_non_regular INT,
    probationary INT,
    casual INT,
    contractual INT,
    seasonal INT,
    apprentices_learners INT
);

CREATE TABLE IF NOT EXISTS industry_dim (
    industry_category_id SERIAL PRIMARY KEY,
    industry_category VARCHAR(50) NOT NULL,
	gender_category VARCHAR(20),
    year INT,
    total_non_regular INT,
    probationary INT,
    casual INT,
    contractual INT,
    seasonal INT,
    apprentices_learners INT
);

CREATE TABLE IF NOT EXISTS region_dim (
    region_id SERIAL PRIMARY KEY,
    region_name VARCHAR(50) NOT NULL,
	gender_category VARCHAR(20),
    year INT,
    total_non_regular INT,
    probationary INT,
    casual INT,
    contractual INT,
    seasonal INT,
    apprentices_learners INT
);

CREATE TABLE IF NOT EXISTS employment_data_fact (
    employment_data_fact_id SERIAL PRIMARY KEY,
    date_id INT REFERENCES date_dim(date_id),
    gender_category_id INT REFERENCES gender_dim(gender_category_id),
    business_size_id INT REFERENCES business_size_dim(business_size_id),
    industry_category_id INT REFERENCES industry_dim(industry_category_id),
    region_id INT REFERENCES region_dim(region_id),
    total_non_regular INT,
    probationary INT,
    casual INT,
    contractual INT,
    seasonal INT,
    apprentices_learners INT
);
