--INTRO TO SQL, SELECT ALL FROM actor table
SELECT * 
FROM actor;

--Qyery for the first name and last NAME
SELECT first_name, last_name;
FROM actor;

--Be more specific.. look for a first name which equal "Nick"
--using the WHERE clause
SELECT first_name, last_name
FROM actor
WHERE first_name = 'Nick';

--Query being specific again using the "LIKE" clause

SELECT last_name
FROM actor
WHERE first_name LIKE 'Nick';


--USE LIKE CLASS AND WILD CARD ( % )
--get all J names
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'J%';

--SINGLE CHARACTER WILD CARD ( _ )
SELECT first_name, actor_id
FROM actor
WHERE first_name LIKE 'K___';

--Query for all first names that start with K has 2 letter, then anything goes
SELECT first_name
FROM actor
WHERE first_name LIKE 'K__%';

--COMPARING OPERATORS
-- > Greater Than
-- < Less Than
-- >= <=
--THIS IS DIFFERENT: NOT EQUAL TO

SELECT *
FROM payment;

--QUERY WHERE AMOUNTS PAID GREATER THAN $10
SELECT customer_id, amount
FROM payment
WHERE amount > 10;

--QUERY FOR PAYMENTS BETWEEN $10-15
SELECT customer_id, amount
FROM payment
WHERE amount BETWEEN 10 AND 15;

-- LETS order the payments by amount
--ASC FOR ASCENDING (DEFAULT)
--DESC FROM DESCENDING
SELECT customer_id, amount, payment_date
FROM payment
WHERE amount > 10
ORDER BY amount DESC;

-- LETS order the payments by date
SELECT customer_id, amount, payment_date
FROM payment
WHERE amount > 10
ORDER By payment_date DESC;

--QUERY ALL PAYMENTS NOT EQUAL TO 10.99
SELECT customer_id, amount
FROM payment
WHERE amount <> 10.99
ORDER BY amount DESC;

--SQU AGGREGATIONS => SUM(), AVG(), COUNT(), MIN(), MAX()

--Query to display the sume of amount greater thant 5.99
SELECT SUM(amount)
FROM payment
WHERE amount >= 5.99;

--Query to display the average of the amount payed great or equal to 5.99
SELECT AVG(amount)
FROM payment
WHERE amount >= 5.99;

--Count up how many amounts paid over or equal to 5.99
SELECT COUNT(amount)
FROM payment
WHERE amount >= 5.99;

--Query to display the count of DISTINCT amounts paid
SELECT COUNT(DISTINCT amount)
FROM payment
WHERE amount>= 5.99;

--Query the min amount paid
SELECT MIN(amount) AS min_amount_paid_greater_than_zero
FROM payment
WHERE amount >=0;

--Query the max amount paid
SELECT MAX(amount) AS most_money_paid
FROM payment;

-- GROUP BY DEMOSTRATION (this works with aggregators )
SELECT amount
FROM payment
WHERE amount = 7.99

SELECT customer_id
FROM payment

SELECT customer_id, COUNT(amount)
FROM payment
WHERE amount = 7.99
GROUP BY customer_id;

SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC
LIMIT 10
OFFSET 1;

-- add more specificity to the Aggregated result
-- HAVING Clause

SELECT customer_id, SUM(amount)
FROM payment
WHERE customer_id > 60
GROUP BY customer_id
HAVING SUM(amount) < 1000
ORDER BY SUM(amount) DESC
LIMIT 10;

-- Query to display the customer_id that shows up more than 1 time
SELECT * FROM customer;

SELECT COUNT(customer_id), email
FROM customer
WHERE email LIKE 'j__.w%'
GROUP BY email
HAVING COUNT(customer_id) > 0;