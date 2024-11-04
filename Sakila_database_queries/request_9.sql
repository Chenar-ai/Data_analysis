/*Actor Collaborations: Identify pairs of actors who have appeared in the same films and count how many films they have collaborated on.*/

SELECT 
	CONCAT(a1.first_name,"  ", a1.last_name) AS actor_1, 
    CONCAT(a2.first_name,"  ", a2.last_name) AS actor_2, 
    COUNT(fa1.film_id) AS film_counts
FROM 
	film_actor fa1 
JOIN 
	film_actor fa2 ON fa1.film_id = fa2.film_id
JOIN 
	actor a1 ON fa1.actor_id = a1.actor_id
JOIN 
	actor a2 ON fa2.actor_id = a2.actor_id
WHERE 
    a1.actor_id < a2.actor_id
GROUP BY 
	actor_1,
    actor_2
ORDER BY 
	actor_1,
    actor_2
    DESC;

