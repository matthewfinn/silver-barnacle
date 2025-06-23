[← Table of Contents](ToC.md)
# Section 16: CTEs (Common Table Expressions)

## What are CTEs?
A CTE is a temporary result set that you can reference within your query. 
CTEs make your SQL queries more readable and easier to manage, especially when dealing with complex joins and subqueries.

**Here’s why CTEs are useful:**

1. **Improves Readability**: They help break down complex queries into simpler, more understandable parts.
2. **Reusability**: You can reference the CTE multiple times within the same query, which avoids repetition of the same subquery.
3. **Modularity**: They allow for a modular approach to building queries, making it easier to debug and maintain.
4. **Recursive Queries**: CTEs support recursion, enabling you to write queries that deal with hierarchical or tree-structured data.

### CTEs - First Example
#### Syntax
```sql
WITH cte_name AS (
	-- CTE Query
	SELECT column1, column2, ...
	FROM table_name
	WHERE condition
)
SELECT column1, column2, ...
FROM cte_name
WHERE condition;
```

#### Query without CTE
```sql
SELECT film_id, title, rental_count
FROM (
	SELECT f.film_id, f.title, COUNT(r.rental_id) AS rental_count
	FROM film f
	JOIN inventory i ON f.film_id = i.film_id
	JOIN rental r ON i.inventory_id = r.inventory_id
	GROUP BY f.film_id, f.title
) AS film_rentals
WHERE rental_count > 30;
```

#### Query with CTE
```sql
WITH film_rentals AS (
	-- CTE Query
	SELECT f.film_id, f.title, COUNT(r.rental_id) AS rental_count
	FROM film f
	JOIN inventory i ON f.film_id = i.film_id
	JOIN rental r ON i.inventory_id = r.inventory_id
	GROUP BY f.film_id, f.title
)
SELECT film_id, title, rental_count
FROM film_rentals
WHERE rental_count > 30;
```

### CTEs - More Complex Example
#### Query without CTE
```sql
SELECT film_id, title, rental_duration
FROM (
	SELECT 
	f.film_id,
	f.title,
	AVG(r.return_date - r.rental_date) AS rental_duration
	FROM film f
	JOIN inventory i ON f.film_id = i.film_id
	JOIN rental r ON i.inventory_id = r.inventory_id
	GROUP BY f.film_id, f.title
) AS film_duration
WHERE rental_duration > (
	SELECT AVG(rental_duration)
	FROM (
		SELECT AVG(r.return_date - r.rental_date) AS rental_duration
		FROM film f
		JOIN inventory i ON f.film_id = i.film_id
		JOIN rental r ON i.inventory_id = r.inventory_id
		GROUP BY f.film_id, f.title
	) AS subquery
);
```

#### Query with CTE
```sql
WITH rental_duration_cte AS
(SELECT 
	f.film_id,
	f.title,
	AVG(r.return_date - r.rental_date) AS rental_duration
	FROM film f
	JOIN inventory i ON f.film_id = i.film_id
	JOIN rental r ON i.inventory_id = r.inventory_id
	GROUP BY f.film_id, f.title
)
SELECT film_id, title, rental_duration
FROM rental_duration_cte
WHERE rental_duration > (
	SELECT AVG(rental_duration)
	FROM rental_duration_cte
)
```

### Challenge 1: Create a simple CTE
> Calculate the total rental count and total rental amount for each customer, and list customers who have rented more than the average number of films.

**Solution:**
```sql
WITH rental_count_cte AS(
	SELECT 
	c.customer_id, c.first_name, c.last_name, 
	COUNT(r.*) AS num_rentals,
	SUM(amount) AS total_amount
	FROM rental r
	JOIN payment p ON r.rental_id = p.rental_id
	JOIN customer c ON p.customer_id = c.customer_id
	GROUP BY c.customer_id
)
SELECT customer_id, first_name, last_name, num_rentals,	total_amount
FROM rental_count_cte
WHERE num_rentals > (
	SELECT AVG(num_rentals)
	FROM rental_count_cte
)
```
### CTEs - Using Multiple CTEs
#### Syntax
```sql
WITH cte1 AS (
	-- CTE Query
	SELECT column1, column2, ...
	FROM table_name
	WHERE condition
),
cte2 AS (
	-- CTE Query
	SELECT column1, column2, ...
	FROM cte1 -- Can reference first CTE
	WHERE condition
),
cte3 AS (
	-- CTE Query
	SELECT column1, column2, ...
	FROM cte2 --or cte1 Can reference either CTE
	WHERE condition
)
SELECT column1, column2, ...
FROM cte1 -- or cte2, cte3
WHERE condition;
```

#### Example - Without CTEs
```sql
/*
    Objective:
    Identify customers who have spent more than the avarge amount on rentals
    and list all of the films they've rented
*/

SELECT 
hsc.customer_id,
hsc.first_name,
hsc.last_name,
hsc.total_spent,
f.film_id,
f.title
FROM (
	SELECT cs.customer_id, cs.first_name, cs.last_name, cs.total_spent
	FROM (
		SELECT c.customer_id, c.first_name, c.last_name, SUM(p.amount) AS total_spent
		FROM customer c
		JOIN payment p ON c.customer_id = p.customer_id
		GROUP BY c.customer_id, c.first_name, c.last_name
	) AS cs
	WHERE cs.total_spent > (
		SELECT AVG(total_spent)
		FROM (
			SELECT c2.customer_id, SUM(p2.amount) AS total_spent
			FROM customer c2
			JOIN payment p2 ON c2.customer_id = p2.customer_id
			GROUP BY c2.customer_id
		) AS cs2
	)
) AS hsc
JOIN rental r ON hsc.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
```

#### Example - WITH CTEs
```sql
-- Step 1: Define the CTE for calculating total spend per customer
WITH customer_spending AS (
	SELECT c.customer_id, c.first_name, c.last_name, SUM(p.amount) AS total_spent
	FROM customer c
	JOIN payment p ON c.customer_id = p.customer_id
	GROUP BY c.customer_id, c.first_name, c.last_name
),

-- Step 2: Define the CTE for finding high spending customers
high_spending_customers AS (
	SELECT cs.customer_id, cs.first_name, cs.last_name, cs.total_spent
	FROM customer_spending cs
	WHERE cs.total_spent > (SELECT AVG(total_spent) FROM customer_spending)
)

-- Step 3: Use the CTEs to find the films rented by high spending customers
SELECT 
hsc.customer_id,
hsc.first_name,
hsc.last_name,
hsc.total_spent,
f.film_id,
f.title
FROM high_spending_customers hsc
JOIN rental r ON hsc.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
```

### Challenge 2: Using Multiple CTEs
**Objective:** Calculate the total rental count and total rental amount for each customer, identify customers who have rented more than the average number of films, and list the details of the films they have rented.

**Context:** In the DVD rental business, we need to understand customer behavior by calculating how many movies each customer has rented and how much they have spent. We will then identify customers who rent movies more frequently than the average customer and list the details of the films they have rented.

**Note:**
* **High-Rental Customers:** Customers who have rented more than the average number of films.

**Setup:**
The DVD rental database already includes the following tables:
* `customer`
* `rental`
* `payment`
* `inventory`
* `film`

**Challenge:**
* Create a CTE to calculate the total rental count and total rental amount for each customer.
* Create a CTE to calculate the average rental count across all customers.
* Create a CTE to identify customers who have rented more than the average number of films (high-rental customers).
* List the details of the films rented by these high-rental customers.

Write your SQL query (one query) to achieve the above objectives.

**Solution:**

```sql
-- Create a CTE to calculate the total rental count and total rental amount for each customer.
WITH customer_totals AS
(
	SELECT c.customer_id, c.first_name, c.last_name, SUM(p.amount) AS total_spent, COUNT(r.rental_id) AS number_of_rentals
	FROM customer c
	JOIN payment p ON c.customer_id = p.customer_id
	JOIN rental r ON p.rental_id = r.rental_id
	GROUP BY c.customer_id, c.first_name, c.last_name
),

-- Create a CTE to calculate the average rental count across all customers.
average_rental_count AS
(
	SELECT AVG(number_of_rentals) AS arc 
	FROM customer_totals
),

-- Create a CTE to identify customers who have rented more than the average number of films (high-rental customers).
high_freq_customers AS
(
	SELECT ct.customer_id, ct.first_name, ct.last_name, ct.total_spent, ct.number_of_rentals
	FROM customer_totals ct
	WHERE ct.number_of_rentals > (SELECT arc FROM average_rental_count)
)

-- List the details of the films rented by these high-rental customers.
SELECT 
hfc.customer_id,
hfc.first_name,
hfc.last_name,
hfc.number_of_rentals,
hfc.total_spent,
f.film_id,
f.title
FROM high_freq_customers hfc
JOIN rental r ON hfc.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
```

### Recursive CTEs - Concept
* Used with _Hierarchical Data_ (Data organised in a tree-like structure with parent-child relationship)

_Example 1:_
```sql
WITH RECURSIVE count_cte AS
(
-- Step 1: Define recursive CTE
	-- Anchor member: Start with 1
	SELECT 1 AS number

	UNION ALL -- join Anchor member and Recursive memeber

	-- Recursive member: Increment the number from 1 through 10
	SELECT number + 1
	FROM count_cte
	WHERE number < 5 -- Termination condition
)

-- Step 2: Select all numbers from the recurvice CTE
SELECT number from count_cte
```
_Output:_

| number  |
|:-------:|
|    1    |
|    2    |
|    3    |
|    4    |
|    5    |

_Example 2:_
```sql
WITH RECURSIVE count_cte AS
(
-- Step 1: Define recursive CTE
	-- Anchor member: Start with 1
	SELECT 1 AS number

	UNION ALL -- join Anchor member and Recursive memeber

	-- Recursive member: Increment the number from 1 through 10
	SELECT number * 2
	FROM count_cte
	WHERE number < 200 -- Termination condition
)

-- Step 2: Select all numbers from the recurvice CTE
SELECT number from count_cte
```
_Output:_

|number |
|:-------:|
|1      |
|2      |
|4      |
|8      |
|16     |
|32     |
|64     |
|128    |
|256    |


### Recursive CTEs - Hierarchical Data
#### Syntax
```sql
-- Goal: Identify & list all subcategories of a specified category within a hierarchy

WITH RECURSIVE cte_name AS
(
	-- Anchor member
	SELECT columns
	FROM table
	WHERE condition

	UNION ALL

	-- Recursive member
	SELECT colulms
	FROM table
	JOIN cte_name ON condition
)
SELECT columns
FROM cte_name;
```

#### Example
```sql
-- Creating a new hierarchical category table
-- Step 1: Create the new table

CREATE TABLE hierarchical_category (
    category_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL, 
    parent_category_id INTEGER REFERENCES hierarchical_category(category_id)
);

-- Step 2: Insert sample data to establish hierarhical relationships
INSERT INTO hierarchical_category (category_id, name, parent_category_id)
VALUES
(1, 'Action', NULL),
(2, 'Animation', NULL),
(3, 'Children', 2), -- Subcategory of Animation
(4, 'Classics', 1), -- Subcategory of Action
(5, 'Comedy', 1), -- Subcategory of Action
(6, 'Superhero', 4), -- Subcategory of Classics
(7, 'Slapstick', 5), -- Subcategory of Comedy
(8, 'Documentary', NULL), 
(9, 'Nature', 8), -- Subcategory of Documentary
(10, 'Space', 9), -- Subcategory of Nature
(11, 'Astronomy', 10); -- Subcategory of Space

-- Step 3: Query new category table
SELECT * FROM hierarchical_category

-- Using a Recursive CTE with the new hierarchical category table
WITH RECURSIVE category_hierarchy AS (
	-- Anchor member: Select the given category
	SELECT c.category_id, c.name, c.parent_category_id
	FROM hierarchical_category c
	WHERE c.category_id = 1

	UNION ALL

	-- Recursive Member: Select subcategories of the current set of categories
	SELECT c.category_id, c.name, c.parent_category_id
	FROM hierarchical_category c
	INNER JOIN category_hierarchy ch ON c.parent_category_id = ch.category_id
)

-- Select all subcategories from the recursive CTE
SELECT * FROM category_hierarchy
```

### Recursive CTEs - Termination Condition

```sql
-- Using a Recursive CTE with the new hierarchical category table
WITH RECURSIVE category_hierarchy AS (
	-- Anchor member: Select the given category
	SELECT c.category_id, c.name, c.parent_category_id, 1 AS depth
	FROM hierarchical_category c
	WHERE c.category_id = 1

	UNION ALL

	-- Recursive Member: Select subcategories of the current set of categories
	SELECT c.category_id, c.name, c.parent_category_id, ch.depth + 1 AS depth
	FROM hierarchical_category c
	INNER JOIN category_hierarchy ch ON c.parent_category_id = ch.category_id
	WHERE ch.depth < 2 -- Limit recursion depth to 2 levels
)

-- Select all subcategories from the recursive CTE
SELECT * FROM category_hierarchy
```

### Challenge 3: Recursive CTE
**Objective:** Create an employee hierarchy table and use a recursive CTE to find all subordinates of a given employee.
**Context:** In a company, employees are managed in a hierarchical structure where each employee may have a manager. We need to find all subordinates of a particular manager, regardless of how many levels down they are in the hierarchy.

**Setup:**
1. Step 1: Create the employee table with hierarchical relationships.

```sql
-- Create the employee table
CREATE TABLE IF NOT EXISTS employee (
employee_id INTEGER PRIMARY KEY,
name TEXT NOT NULL,
manager_id INTEGER REFERENCES employee(employee_id)
);

-- Insert sample data to establish an employee hierarchy
INSERT INTO employee (employee_id, name, manager_id) VALUES
(1, 'Alice', NULL),       -- Alice is the CEO, no manager
(2, 'Bob', 1),            -- Bob reports to Alice
(3, 'Charlie', 1),        -- Charlie reports to Alice
(4, 'David', 2),          -- David reports to Bob
(5, 'Eve', 2),            -- Eve reports to Bob
(6, 'Frank', 3);          -- Frank reports to Charlie

```
**Challenge:**
1. Use a recursive CTE to find all subordinates of a given employee.

Write your SQL query to achieve the above objectives.

**Solution:**
```sql
-- Using a Recursive CTE with the new hierarchical category table
WITH RECURSIVE employee_hierarchy AS (
	-- Anchor member: Select the given employee
	SELECT e.employee_id, e.name, e.manager_id, 1 AS level
	FROM employee e
	WHERE e.employee_id = 1

	UNION ALL

	-- Recursive Member: Select subordinates of the current employee
	SELECT e.employee_id, e.name, e.manager_id, eh.level + 1 AS level
	FROM employee e
	INNER JOIN employee_hierarchy eh ON e.manager_id = eh.employee_id
	WHERE eh.level < 5 -- Limit recursion depth to 2 levels
)

-- Select all employees and direct reports from the recursive CTE
SELECT * FROM employee_hierarchy
```