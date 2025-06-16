[← Table of Contents](ToC.md)
# Section 11: Window Functions
Window functions in SQL calculate values across a set of table rows related to the current row, without collapsing the rows into a single output like aggregate functions. They are used for tasks like running totals, moving averages, and rankings, allowing for more granular analysis than traditional aggregate functions


## `OVER()` with `PARTITION BY`

![img52.png](assets/img52.png)
### Syntax
```sql
AGG(agg_column) OVER(PARTITION BY partition_column)
```
### Examples
**Total spend by each customer**
```sql
SELECT 
transaction_id,
payment_type,
customer_id, 
price AS price_in_transaction,
SUM(price) OVER(PARTITION BY customer_id) AS total_customer_spend
FROM sales s
```

**Number of transactions per customer**
```sql
SELECT 
transaction_id,
payment_type,
customer_id, 
price AS price_in_transaction,
COUNT(*) OVER(PARTITION BY customer_id) AS num_transactions
FROM sales s
```

**Number of transactions by payment type**
```sql
SELECT 
transaction_id,
payment_type,
customer_id, 
price AS price_in_transaction,
COUNT(*) OVER(PARTITION BY payment_type) AS num_transactions_by_type
FROM sales s
```

**Customer total spend**
```sql
SELECT *,
SUM(amount) OVER(PARTITION BY customer_id)
FROM payment
ORDER BY payment_id
```

**Number of customer payments**
```sql
SELECT *,
COUNT(*) OVER(PARTITION BY customer_id)
FROM payment
ORDER BY payment_id
```

**Partition multiple columns**
How many payments did each customer have per staff member
```sql
SELECT *,
COUNT(*) OVER(PARTITION BY customer_id, staff_id)
FROM payment
ORDER BY payment_id
```

**Count the number of records**
```sql
SELECT *,
COUNT(*) OVER()
FROM payment
ORDER BY payment_id
```

**Rounded Average**
`ROUND` function needs to encapsulate entire expression
```sql
SELECT *,
ROUND(AVG(amount) OVER(), 2)
FROM payment
ORDER BY payment_id
```
### Challenge 1: `OVER()` with `PARTITION BY`
Write a query that returns the list of movies including
- `film_id`,
- `title`,
- `length`,
- `category`,
- average length of movies in that category.

Order the results by `film_id`.

**Solution:**
```sql
SELECT
f.film_id,
title, 
length, 
name as category,
ROUND(AVG(length) OVER(PARTITION BY name), 2) AS avg_length_in_category
FROM film f
INNER JOIN film_category fc 
ON f.film_id = fc.film_id
INNER JOIN category c 
ON fc.category_id = c.category_id
ORDER BY f.film_id
```

### Challenge 2: `OVER()` with `PARTITION BY`
Write a query that returns all payment details including
- the number of payments that were made by this customer for that amount

Order the results by `payment_id`

**Solution:**
```sql
SELECT 
*,
COUNT(*) OVER(PARTITION BY amount, customer_id)
FROM payment
```

## `OVER()` with `ORDER BY`
### Examples
**Running Total of amount ordered by `payment_date`**
```sql
SELECT 
*,
SUM(amount) OVER(ORDER BY payment_date) AS running_total
FROM payment
```

**Running Total of amount ordered by `payment_id`**
```sql
SELECT 
*,
SUM(amount) OVER(ORDER BY payment_id) AS running_total
FROM payment
```

**Running total order by `payment_id` partitioned by `customer_id`**
```sql
SELECT 
*,
SUM(amount) 
    OVER(PARTITION BY customer_id 
        ORDER BY payment_id) AS running_total
FROM payment
```

**Running total order by `payment_date` & `payment_id` partitioned by `customer_id`**
```sql
SELECT 
*,
SUM(amount) 
    OVER(PARTITION BY customer_id 
        ORDER BY payment_date, payment_id) AS running_total
FROM payment
```

### Challenge: `OVER()` with `ORDER BY`
Using `demo` database!
1. Write a query that returns the running total of how late the flights are
(difference between `actual_arrival` and `scheduled_arrival`) ordered by `flight_id` including the departure airport.

2. As a second query, calculate the same running total but partition also by the departure airport.

**Solution 1:**
```sql
SELECT
flight_id, 
departure_airport,
SUM(actual_arrival - scheduled_arrival) 
OVER(ORDER BY flight_id) 
FROM flights
```

**Solution 2:**
```sql
SELECT
flight_id, 
departure_airport,
SUM(actual_arrival - scheduled_arrival) 
OVER(PARTITION BY departure_airport 
    ORDER BY flight_id) 
FROM flights
```

## `RANK()`
Ordering depends on number of records
i.e. if there are 10 records with equal length at rank 1 the next rank will be 11

| title              | category  | length | rank |
|--------------------|-----------|--------|------|
| HOME PITY          | Music     | 185    | 1    |
| MUSCLE BRIGHT      | Travel    | 185    | 1    |
| DARN FORRESTER     | Action    | 185    | 1    |
| SWEET BROTHERHOOD  | Travel    | 185    | 1    |
| WORST BANGER       | Action    | 185    | 1    |
| SOLDIERS EVOLUTION | Sci-Fi    | 185    | 1    |
| CONTROL ANTHEM     | Comedy    | 185    | 1    |
| GANGS PRIDE        | Animation | 185    | 1    |
| CHICAGO NORTH      | Games     | 185    | 1    |
| POND SEATTLE       | Animation | 185    | 1    |
| SMOOCHY CONTROL    | Sports    | 184    | 11   |
| SONS INTERVIEW     | Animation | 184    | 11   |
| MOONWALKER FOOL    | Games     | 184    | 11   |
| CRYSTAL BREAKING   | Foreign   | 184    | 11   |


### Examples
**Rank be length DESC**
```sql
SELECT
f.title, 
c.name as category,
f.length, 
RANK() OVER(ORDER BY length DESC)
FROM film f
INNER JOIN film_category fc ON f.film_id = fc.film_id
INNER JOIN category c ON fc.category_id = c.category_id
```
**Rank be length ASC**
```sql
SELECT
f.title, 
c.name as category,
f.length, 
RANK() OVER(ORDER BY length)
FROM film f
INNER JOIN film_category fc ON f.film_id = fc.film_id
INNER JOIN category c ON fc.category_id = c.category_id
```

**DENSE_RANK() order sequentially i.e. 1,2,3....**
```sql
SELECT
f.title, 
c.name as category,
f.length, 
DENSE_RANK() OVER(ORDER BY length DESC)
FROM film f
INNER JOIN film_category fc ON f.film_id = fc.film_id
INNER JOIN category c ON fc.category_id = c.category_id
```
Output:
|title             |category |length|dense_rank|
|------------------|---------|------|----------|
|HOME PITY         |Music    |185   |1         |
|MUSCLE BRIGHT     |Travel   |185   |1         |
|DARN FORRESTER    |Action   |185   |1         |
|SWEET BROTHERHOOD |Travel   |185   |1         |
|WORST BANGER      |Action   |185   |1         |
|SOLDIERS EVOLUTION|Sci-Fi   |185   |1         |
|CONTROL ANTHEM    |Comedy   |185   |1         |
|GANGS PRIDE       |Animation|185   |1         |
|CHICAGO NORTH     |Games    |185   |1         |
|POND SEATTLE      |Animation|185   |1         |
|SMOOCHY CONTROL   |Sports   |184   |2         |
|SONS INTERVIEW    |Animation|184   |2         |
|MOONWALKER FOOL   |Games    |184   |2         |

**DENSE_RANK() with partitioning by category**
```sql
SELECT
f.title, 
c.name as category,
f.length, 
DENSE_RANK() OVER(PARTITION BY name ORDER BY length DESC)
FROM film f
INNER JOIN film_category fc ON f.film_id = fc.film_id
INNER JOIN category c ON fc.category_id = c.category_id
```

**Filtering requires a subquery - window functions can't be used in a standard `WHERE` clause**
```sql
SELECT * FROM (
    SELECT
    f.title, 
    c.name as category,
    f.length, 
    DENSE_RANK() OVER(PARTITION BY name ORDER BY length DESC) AS rank
    FROM film f
    INNER JOIN film_category fc ON f.film_id = fc.film_id
    INNER JOIN category c ON fc.category_id = c.category_id
    ) a
WHERE rank = 1
```

### Challenge: `RANK()`
1. Write a query that returns the customers' name, the country and how many payments they have. For that use the existing view customer_list.

2. Create a ranking of the top customers with most sales for each country. Filter the results to only the top 3 customers per country.


**Solution:**
```sql
-- Question 1:
SELECT
c.name,
c.country,
COUNT(*) AS num_payments
FROM customer_list c
LEFT JOIN payment p 
ON c.id = p.customer_id
GROUP BY name, country
ORDER BY country, COUNT(*) DESC

-- Question 2: 
SELECT * FROM (
	SELECT
	c.name,
	c.country,
	COUNT(*) AS num_payments,
	RANK() OVER(PARTITION BY country ORDER BY COUNT(*) DESC) AS rank
	FROM customer_list c
	LEFT JOIN payment p 
	ON c.id = p.customer_id
	GROUP BY name, country
) a
WHERE rank BETWEEN 1 AND 3
ORDER BY country

```

## `FIRST_VALUE()`
The FIRST_VALUE() function is a window function that returns the first value in an ordered set of values within a partition. It's used to retrieve the initial value in a dataset based on a specific order or grouping

```sql
	SELECT
	name,
	country,
	COUNT(*) AS num_payments,
	FIRST_VALUE(COUNT(*)) OVER(PARTITION BY country ORDER BY COUNT(*) ASC) AS leastFrequentCustomerInCountry,
	COUNT(*) - FIRST_VALUE(COUNT(*)) OVER(PARTITION BY country ORDER BY COUNT(*) ASC) AS difference
	FROM customer_list
	LEFT JOIN payment
	ON id = customer_id
	GROUP BY name, country
```

## `LEAD` & `LAG`

### `LEAD()`
The LEAD() function is used to get value from a row that succeeds the current row. 
```sql
SELECT
name,
country,
COUNT(*) AS num_payments,
-- Gets the next value order by the count partitioned by the country
LEAD(COUNT(*)) OVER(PARTITION BY country ORDER BY COUNT(*) ASC),
LEAD(COUNT(*)) OVER(PARTITION BY country ORDER BY COUNT(*) ASC) - COUNT(*) AS diff
FROM customer_list
LEFT JOIN payment
ON id = customer_id
GROUP BY name, country
```
Output:
|name              |country  |num_payments|lead|diff|
|------------------|---------|------------|----|----|
|VERA MCCOY        |Afghanistan|18          |    |    |
|JUDY GRAY         |Algeria  |25          |28  |3   |
|MARIO CHEATHAM    |Algeria  |28          |37  |9   |
|JUNE CARROLL      |Algeria  |37          |    |    |
|ANTHONY SCHWAB    |American Samoa|20          |    |    |
|CLAUDE HERZOG     |Angola   |25          |27  |2   |

### `LAG()`
The LAG() function is a window function used to access data from a previous row in a result set.
```sql
SELECT
name,
country,
COUNT(*) AS num_payments,
-- Gets the last value order by the count partitioned by the country
LAG(COUNT(*)) OVER(PARTITION BY country ORDER BY COUNT(*) ASC),
LAG(COUNT(*)) OVER(PARTITION BY country ORDER BY COUNT(*) ASC) - COUNT(*) AS diff
FROM customer_list
LEFT JOIN payment
ON id = customer_id
GROUP BY name, country
```
Output:
|name              |country  |num_payments|lag|diff|
|------------------|---------|------------|---|----|
|VERA MCCOY        |Afghanistan|18          |   |    |
|JUDY GRAY         |Algeria  |25          |   |    |
|MARIO CHEATHAM    |Algeria  |28          |25 |-3  |
|JUNE CARROLL      |Algeria  |37          |28 |-9  |
|ANTHONY SCHWAB    |American Samoa|20          |   |    |
|CLAUDE HERZOG     |Angola   |25          |   |    |
|MARTIN BALES      |Angola   |27          |25 |-2  |

### Challenge: `LEAD()` & `LAG()`
1. Write a query that returns the revenue of the day and the revenue of the previous day.
2. Calculate also the percentage growth compared to the previous day. 


**Solution:**
```sql
-- Question 1:
SELECT 
SUM(amount),
DATE(payment_date) as day,
LAG(SUM(amount)) 
	OVER(ORDER BY DATE(payment_date)
		) AS previous_day
FROM payment
GROUP BY DATE(payment_date)



-- Question 2:

SELECT 
SUM(amount),
DATE(payment_date) as day,
LAG(SUM(amount)) OVER(ORDER BY DATE(payment_date)) AS previous_day,
SUM(amount) - LAG(SUM(amount)) OVER(ORDER BY DATE(payment_date)) AS difference,
ROUND((SUM(amount) - LAG(SUM(amount)) OVER(ORDER BY DATE(payment_date))) 
	/ LAG(SUM(amount)) OVER(ORDER BY DATE(payment_date)) * 100 , 2) AS percentage_growth
FROM payment
GROUP BY DATE(payment_date)
```
