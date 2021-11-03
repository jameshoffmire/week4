-- 1. How many actors are there with the last name ‘Wahlberg’? 
SELECT COUNT(*)
FROM actor
WHERE last_name LIKE 'Wahlberg';
-- answer: 2



-- 2. How many payments were made between $3.99 and $5.99? 
SELECT COUNT(*)
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;
-- answer: 5,607



-- 3. What film does the store have the most of? (search in inventory) 
SELECT film.title AS title, film.film_id AS film_id, COUNT(film.film_id) AS cnt
FROM inventory
LEFT JOIN film
ON film.film_id = inventory.film_id
GROUP BY film.film_id
ORDER BY COUNT(*) DESC
LIMIT 1;
--answer: "Garden Island"	350	8



-- 4. How many customers have the last name ‘William’? 
SELECT *
FROM customer
WHERE last_name = 'William';

SELECT *
FROM customer
WHERE last_name LIKE 'William%';

-- answer: zero customers have the last name 'William' 
-- but two customers have a last name that begins with 'William'

-- 5. What store employee (get the id) sold the most rentals? 
SELECT staff_id, COUNT(*)
FROM rental
GROUP BY staff_id
ORDER BY COUNT(*) DESC
LIMIT 2;

SELECT first_name, last_name, staff_id
FROM staff
WHERE staff_id = 1;
-- answer: "Mike"	"Hillyer"	1

-- 6. How many different district names are there? 
SELECT COUNT(DISTINCT district)
FROM address;
-- answer: 378



-- 7. What film has the most actors in it? (use film_actor table and get film_id) 
SELECT film_id, COUNT(*)
FROM film_actor
GROUP BY film_id
ORDER BY COUNT(*) DESC
LIMIT 1;
-- output: film_id 508, count 15
SELECT title
FROM film
WHERE film_id = 508;
-- answer: Lambs Cincinatti



-- 8. From store_id 1, how many customers have a last name 
-- ending with ‘es’? (use customer table)
SELECT COUNT(*)
FROM customer
WHERE last_name LIKE '%es';
-- answer: 22

-- 9. How many payment amounts (4.99, 5.99, etc.) had a 
-- number of rentals above 250 for customers  with ids 
-- between 380 and 430? (use group by and having > 250) 
SELECT amount, count(*)
FROM payment
WHERE customer_id BETWEEN 380 AND 430
GROUP BY amount
HAVING COUNT(*) > 250;
-- answer: 3



--10. Within the film table, how many rating categories are there? And what rating has the most  movies total?

SELECT rating, COUNT(*)
from film
GROUP BY rating
ORDER BY COUNT(*) DESC;
-- answer: 5 ratings, PG-13 is the rating with the most films