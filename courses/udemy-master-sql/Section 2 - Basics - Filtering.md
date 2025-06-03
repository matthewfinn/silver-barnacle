# Section 2: Basics - Filtering
## WHERE
* Used to FILTER the data in the output
* Always after ``FROM``

### Syntax
```sql
SELECT
column_name1,
column_name2
FROM table_name
WHERE condition
```

### Examples
```sql
SELECT
*
FROM payment
WHERE amount = 10.99
```

```sql
SELECT
first_name,
last_name
FROM customer
WHERE first_name = 'ADAM'
```

```sql
SELECT count(* )
FROM payment
WHERE AMOUNT = 0
```

### Coding Exercise 6: WHERE
Write a SQL query to find all products in the 'Electronics' ``category``. Select only the ``name`` of the product and the ``price``.
You need to use only the ``SELECT``, ``WHERE``, and ``ORDER BY`` clauses to achieve this. Sort the results by price in ascending order.

**Table and Column Names:**
* Table: ``products``
* Columns: ``product_id``, ``name``, ``category``, ``price``

```sql
SELECT
name, price
FROM products
WHERE category = 'Electronics'
ORDER BY price ASC
```

### Challenge 1 : WHERE
> How many payment were made by the customer with customer_id = 100?

**Solution**
```sql
SELECT count(*) AS NumberOfPayments
FROM payment
WHERE customer_id = 100
```

### Challenge 2 : WHERE
> What is the last name of our customer with first name 'ERICA'?

**Solution**
```sql
SELECT last_name
FROM customer
WHERE first_name = 'ERICA'
```

## WHERE Operators
### Examples

**Greater Than**
```sql 
SELECT
*
FROM payment
WHERE amount > 10.99
```

**Less Than**
```sql 
SELECT
*
FROM payment
WHERE amount < 10.99
```

**Less Than or Equals - Ordered**
```sql 
SELECT
*
FROM payment
WHERE amount <= 10.99
ORDER BY amount DESC
```

**Not Equal To**
```sql 
SELECT
*
FROM payment
WHERE amount != 10.99
```

**Not Equal To - Alternative**
```sql 
SELECT
*
FROM payment
WHERE amount <> 10.99
```

**Is NULL**
```sql 
SELECT
first_name,
last_name
FROM customer
WHERE first_name is null
```

**Is Not NULL**
```sql 
SELECT
first_name,
last_name
FROM customer
WHERE first_name is not null
```

**Equality**
String matching is case sensitive i.e.
```sql 
SELECT
first_name,
last_name
FROM customer
WHERE first_name = 'adam'
```
is **NOT** the same as 
```sql 
SELECT
first_name,
last_name
FROM customer
WHERE first_name = 'ADAM'
```

### Coding Exercise 7: WHERE Operators
Write a SQL query to find all products (only select ``name`` and ``price``) that have a price of more than 200.
You need to use only the ``SELECT``, ``WHERE``, and ``ORDER BY`` clauses to achieve this. Sort the results by price in ascending order.

**Table and Column Names:**
* Table: ``products``
* Columns: ``product_id``, ``name``, ``category``, ``price``

```sql
SELECT
name, price
FROM products
WHERE price > 200
ORDER BY price ASC
```

### Challenge 1: WHERE Operators
>The inventory manager asks you how rentals have not been returned yet (return_date is null).

**Solution**
```sql
SELECT 
COUNT(*)
FROM rental
WHERE return_date IS NULL
```
### Challenge 2: WHERE Operators
>The sales manager asks you how for a list of all the payment_ids with an amount less than or equal to $2. Include payment_id and the amount

**Solution**
```sql
SELECT 
payment_id, 
amount
FROM payment
WHERE amount <= 2.00
```

## WHERE with AND/OR
* Used to connect conditions

### Syntax
```sql
SELECT
column_name1,
column_name2
FROM table_name
WHERE condition1
AND condition2
AND condition3
```

### Examples
**AND**
With ``AND`` **ALL** conditions must be true
```sql
SELECT
*
FROM payment
WHERE amount = 10.99
AND customer_id = 426
```

**OR**
With ``OR`` **EITHER** conditions can be true
```sql
SELECT
*
FROM payment
WHERE amount = 10.99
OR amount = 9.99
```

**AND + OR 1**
```sql
SELECT
*
FROM payment
WHERE amount = 10.99
OR amount = 9.99
AND customer_id = 426
```
![img6.png](assets/img6.png)

**AND + OR 2**
```sql
SELECT
*
FROM payment
WHERE amount = 10.99
OR (amount = 9.99
AND customer_id = 426)
```
![img7.png](assets/img7.png)

**AND + OR 3**
```sql
SELECT
*
FROM payment
WHERE (amount = 10.99
OR amount = 9.99)
AND customer_id = 426
```
![img8.png](assets/img8.png)


### Coding Exercise 8: WHERE with AND/OR
Write a SQL query to find all products in the 'Electronics' category that have a price of more than 200.You need to use only the ``SELECT``, ``WHERE``, and ``ORDER BY`` clauses to achieve this. Sort the results by price in ascending order.

**Table and Column Names:**
* Table: ``products``
* Columns: ``product_id``, ``name``, ``category``, ``price``

```sql
SELECT
name, price
FROM products
WHERE price > 200
AND category = 'Electronics'
ORDER BY price ASC
```

### Challenge: WHERE with AND/OR
> The support manager asks you about a list of all the payment of the customer 322, 346 and 354 where the amount is either less than $2 or greater than $10.
It should be ordered by the customer first (ascending) and then as second condition order by amount in a descending order.

**Solution**
```sql
SELECT *
FROM payment
WHERE 
(customer_id = 322 OR customer_id = 346 OR customer_id = 354)
AND 
(amount > 10.00 OR amount < 2.00)
ORDER BY customer_id, amount DESC
```

## Note on Timezones
To avoid the data output looking a bit different in your case you can change the time zone of the database we have set up. To do that just open up the query tool from the greencycles database and run the following code:

``ALTER DATABASE greencycles SET timezone TO 'Europe/Berlin';``

## BETWEEN

### Coding Exercise 9: BETWEEN
