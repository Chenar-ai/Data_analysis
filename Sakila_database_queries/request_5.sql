/*Genre Popularity: Determine which film genre has the highest total rental count and display the genre name along with the rental count.*/

SELECT 
  c.name AS genre,
  COUNT(r.rental_id) AS total_rental_count
FROM 
  category c
JOIN
  film_category fc ON c.category_id = fc.category_id
JOIN 
  film f ON fc.film_id = f.film_id
JOIN 
  inventory i ON f.film_id = i.film_id 
JOIN 
  rental r ON i.inventory_id = r.inventory_id
GROUP BY c.name
ORDER BY COUNT(r.rental_id) DESC LIMIT 1;
