/*Rental History: Create a report showing each customer’s total rental count and the total amount spent on rentals.*/


SELECT 
    c.customer_id, 
    c.first_name, 
    c.last_name, 
    COUNT(r.rental_id) AS total_rental_count, 
    CONCAT("$ ", SUM(p.amount)) AS total_amount_spent
FROM 
    customer c 
JOIN 
    rental r ON c.customer_id = r.customer_id
JOIN 
    payment p ON r.rental_id = p.rental_id
GROUP BY 
    c.customer_id, c.first_name, c.last_name
ORDER BY 
    c.customer_id ASC;
