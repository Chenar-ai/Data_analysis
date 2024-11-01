/*Generate a report which contains the top 5 customers who received an
average high pre_invoice_discount_pct for the fiscal year 2021 and in the
Indian market. The final output contains these fields,
customer_code
customer
average_discount_percentage*/


SELECT 
    dc.customer_code,
    dc.customer,
    AVG(fpi.pre_invoice_discount_pct)AS average_discount_percentage
FROM 
    dim_customer dc
JOIN 
    fact_pre_invoice_deductions fpi ON dc.customer_code = fpi.customer_code
WHERE 
    fpi.fiscal_year = 2021 
    AND dc.market = 'india'
GROUP BY 
    dc.customer_code, 
    dc.customer
ORDER BY 
    average_discount_percentage DESC
LIMIT 5;



    

    