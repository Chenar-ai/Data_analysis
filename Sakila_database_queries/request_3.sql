/*Top Actors: Find the top five actors with the most appearances in films, including the count of films they have acted in.*/

SELECT a.first_name, a.last_name, COUNT(f.film_id) as count_films 
FROM actor a JOIN film_actor f ON a.actor_id = f.actor_id
GROUP BY a.first_name, a.last_name
ORDER BY count_films DESC LIMIT 5;

