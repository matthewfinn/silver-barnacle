[← Table of Contents](ToC.md)
# Section 8: Course Project
* 14 Challenges
* Sometimes multiple solutions are possible
* All challenges related to the **greencycles** demo database supplied
* &#9989; = correct, &#10060; = incorrect - marked beside _My Solution_ for each question

## Question 1 - DISTINCT
**Level:** Simple
**Topic:** DISTINCT
**Task:** Create a list of all the different (distinct) replacement costs of the films.
**Question:** What's the lowest replacement cost?
**Answer:** 9.99

**My Solution** &#9989;
```sql
SELECT DISTINCT(replacement_cost)
FROM film
ORDER BY replacement_cost
```

**Course Solution**
```sql
SELECT DISTINCT replacement_cost 
FROM film
ORDER BY 1
```

## Question 2 - CASE + GROUP BY
**Level:** Moderate
**Topic:** CASE + GROUP BY
**Task:** Write a query that gives an overview of how many films have replacements costs in the following cost ranges
* low: 9.99 - 19.99
* medium: 20.00 - 24.99
* high: 25.00 - 29.99

**Question:** How many films have a replacement cost in the "low" group?
**Answer:** 514

**My Solution** &#9989;
```sql
SELECT 
CASE
WHEN replacement_cost BETWEEN 9.99 AND 19.99 THEN 'low'
WHEN replacement_cost BETWEEN 20.00 AND 24.99 THEN 'medium'
WHEN replacement_cost BETWEEN 25.00 AND 29.99 THEN 'high'
END AS "Cost Category",
COUNT(*) AS "Number Of Films"
FROM film
GROUP BY "Cost Category"
```

**Course Solution**
```sql
SELECT 
CASE 
WHEN replacement_cost BETWEEN 9.99 AND 19.99
THEN 'low'
WHEN replacement_cost BETWEEN 20 AND 24.99
THEN 'medium'
ELSE 'high'
END as cost_range,
COUNT(*)
FROM film
GROUP BY cost_range
```

## Question 3 - JOIN
**Level:** Moderate
**Topic:** JOIN
**Task:** Create a list of the film titles including their title, length, and category name ordered descendingly by length. Filter the results to only the movies in the category 'Drama' or 'Sports'.
**Question:** In which category is the longest film and how long is it?
**Answer:** Sports and 184

**My Solution** &#9989;
```sql
SELECT f.title, f.length, c.name
FROM film f
INNER JOIN film_category fc
ON f.film_id = fc.film_id
INNER JOIN category c
ON fc.category_id = c.category_id
WHERE c.name IN ('Drama', 'Sports')
ORDER BY f.length DESC
```

**Course Solution**
```sql
SELECT 
title,
name,
length
FROM film f
LEFT JOIN film_category fc
ON f.film_id=fc.film_id
LEFT JOIN category c
ON c.category_id=fc.category_id
WHERE name = 'Sports' OR name = 'Drama'
ORDER BY length DESC
```

## Question 4 - JOIN & GROUP BY
**Level:** Moderate
**Topic:** JOIN & GROUP BY
**Task:** Create an overview of how many movies (titles) there are in each category (name).
**Question:** Which category (name) is the most common among the films?
**Answer:** Sports with 74 titles

**My Solution**  &#9989;
```sql
SELECT 
c.name AS "Category Name", 
COUNT(*) as "Number Of Titles"
FROM film f
INNER JOIN film_category fc
ON f.film_id = fc.film_id
INNER JOIN category c
ON fc.category_id = c.category_id
GROUP BY "Category Name"
ORDER BY "Number Of Titles" DESC
```

**Course Solution**
```sql
SELECT
name,
COUNT(title)
FROM film f
INNER JOIN film_category fc
ON f.film_id=fc.film_id
INNER JOIN category c
ON c.category_id=fc.category_id
GROUP BY name
ORDER BY 2 DESC
```

## Question 5 - JOIN & GROUP BY
**Level:** Moderate
**Topic:** JOIN & GROUP BY
**Task:** Create an overview of the actors' first and last names and in how many movies they appear in.
**Question:** Which actor is part of most movies??
**Answer:** Susan Davis with 54 movies - **This is incorrect, 2 actors with name Susan Davis - Even the Course Solution Query doesn't return this answer!!**

**My Solution** &#9989;
```sql
SELECT
a.actor_id,
first_name,
last_name,
COUNT(title) as "Number Of Films"
FROM actor a
INNER JOIN film_actor fa
ON a.actor_id = fa.actor_id
INNER JOIN film f
ON fa.film_id = f.film_id
GROUP BY a.actor_id
ORDER BY "Number Of Films" DESC
```

**Course Solution**
```sql
SELECT
a.actor_id,
first_name,
last_name,
COUNT(*)
FROM actor a
LEFT JOIN film_actor fa
ON fa.actor_id=a.actor_id
LEFT JOIN film f
ON fa.film_id=f.film_id
GROUP BY a.actor_id,first_name, last_name
ORDER BY COUNT(*) DESC
```

## Question 6 - LEFT JOIN & FILTERING
**Level:** Moderate
**Topic:** LEFT JOIN & FILTERING
**Task:** Create an overview of the addresses that are not associated to any customer.
**Question:** How many addresses are that?
**Answer:** 4

**My Solution** &#9989;
```sql
SELECT *
FROM address a
LEFT JOIN customer c
ON a.address_id = c.address_id
WHERE c.customer_id IS NULL
```

**Course Solution**
```sql
SELECT * FROM address a
LEFT JOIN customer c
ON c.address_id = a.address_id
WHERE c.first_name is null
```

## Question 7 - JOIN & GROUP BY
**Level:** Moderate
**Topic:** JOIN & GROUP BY
**Task:** Create the overview of the sales  to determine the from which city (we are interested in the city in which the customer lives, not where the store is) most sales occur.
**Question:** What city is that and how much is the amount?
**Answer:** Cape Coral with a total amount of 221.55

**My Solution** &#9989;
```sql
SELECT 
city,
ROUND(SUM(amount), 2) AS "Total Amount"
FROM payment p
INNER JOIN customer c
ON p.customer_id = c.customer_id
INNER JOIN address a
ON c.address_id = a.address_id
INNER JOIN city ct
ON a.city_id = ct.city_id
GROUP BY city
ORDER BY "Total Amount" DESC
```

**Course Solution**
```sql
SELECT 
city,
SUM(amount)
FROM payment p
LEFT JOIN customer c
ON p.customer_id=c.customer_id
LEFT JOIN address a
ON a.address_id=c.address_id
LEFT JOIN city ci
ON ci.city_id=a.city_id
GROUP BY city
ORDER BY city DESC
```

## Question 8 - JOIN & GROUP BY
**Level:** Moderate to Difficult
**Topic:** JOIN & GROUP BY
**Task:** Create an overview of the revenue (sum of amount) grouped by a column in the format "country, city".
**Question:** Which country, city has the least sales?
**Answer:** United States, Tallahassee with a total amount of 50.85.

**My Solution** &#9989;
```sql
SELECT 
country || ', ' || city AS "Location",
ROUND(SUM(amount), 2) AS "Total Amount"
FROM payment p
INNER JOIN customer c
ON p.customer_id = c.customer_id
INNER JOIN address a
ON c.address_id = a.address_id
INNER JOIN city ct
ON a.city_id = ct.city_id
INNER JOIN country ctry
ON ct.country_id = ctry.country_id
GROUP BY "Location"
ORDER BY "Total Amount" DESC
```

**Course Solution** 
```sql
SELECT 
country ||', ' ||city,
SUM(amount)
FROM payment p
LEFT JOIN customer c
ON p.customer_id=c.customer_id
LEFT JOIN address a
ON a.address_id=c.address_id
LEFT JOIN city ci
ON ci.city_id=a.city_id
LEFT JOIN country co
ON co.country_id=ci.country_id
GROUP BY country ||', ' ||city
ORDER BY 2 ASC
```

## Question 9 - Uncorrelated Subquery
**Level:** Difficult
**Topic:** Uncorrelated subquery
**Task:** Create a list with the average of the sales amount each staff_id has per customer.
**Question:** Which staff_id makes on average more revenue per customer?
**Answer:** staff_id 2 with an average revenue of 56.64 per customer.

**My Solution** &#9989;
```sql
SELECT
staff_id,
ROUND(AVG(total_amount), 2)
FROM (SELECT staff_id, customer_id, SUM(amount) AS total_amount 
FROM payment
GROUP BY staff_id, customer_id)
GROUP BY staff_id
```

**Course Solution**
```sql
SELECT 
staff_id,
ROUND(AVG(total),2) as avg_amount 
FROM (
SELECT SUM(amount) as total,customer_id,staff_id
FROM payment
GROUP BY customer_id, staff_id) a
GROUP BY staff_id
```

## Question 10 - EXTRACT + Uncorrelated Subquery
**Level:** Difficult to Very Difficult
**Topic:** EXTRACT + Uncorrelated subquery
**Task:** Create a query that shows average daily revenue of all Sundays.
**Question:** What is the daily average revenue of all Sundays?
**Answer:** 1410.65

**My Solution** &#9989;
```sql
SELECT
ROUND(AVG(total_amount), 2) as avg_amount
FROM(
    SELECT 
    DATE(payment_date) AS "date", 
    SUM(amount) AS total_amount 
    FROM payment
    WHERE EXTRACT(DOW FROM payment_date) = 0
    GROUP BY "date")
```

**Course Solution**
```sql
SELECT 
AVG(total)
FROM 
	(SELECT
	 SUM(amount) as total,
	 DATE(payment_date),
	 EXTRACT(dow from payment_date) as weekday
	 FROM payment
	 WHERE EXTRACT(dow from payment_date)=0
	 GROUP BY DATE(payment_date),weekday) daily
```

## Question 11 - Correlated Subquery
**Level:** Difficult to Very Difficult
**Topic:** Correlated subquery
**Task:** Create a list of movies - with their length and their replacement cost - that are longer than the average length in each replacement cost group.
**Question:** Which two movies are the shortest on that list and how long are they?
**Answer:** CELEBRITY HORN and SEATTLE EXPECTATIONS with 110 minutes.

**My Solution** &#9989;
```sql
SELECT 
title, 
length, 
replacement_cost
FROM film f1
WHERE length > 
	(SELECT AVG(length) FROM film f2
	WHERE f1.replacement_cost = f2.replacement_cost)
ORDER BY length ASC
```

**Course Solution**
```sql
SELECT 
title,
length
FROM film f1
WHERE length > (SELECT AVG(length) FROM film f2
			   WHERE f1.replacement_cost=f2.replacement_cost)
ORDER BY length ASC
```

## Question 12 - Uncorrelated Subquery
**Level:** Very difficult
**Topic:** Uncorrelated subquery
**Task:** Create a list that shows the "average customer lifetime value" grouped by the different districts.

>_Example:_
If there are two customers in "District 1" where one customer has a total (lifetime) spent of $1000 and the second customer has a total spent of $2000 then the "average customer lifetime spent" in this district is $1500.
So, first, you need to calculate the total per customer and then the average of these totals per district.

**Question:** Which district has the highest average customer lifetime value?
**Answer:** Saint-Denis with an average customer lifetime value of 216.54.

**My Solution** &#9989;
```sql
SELECT
district,
ROUND(AVG(total), 2) "Average"
FROM
(SELECT c.customer_id, district, SUM(amount) AS total
	FROM payment p
	INNER JOIN customer c 
	ON p.customer_id = c.customer_id 
	INNER JOIN address a 
	ON c.address_id = a.address_id
	GROUP BY c.customer_id, district)
GROUP BY district
ORDER BY "Average" DESC
```

**Course Solution**
```sql
SELECT
district,
ROUND(AVG(total),2) avg_customer_spent
FROM
(SELECT 
c.customer_id,
district,
SUM(amount) total
FROM payment p
INNER JOIN customer c
ON c.customer_id=p.customer_id
INNER JOIN address a
ON c.address_id=a.address_id
GROUP BY district, c.customer_id) sub
GROUP BY district
ORDER BY 2 DESC
```

## Question 13 - Correlated Query
**Level:** Very Difficult
**Topic:** Correlated query
**Task:** Create a list that shows all payments including the payment_id, amount, and the film category (name) plus the total amount that was made in this category. Order the results ascendingly by the category (name) and as second order criterion by the payment_id ascendingly.
**Question:** What is the total revenue of the category 'Action' and what is the lowest payment_id in that category 'Action'?
**Answer:** Total revenue in the category 'Action' is 4375.85 and the lowest payment_id in that category is 16055.

**My Solution** &#9989;
```sql
SELECT
payment_id, 
amount,
f.title,
c1.name,
	ROUND((SELECT
SUM(amount)
FROM payment p
INNER JOIN rental r
ON p.rental_id = r.rental_id
INNER JOIN inventory i 
ON r.inventory_id = i.inventory_id
INNER JOIN film f
ON i.film_id = f.film_id
INNER JOIN film_category fc 
ON f.film_id = fc.film_id
INNER JOIN category c2
ON fc.category_id = c2.category_id
WHERE c1.name = c2.name
GROUP BY c2.category_id), 2) AS "Category Total"
FROM payment p
INNER JOIN rental r
ON p.rental_id = r.rental_id
INNER JOIN inventory i 
ON r.inventory_id = i.inventory_id
INNER JOIN film f
ON i.film_id = f.film_id
INNER JOIN film_category fc 
ON f.film_id = fc.film_id
INNER JOIN category c1
ON fc.category_id = c1.category_id
ORDER BY c1.name, payment_id
```

**Course Solution**
```sql
SELECT
title,
amount,
name,
payment_id,
(SELECT SUM(amount) FROM payment p
LEFT JOIN rental r
ON r.rental_id=p.rental_id
LEFT JOIN inventory i
ON i.inventory_id=r.inventory_id
LEFT JOIN film f
ON f.film_id=i.film_id
LEFT JOIN film_category fc
ON fc.film_id=f.film_id
LEFT JOIN category c1
ON c1.category_id=fc.category_id
WHERE c1.name=c.name)
FROM payment p
LEFT JOIN rental r
ON r.rental_id=p.rental_id
LEFT JOIN inventory i
ON i.inventory_id=r.inventory_id
LEFT JOIN film f
ON f.film_id=i.film_id
LEFT JOIN film_category fc
ON fc.film_id=f.film_id
LEFT JOIN category c
ON c.category_id=fc.category_id
ORDER BY name
```

## Bonus question 14 - Correlated & Uncorrelated Subqueries (nested)
**Level:** Extremely difficult
**Topic:** Correlated and uncorrelated subqueries (nested)
**Task:** Create a list with the top overall revenue of a film title (sum of amount per title) for each category (name).
**Question:** Which is the top-performing film in the animation category?
**Answer:** DOGMA FAMILY with 178.70.

**My Solution** &#9989;
```sql
SELECT 
title, 
name, 
SUM(amount) 
FROM film f
INNER JOIN film_category fc
ON f.film_id = fc.film_id
INNER JOIN category c
ON fc.category_id = c.category_id
INNER JOIN inventory i 
ON f.film_id = i.film_id
INNER JOIN rental r 
ON i.inventory_id = r.inventory_id
INNER JOIN payment p
ON r.rental_id = p.rental_id
GROUP BY title, name
HAVING SUM(amount) = (SELECT MAX(total) FROM 
                      (SELECT 
						title, 
						name, 
						SUM(amount) as total
						FROM film f
						INNER JOIN film_category fc
						ON f.film_id = fc.film_id
						INNER JOIN category c
						ON fc.category_id = c.category_id
						INNER JOIN inventory i 
						ON f.film_id = i.film_id
						INNER JOIN rental r 
						ON i.inventory_id = r.inventory_id
						INNER JOIN payment p
						ON r.rental_id = p.rental_id
						GROUP BY title, name) sub
			            WHERE c.name=sub.name)
```

**Course Solution**
```sql
SELECT
title,
name,
SUM(amount) as total
FROM payment p
LEFT JOIN rental r
ON r.rental_id=p.rental_id
LEFT JOIN inventory i
ON i.inventory_id=r.inventory_id
LEFT JOIN film f
ON f.film_id=i.film_id
LEFT JOIN film_category fc
ON fc.film_id=f.film_id
LEFT JOIN category c
ON c.category_id=fc.category_id
GROUP BY name,title
HAVING SUM(amount) =     (SELECT MAX(total)
			  FROM 
                                (SELECT
			          title,
                                  name,
			          SUM(amount) as total
			          FROM payment p
			          LEFT JOIN rental r
			          ON r.rental_id=p.rental_id
			          LEFT JOIN inventory i
			          ON i.inventory_id=r.inventory_id
				  LEFT JOIN film f
				  ON f.film_id=i.film_id
				  LEFT JOIN film_category fc
				  ON fc.film_id=f.film_id
				  LEFT JOIN category c1
				  ON c1.category_id=fc.category_id
				  GROUP BY name,title) sub
			   WHERE c.name=sub.name)
```
