/* Get the complete report of the Gross sales amount for the customer “Atliq
Exclusive” for each month. This analysis helps to get an idea of low and
high-performing months and take strategic decisions.
The final report contains these columns:
Month
Year
Gross sales Amount
*/


SELECT CONCAT(MONTHNAME(fsm.date), ' (', YEAR(fsm.date), ')') AS 'Month', fsm.fiscal_year AS year, ROUND(SUM(fgp.gross_price * fsm.sold_quantity),2) AS gross_sales_amount
FROM fact_sales_monthly fsm JOIN fact_gross_price fgp ON fsm.product_code = fgp.product_code
JOIN dim_customer dc ON fsm.customer_code = dc.customer_code WHERE dc.customer = "Atliq Exclusive"
GROUP BY fsm.fiscal_year, fsm.date
ORDER BY fsm.fiscal_year;

