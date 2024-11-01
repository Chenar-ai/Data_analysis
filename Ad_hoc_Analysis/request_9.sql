/*Which channel helped to bring more gross sales in the fiscal year 2021
and the percentage of contribution? The final output contains these fields,
channel
gross_sales_mln
percentage*/


SELECT 
    C.channel,
    CONCAT(ROUND(SUM(G.gross_price * FS.sold_quantity) / 1000000, 2), ' M') AS Gross_sales_mln,
    CONCAT(ROUND((SUM(G.gross_price * FS.sold_quantity) / 1000000) * 100 / 
           (SELECT SUM(G2.gross_price * FS2.sold_quantity) / 1000000 
            FROM fact_sales_monthly FS2 
            JOIN dim_customer C2 ON FS2.customer_code = C2.customer_code 
            JOIN fact_gross_price G2 ON FS2.product_code = G2.product_code 
            WHERE FS2.fiscal_year = 2021), 2), ' %') AS percentage
FROM 
    fact_sales_monthly FS 
JOIN 
    dim_customer C ON FS.customer_code = C.customer_code
JOIN 
    fact_gross_price G ON FS.product_code = G.product_code
WHERE 
    FS.fiscal_year = 2021
GROUP BY 
    C.channel
ORDER BY 
    percentage DESC 
LIMIT 0, 1000;
