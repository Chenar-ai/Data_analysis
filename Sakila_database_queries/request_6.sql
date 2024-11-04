/*Monthly Rentals: Generate a summary of rentals by month for the current year, showing the total rentals per month.*/

SELECT 
  COUNT(rental_id) AS rentals, 
  MONTH(rental_date) AS months 
FROM 
  rental
GROUP BY MONTH(rental_date)
ORDER BY MONTH(rental_date) ASC;

