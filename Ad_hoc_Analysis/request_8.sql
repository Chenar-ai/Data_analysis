/*In which quarter of 2020, got the maximum total_sold_quantity? The final
output contains these fields sorted by the total_sold_quantity,
Quarter
total_sold_quantity
*/


SELECT QUARTER(date) AS quarter, SUM(sold_quantity) AS total_sold_quantity FROM fact_sales_monthly
WHERE fiscal_year = 2020
GROUP BY QUARTER(date)
ORDER BY SUM(sold_quantity) DESC;

 
