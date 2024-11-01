/*Get the Top 3 products in each division that have a high
total_sold_quantity in the fiscal_year 2021? The final output contains these
fields,
division
product_code
codebasics.io
product
total_sold_quantity
rank_order*/

WITH SalesData AS (
    SELECT 
        dp.division,
        fs.product_code,
        dp.product,
        SUM(fs.sold_quantity) AS total_sold_quantity
    FROM 
        dim_product dp
    JOIN 
        fact_sales_monthly fs ON dp.product_code = fs.product_code
    WHERE 
        fs.fiscal_year = 2021
    GROUP BY 
        dp.division, fs.product_code, dp.product
),
RankedProducts AS (
    SELECT 
        division,
        product_code,
        product,
        total_sold_quantity,
        RANK() OVER (PARTITION BY division ORDER BY total_sold_quantity DESC) AS rank_order
    FROM 
        SalesData
)
SELECT 
    division,
    product_code,
    product,
    total_sold_quantity,
    rank_order
FROM 
    RankedProducts
WHERE 
    rank_order <= 3
ORDER BY 
    division, rank_order;


