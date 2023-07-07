use projects;

-- Cleansing
ALTER TABLE bikestores
	RENAME COLUMN MyUnknownColumn 
    TO month;

-- Counting entry for every columns 
SELECT *
	FROM bikestores;

SELECT 
	SUM(revenue) AS Total_revenue,
    SUM(total_units) AS Units_sold,
    COUNT(DISTINCT order_id) AS Orders,
    COUNT(DISTINCT customers) AS Customers,
    COUNT(DISTINCT sales_rep) AS Sales_reps
FROM
	bikestores;

SELECT 
	COUNT(DISTINCT city) AS cities,
    COUNT(DISTINCT state) AS state,
    COUNT(DISTINCT product_name) AS Products,
    COUNT(DISTINCT category_name) AS Categories,
    COUNT(DISTINCT brand_name) as Brands,
    COUNT(DISTINCT store_name) as Stores
FROM
	bikestores;

-- Revenue by year
SELECT 
	year,
    SUM(revenue) AS revenue
FROM
	bikestores
GROUP BY
	year
ORDER BY
	year;
    
-- Revenue by month
SELECT 
	month,
    SUM(revenue) AS revenue,
    SUM(total_units) AS units_sold
FROM
	bikestores
GROUP BY
	month
ORDER BY
	revenue;

-- Revenue by season
SELECT 
	CASE
		WHEN month IN ('Jan', 'Feb','Mar') THEN 'Spring'
        WHEN month IN ('Apr','May', 'Jun') THEN 'Summer'
        WHEN month IN ('Jul', 'Aug', 'Sep') THEN 'Autumn'
        ELSE 'Winter'
	END AS Season,
    SUM(revenue) AS Total_revenue,
    SUM(total_units) AS Total_units_sold
FROM 
	bikestores
GROUP BY 
	season;

-- Revenue by store
SELECT 
	store_name,
    SUM(revenue) as Total_revenue,
    SUM(total_units) as Units_sold
FROM
	bikestores
GROUP BY
	store_name
ORDER BY
	Total_revenue;
    
-- Revenue by city/state
SELECT
	city,
    state,
    SUM(revenue) AS Total_revenue,
    SUM(total_units) AS Units_sold
FROM 
	bikestores 
GROUP BY
	city, state
ORDER BY
	Total_revenue
LIMIT
	10;

-- Revenue by category
SELECT
	category_name,
    SUM(revenue) AS Total_revenue,
    SUM(total_units) AS Units_sold
FROM 
	bikestores 
GROUP BY
	category_name
ORDER BY
	Total_revenue;

-- Revenue by brand
SELECT
	brand_name,
    SUM(revenue) AS Total_revenue,
    SUM(total_units) AS Units_sold
FROM 
	bikestores 
GROUP BY
	brand_name
ORDER BY
	Total_revenue;

SELECT
	product_name,
    SUM(revenue) AS Total_revenue,
    SUM(total_units) AS Units_sold
FROM 
	bikestores 
GROUP BY
	product_name
ORDER BY
	units_sold DESC
LIMIT 
	10;



    


        



