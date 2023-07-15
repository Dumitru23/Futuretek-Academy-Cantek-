--T3
--Shows how much revenue is coming from different countries to the DVD store

SELECT co.country, SUM(p.amount) AS total_revenue
FROM payment p
JOIN customer c ON c.customer_id = p.customer_id
JOIN address a ON c.address_id = a.address_id
JOIN city ci ON ci.city_id = a.city_id
JOIN country co ON co.country_id = ci.country_id
GROUP BY co.country;


--T4
--Show which actors are bringing in the most revenue
SELECT act.first_name, act.last_name, SUM(p.amount) AS total_revenue
FROM actor act
JOIN film_actor fa ON act.actor_id = fa.actor_id
JOIN film f ON fa.film_id = f.film_id
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN payment p ON r.rental_id = p.rental_id
GROUP BY act.actor_id
ORDER BY total_revenue DESC
LIMIT 10;

--T6
SELECT * 
FROM  Country

--T6.1
SELECT 
	country
FROM  Country


--T7

SELECT category_id, COUNT(*) AS category_count
FROM film_category
GROUP BY category_id;

--T7
--Count movies based on Category_name
SELECT c.category_id, c.name AS category_name, COUNT(*) AS film_count
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
GROUP BY c.category_id, c.name
ORDER BY film_count DESC;

