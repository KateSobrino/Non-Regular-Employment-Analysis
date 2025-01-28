-- Insert region_dim table values
INSERT INTO employment_data_fact (
    date_id,
    gender_category_id,
    region_id,
    total_non_regular,
    probationary,
    casual,
    contractual,
    seasonal,
    apprentices_learners
)
SELECT
    d.date_id,
    g.gender_category_id,
    rt.region_id,
    r.total_non_regular,
    r.probationary,
	r.casual ,
	r.contractual,
	r.seasonal ,
	r. apprentices_learners
FROM
	region_dim r 
LEFT JOIN gender_dim g ON g.gender_category = r.gender_category 
RIGHT JOIN date_dim d ON d.year = r.year
RIGHT JOIN region rt ON r.region_name = rt.region_name;


-- Insert business_dim table values
INSERT INTO employment_data_fact (
    date_id,
    gender_category_id,
    business_size_id,
    total_non_regular,
    probationary,
    casual,
    contractual,
    seasonal,
    apprentices_learners
)
SELECT
    d.date_id,
    g.gender_category_id,
    bt.business_size_id,
    b.total_non_regular,
    b.probationary,
	b.casual ,
	b.contractual,
	b.seasonal ,
	b. apprentices_learners
FROM
	business_size_dim b
LEFT JOIN date_dim d ON d.year = b.year
RIGHT JOIN gender_dim g ON g.gender_category = b.gender_category
RIGHT JOIN business_size bt ON bt.business_size_category = b.business_size_category;


-- Insert industry_dim table values
INSERT INTO employment_data_fact (
    date_id,
    gender_category_id,
    industry_category_id,
    total_non_regular,
    probationary,
    casual,
    contractual,
    seasonal,
    apprentices_learners
)
SELECT
    d.date_id,
    g.gender_category_id,
    it.industry_category_id,
    i.total_non_regular,
    i.probationary,
	i.casual ,
	i.contractual,
	i.seasonal ,
	i. apprentices_learners
FROM
	industry_dim i
LEFT JOIN date_dim d ON d.year = i.year
RIGHT JOIN gender_dim g ON g.gender_category = i.gender_category
RIGHT JOIN industry it ON it.industry_category = i.industry_category;


-- DROP SCHEMA public CASCADE;
-- CREATE SCHEMA public;
