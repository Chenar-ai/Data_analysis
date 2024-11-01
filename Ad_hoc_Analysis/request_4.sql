/*Follow-up: Which segment had the most increase in unique products in
2021 vs 2020? The final output contains these fields,
segment
product_count_2020
product_count_2021
difference*/


SELECT 
    dp.segment,
    COUNT(DISTINCT CASE WHEN fsm.fiscal_year = 2020 THEN fsm.product_code END) AS product_count_2020,
    COUNT(DISTINCT CASE WHEN fsm.fiscal_year = 2021 THEN fsm.product_code END) AS product_count_2021,
    (COUNT(DISTINCT CASE WHEN fsm.fiscal_year = 2021 THEN fsm.product_code END) -
     COUNT(DISTINCT CASE WHEN fsm.fiscal_year = 2020 THEN fsm.product_code END)) AS difference
FROM 
    dim_product dp
INNER JOIN 
    fact_sales_monthly fsm ON dp.product_code = fsm.product_code
WHERE 
    fsm.fiscal_year IN (2020, 2021)
GROUP BY 
    dp.segment
ORDER BY 
	dp.segment;

    
