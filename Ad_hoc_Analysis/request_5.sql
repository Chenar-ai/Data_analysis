/*Get the products that have the highest and lowest manufacturing costs.
The final output should contain these fields,
product_code
product
manufacturing_cost*/


SELECT 
	dp.product_code,
    dp.product,
    fmc.manufacturing_cost
FROM 
	dim_product dp JOIN fact_manufacturing_cost fmc
    ON dp.product_code = fmc.product_code
WHERE manufacturing_cost
IN (
		SELECT MAX(manufacturing_cost) FROM fact_manufacturing_cost UNION 
			  SELECT MIN(manufacturing_cost) FROM fact_manufacturing_cost)
ORDER BY fmc.manufacturing_cost DESC;
	 
    
   
    

