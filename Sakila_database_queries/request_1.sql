/*Customer Details: Retrieve the first name, last name, and email of all customers who have rented movies in the last 30 days.*/

SELECT 
  C.first_name,
  C.last_name, 
  C.email, 
  R.rental_date AS date 
FROM 
  customer C 
JOIN 
  rental R ON C.customer_id = R.customer_id
WHERE R.rental_date = "2006-02-14 15:16:03"
GROUP BY 
  C.first_name, 
  C.last_name, 
  C.email, 
  R.rental_date
ORDER BY R.rental_date DESC;





