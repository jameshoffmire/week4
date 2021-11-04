-- 1. List all customers who live in Texas (use JOINs)
SELECT *
FROM customer
LEFT JOIN address ON customer.address_id = address.address_id
WHERE address.district = 'Texas';
-- ANSWER: 5 customers



-- 2. Get all payments above $6.99 with the Customer's Full Name
SELECT payment_id, first_name, last_name, amount
FROM payment
LEFT JOIN customer on payment.customer_id = customer.customer_id
WHERE amount > 6.99;
-- ANSWER: 1406 payments



-- 3. Show all customers names who have made payments over $175(use subqueries)
SELECT first_name, last_name
FROM customer
WHERE customer_id IN(
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 175
);
-- ANSWER: 6 customers


-- 4. List all customers that live in Nepal (use the city table)
SELECT *
FROM customer
LEFT JOIN address on customer.address_id = address.address_id
LEFT JOIN city on address.city_id = city.city_id
LEFT JOIN country on city.country_id = country.country_id
WHERE country.country = 'Nepal';
-- ANSWER: 1 customer


-- 5. Which staff member had the most transactions?
SELECT staff.staff_id, staff.first_name, staff.last_name, COUNT(*) AS transations
FROM rental
LEFT JOIN staff ON rental.staff_id = staff.staff_id
GROUP BY staff.staff_id
ORDER BY COUNT(*) DESC
LIMIT 1;
-- ANSWER: Mike Hellyer with 8040 transactions


-- 6. How many movies of each rating are there?
SELECT rating, COUNT(*)
FROM film
GROUP BY rating;
--ANSWER: 194 PG, 195 R, 179 G, 223 PG-13, 210 NC-17


-- 7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
SELECT *
FROM customer
WHERE customer_id IN(
	SELECT customer_id
	FROM payment
	WHERE amount > 6.99
	GROUP BY customer_id
	HAVING COUNT(*) = 1
);
-- ANSWER: 130 customers have made a single payments above $6.99


-- 8. How many free rentals did our stores give away?
SELECT COUNT(*)
FROM rental
LEFT JOIN payment on rental.rental_id = payment.rental_id
WHERE payment.amount = 0;
-- ANSWER: 24 free rentals

