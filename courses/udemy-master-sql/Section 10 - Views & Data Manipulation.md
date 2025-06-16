[← Table of Contents](ToC.md)
# Section 10: Views & Data Manipulation

## `UPDATE`
### Syntax
```sql
UPDATE <table>
SET <column>=value
```

### Examples
**Update All**
```sql
UPDATE songs
SET genre = 'Rock'
```
**With WHERE clause**
```sql
UPDATE songs
SET genre = 'Pop'
WHERE song_id = 4
```

**Using Other Columns**
```sql
UPDATE songs
SET price = song_id + 0.99
```

**Customer example**
```sql
UPDATE customer
SET last_name = 'BROWN'
WHERE customer_id = 1
```

**Update email addresses to be lower case**
```sql
UPDATE customer
SET email = LOWER(email)
```

### Challenge: `WHERE`
Part 1: 
Update all rental prices that are 0.99 to 1.99.

Part 2:
The customer table needs to be altered as well:
1. Add the column initials (data type varchar(10))
2. Update the values to the actual initials for example Frank Smith should be F.S.

**Solution:**
```sql
--Part 1: 
UPDATE film
SET rental_rate = 1.99
WHERE rental_rate = 0.99

--Part 2-1:
ALTER TABLE customer
ADD COLUMN IF NOT EXISTS initials VARCHAR(10)

--Part 2-2:
UPDATE customer
SET initials = LEFT(first_name, 1) || '.' || LEFT(last_name,1) || '.'
```
## `DELETE`
### Syntax
```sql
DELETE FROM <table>
WHERE condition
```

### Examples
**Single record**
```sql
DELETE FROM songs
WHERE song_id=4
```
**Multiple records**
```sql
DELETE FROM songs
WHERE song_id IN (3,4)
```

**Delete all records**
```sql
DELETE FROM songs 
```

**Setting a return value**
```sql
DELETE FROM songs
WHERE song_id IN (3,4)
RETURNING song_id
```
```sql
DELETE FROM songs
WHERE song_id IN (3,4)
RETURNING *
```
```sql
DELETE FROM songs
WHERE song_id IN (3,4)
RETURNING song_id, song_name
```

### Challenge: `DELETE`
DELETE the rows in the payment table with payment_id 17064 & 17067

**Solution:**
```sql
DELETE FROM payment
WHERE payment_id IN (17064, 17067)
RETURNING *
```

## `CREATE TABLE AS`
* Problem: That table will not be updated if data in the underlying tables change!
* Physical storage is needed!
* Acts like a snapshot from the time of execution

### Syntax
```sql
CREATE TABLE <table_name>
AS query
```
### Examples
**Create a copy of a table**
```sql
CREATE TABLE customer_test
AS
SELECT * FROM customer
```

**Filtered version**
```sql
CREATE TABLE customer_anon
AS
SELECT customer_id, initials
FROM customer
WHERE first_name like 'C%'
```

**Create a table of customer addresses**
```sql
CREATE TABLE customer_address
AS
SELECT first_name, last_name, email, address, city
FROM customer c
INNER JOIN address a
ON c.address_id = a.address_id
INNER JOIN city ci
ON a.city_id = ci.city_id

```

### Challenge: `CREATE TABLE AS`
Create customer_spendings table with first_name + last_name and total amount spent

**Solution:**
```sql
CREATE TABLE customer_spendings
AS
SELECT 
c.first_name || ' ' || c.last_name AS name, 
SUM(amount) AS total_amount 
FROM payment p 
INNER JOIN customer c
ON p.customer_id = c.customer_id
GROUP BY c.customer_id, name
```

## `CREATE VIEW`
* If the query is slow the view will be slow!

### Syntax
```sql
CREATE VIEW <view_name>
AS query
```

### Examples
```sql
CREATE VIEW customer_anonymous
AS
SELECT customer_id, initials
FROM customer
WHERE first_name LIKE 'C%'
```
Then 
`SELECT * FROM customer_anonymous` as if it's a table

**Customer Spendings**
```sql
CREATE VIEW customer_spendings
AS
SELECT 
c.first_name || ' ' || c.last_name AS name, 
SUM(amount) AS total_amount 
FROM payment p 
INNER JOIN customer c
ON p.customer_id = c.customer_id
GROUP BY c.customer_id, name
```

### Challenge: `CREATE VIEW`
Create a view called `films_category` that shows a list of the film titles including their title, length and category name in descending order by their length.
Filter the results to only the movies in the category 'Action' and 'Comedy'.

**Solution:**
```sql
CREATE VIEW films_category
AS
SELECT 
title, 
length, 
name  
FROM film f
INNER JOIN film_category fc 
ON f.film_id = fc.film_id
INNER JOIN category c 
ON fc.category_id = c.category_id
WHERE name IN ('Action','Comedy')
ORDER BY length DESC
```

## `CREATE MATERIALIZED VIEW`
* Data is stored physically
* Performance ensured
* Data needs to be updated i.e. using a trigger or manually
### Syntax
```sql
CREATE MATERIALIZED VIEW <view_name>
AS query
```

```sql
REFRESH MATERIALIZED VIEW <view_name>
```

### Examples
**`mv_` prefix for practicality**
```sql
CREATE MATERIALIZED VIEW mv_films_category
AS
SELECT 
title, 
length, 
name  
FROM film f
INNER JOIN film_category fc 
ON f.film_id = fc.film_id
INNER JOIN category c 
ON fc.category_id = c.category_id
WHERE name IN ('Action','Comedy')
ORDER BY length DESC
```

**Refresh**
```sql
REFRESH MATERIALIZED VIEW mv_films_category
```

## Managing Views
* `ALTER VIEW`
* `DROP VIEW`
* `CREATE OR REPLACE VIEW`
* `ALTER MATERIALIZED VIEW`
* `DROP MATERIALIZED VIEW`

### `DROP VIEW`
```sql
DROP VIEW customer_anonymous
```

```sql
DROP MATERIALIZED VIEW customer_anonymous
```

### `ALTER VIEW`
Works exactly the same for `MATERIALIZED VIEW`
**Rename View**
```sql
ALTER VIEW customer_anonymous
RENAME TO v_customer_info
```
**Rename Column in View**
```sql
ALTER VIEW v_customer_info
RENAME COLUMN name TO customer_name
```

### `CREATE OR REPLACE VIEW`
* Used to update select statement
* Not possible with MATERIALIZED VIEW!
```sql
CREATE OR REPLACE VIEW v_customer_info
AS new_query
```
### Challenge: Managing Views

In this challenge, we use again the view `v_customer_info` that we have previously created:
```sql
CREATE VIEW v_customer_info
AS
SELECT cu.customer_id,
    cu.first_name || ' ' || cu.last_name AS name,
    a.address,
    a.postal_code,
    a.phone,
    city.city,
    country.country
     FROM customer cu
     JOIN address a ON cu.address_id = a.address_id
     JOIN city ON a.city_id = city.city_id
     JOIN country ON city.country_id = country.country_id
ORDER BY customer_id
```
**You need to perform the following tasks:**
1. Rename the view to v_customer_information. 
2. Rename the customer_id column to c_id. 
3. Add also the initial column as the last column to the view by replacing the view.

**Solution:**
```sql
-- 1. Rename the view to v_customer_information. 
ALTER VIEW v_customer_info
RENAME TO v_customer_information

-- 2. Rename the customer_id column to c_id. 
ALTER VIEW v_customer_information
RENAME COLUMN customer_id TO c_id

-- 3. Add also the initial column as the last column to the view by replacing the view.
CREATE OR REPLACE VIEW v_customer_information
AS
SELECT cu.customer_id AS c_id,
    cu.first_name || ' ' || cu.last_name AS name,
    a.address,
    a.postal_code,
    a.phone,
    city.city,
    country.country,
	LEFT(cu.first_name, 1) || '.' || LEFT(cu.last_name, 1) || '.' AS initial
     FROM customer cu
     JOIN address a ON cu.address_id = a.address_id
     JOIN city ON a.city_id = city.city_id
     JOIN country ON city.country_id = country.country_id
ORDER BY c_id
```

## Import & Export
* Import external data into an existing table
  * Table needs to be created first!
  * Data needs to be in correct format!
* Export data from a table into a CSV file

### Import Data Steps
1. Create table
```sql
CREATE TABLE sales (
transaction_id SERIAL PRIMARY KEY,
customer_id INT,
payment_type VARCHAR(20),
creditcard_no VARCHAR(20),
cost DECIMAL(5,2),
quantity INT,
price DECIMAL(5,2)) 
```
2. Get the path of the CSV File - `D:\Documents\Repositories\silver-barnacle\courses\udemy-master-sql\resources\Fact_sales.csv`
3. Right click `sales` table
4. Select "Import/Export Data..." option
5. Check Import
6. Paste file path + name into Filename field
7. Select UTF8 encoding
8. Check header box on options page
9. Select "," delimiter
10. Click OK