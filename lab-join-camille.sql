# LAB JOIN

# 1. List the number of films per category.
SELECT 
	C.name, COUNT(F.film_id) AS num_films
FROM
	category C
LEFT JOIN
	film_category F
ON
	C.category_id = F.category_id
GROUP BY
	C.name
ORDER BY
	C.name ASC;

# 2. Display the first and the last names, as well as the address, of each staff member.
SELECT
	S.first_name, S.last_name, A.address
FROM
	staff S
LEFT JOIN
	address A
ON
	S.address_id = A.address_id;

# 3. Display the total amount rung up by each staff member in August 2005. WHAT DOES THAT MEAN
# Tammy not in payment table
SELECT
	S.last_name, S.first_name, SUM(P.amount) AS total_amount_rung_up
FROM
	staff S    
LEFT JOIN
	payment P
ON
	S.staff_id = P.staff_id
WHERE
	P.payment_date like "%2005-08%"
GROUP BY
	S.last_name, S.first_name
ORDER BY
	s.last_name ASC;
    
# to check date format
SELECT * FROM PAYMENT LIMIT 5;

# 4. List all films and the number of actors who are listed for each film.
SELECT
	film.title, COUNT(f_actor.actor_id) AS num_actors
FROM
	film film
LEFT JOIN
	film_actor f_actor
ON
	film.film_id = f_actor.film_id
GROUP BY
	film.title
ORDER BY
	film.title ASC;

# 5. Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer. List the customers alphabetically by their last names.
SELECT
	C.last_name, C.first_name, SUM(P.amount) AS total_amount_paid
FROM
	customer C
LEFT JOIN
	payment P
ON
	C.customer_id = P.customer_id
GROUP BY
	C.last_name, C.first_name
ORDER BY
	C.last_name ASC;