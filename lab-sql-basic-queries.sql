USE sakila;

#1 
SHOW FULL TABLES;

#2
SELECT * FROM actor;
SELECT * FROM film;
SELECT * FROM customer;

#3.1
SELECT title FROM film;
#3.2
SELECT name AS language FROM language;
#3.3
SELECT first_name FROM staff;

#4
SELECT DISTINCT release_year FROM film;

#5.1
SELECT COUNT(store_id) FROM store;
#5.2
SELECT COUNT(*) FROM staff;
#5.3
SELECT * FROM rental;
SELECT * FROM inventory;

-- Available for rent
SELECT COUNT(DISTINCT inventory.inventory_id) AS available_films
FROM inventory
LEFT JOIN rental ON inventory.inventory_id = rental.inventory_id
WHERE rental.return_date IS NOT NULL
	OR rental_id IS NULL;
    
-- Still rented
SELECT COUNT(inventory.inventory_id) AS rented_films
FROM inventory
INNER JOIN rental on inventory.inventory_id = rental.inventory_id
WHERE rental.return_date IS NULL;

-- SELECT COUNT(DISTINCT inventory_id) AS rented_films
-- FROM rental
-- WHERE return_date IS NULL;

#5.4
SELECT COUNT(DISTINCT last_name) FROM actor;

#6
SELECT title,length FROM film
ORDER BY length ASC 
LIMIT 10;

#7.1
SELECT first_name, last_name FROM actor
WHERE first_name = "SCARLETT";

-- SELECT first_name, last_name FROM actor
-- WHERE first_name IN ("SCARLETT");

#7.2
SELECT title, description, length FROM film
WHERE title LIKE "%ARMAGEDDON%" AND length > 100;

#7.3
SELECT COUNT(*) FROM film
WHERE special_features LIKE "%Behind the Scenes%";
