/*Customer Registration: List all customers who registered in the last year,
including their registration date and any rentals they have made.*/ 

SELECT 
  c.first_name, 
  c.last_name, 
  c.create_date AS registration_date, 
  COUNT(r.rental_id) AS rentals
FROM 
  customer c 
JOIN 
  rental r ON c.customer_id = r.customer_id
WHERE 
  YEAR(c.create_date) = 2006
GROUP BY 
  c.first_name,
  c.last_name, 
  c.create_date
ORDER BY c.first_name, c.last_name ASC;

