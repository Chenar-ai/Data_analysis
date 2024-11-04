/*Film Inventory: List all films along with their rental rate and the number of copies available in the inventory.*/

SELECT 
  f.title as film_title,
  f.rental_rate, 
  COUNT(i.film_id) AS num_copies
FROM 
  film f
JOIN 
  inventory i ON f.film_id = i.film_id
GROUP BY f.title, f.rental_rate
ORDER BY f.title;

