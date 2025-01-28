-- Create normalized model

CREATE TABLE IF NOT EXISTS date (
    date_id SERIAL PRIMARY KEY,
    year INT NOT NULL
);

CREATE TABLE IF NOT EXISTS gender (
    gender_category_id SERIAL PRIMARY KEY,
    gender_category VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS business_size (
    business_size_id SERIAL PRIMARY KEY,
    business_size_category VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS industry (
    industry_category_id SERIAL PRIMARY KEY,
    industry_category VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS region (
    region_id SERIAL PRIMARY KEY,
    region_name VARCHAR(50) NOT NULL
);


CREATE TABLE IF NOT EXISTS employment_data (
    employment_data_id SERIAL PRIMARY KEY,
    gender_category_id INT REFERENCES gender(gender_category_id),
    business_size_id INT REFERENCES business_size(business_size_id),
    industry_category_id INT REFERENCES industry(industry_category_id),
    region_id INT REFERENCES region(region_id),
    date_id INT REFERENCES date(date_id),
    total_non_regular INT,
    probationary INT,
    casual INT,
    contractual INT,
    seasonal INT,
    apprentices_learners INT
);
