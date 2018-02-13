## LIMITS and ORDER BY
/*Quiz Questions
1. Write a query to return the 10 earliest orders in the orders table.
Include the id, occurred_at, and total_amt_usd.

2. Write a query to return the top 5 orders in terms of largest
total_amt_usd. Include the id, account_id, and total_amt_usd.

3. Write a query to return the bottom 20 orders in terms of least total.
Include the id, account_id, and total.

*/

SELECT id, occurred_at, total_amt_usd
FROM orders
ORDER BY occurred_at
LIMIT 10;

SELECT id, account_id, total_amt_usd
FROM orders
ORDER BY total_amt_usd DESC
LIMIT 5;

SELECT id, account_id, total
FROM orders
ORDER BY total
LIMIT 20;

/* ----------------------------------------------------------*/
/* ----------------------------------------------------------*/

## ORDER BY Part 2

/* To order results by acount and within each account we want the orders sorted
from largest to smallest, so that we can quickly see what were the largest order
 for each account.

 Ans : We can use order by over multiple columns to achieve this. And sorting
 will happen the order in which we specify the columns. Here for each account
 we will get the total_amt_usd aranged in descending order.
*/
SELECT account_id, total_amt_usd
FROM orders
ORDER BY account_id, total_amt_usd DESC

/* Try this */
/* This will arange the data in descending orsers of total_amt_usd and it
corresponding  account_id. */
SELECT account_id, total_amt_usd
FROM orders
ORDER BY total_amt_usd DESC, account_id

/* ----------------------------------------------------------*/

/*  Quiz
Questions
1. Write a query that returns the top 5 rows from orders ordered according to
 newest to oldest, but with the largest total_amt_usd for each date listed first
  for each date. You will notice each of these dates shows up as unique because
  of the time element. When you learn about truncating dates in a later lesson,
  you will better be able to tackle this question on a day, month, or yearly
  basis.

2. Write a query that returns the top 10 rows from orders ordered according to
oldest to newest, but with the smallest total_amt_usd for each date listed
first for each date. You will notice each of these dates shows up as unique
because of the time element. When you learn about truncating dates in a later
lesson, you will better be able to tackle this question on a day, month, or
 yearly basis.
 */

/*My Ans*/
SELECT *
FROM orders
ORDER BY occurred_at DESC, total_amt_usd DESC
LIMIT 5;


SELECT *
FROM orders
ORDER BY occurred_at, total_amt_usd
LIMIT 5;

/* ----------------------------------------------------------*/
/* ----------------------------------------------------------*/

## 3. WHERE

/*
Questions
Write a query that :
1. Pull the first 5 rows and all columns from the orders table that have a
dollar amount of gloss_amt_usd greater than or equal to 1000.

2. Pull the first 10 rows and all columns from the orders table that have a
total_amt_usd less than 500.
*/

SELECT *
FROM orders
WHERE gloss_amt_usd >= 1000
LIMIT 5;

SELECT *
FROM orders
WHERE total_amt_usd < 500
LIMIT 10;

/*
Practice Question Using WHERE with Non-Numeric Data

1. Filter the accounts table to include the company name, website, and the
primary point of contact (primary_poc) for Exxon Mobil in the accounts table.
*/
SELECT name, website, primary_poc
FROM accounts
WHERE name = 'Exxon Mobil';

/* ----------------------------------------------------------*/
/* ----------------------------------------------------------*/

## 4. Arithmetic operators

/*
Questions using Arithmetic Operations
Using the orders table:

1. Create a column that divides the standard_amt_usd by the standard_qty to
find the unit price for standard paper for each order. Limit the results to the
 first 10 orders, and include the id and account_id fields.

2. Write a query that finds the percentage of revenue that comes from poster
paper for each order. You will need to use only the columns that end with _usd.
 (Try to do this without using the total column). Include the id and account_id
 fields. Note - you will be thrown an error with the correct solution to this
 question. This is for a division by zero. You will learn how to get a solution
  without an error to this query when you learn about CASE statements in a
  later section. For now, you might just add some very small value to your
  denominator as a work around.

*/

SELECT id, account_id, standard_amt_usd/standard_qty AS unit_price
FROM orders
LIMIT 10;

SELECT id, account_id, ((poster_amt_usd/(poster_amt_usd + gloss_amt_usd + total_amt_usd + standard_amt_usd + 0.001))*100) AS poster_percent_rev
FROM orders;

/*
** Mentor's answer**
SELECT id, account_id,
       poster_amt_usd/(standard_amt_usd + gloss_amt_usd + poster_amt_usd) AS post_per
FROM orders;
*/

/* ----------------------------------------------------------*/
/* ----------------------------------------------------------*/

## 5. LIKE operators

/*
Questions using the LIKE operator
Use the accounts table to find

1. All the companies whose names start with 'C'.
2. All companies whose names contain the string 'one' somewhere in the name.
3. All companies whose names end with 's'.
*/

SELECT *
FROM accounts
WHERE name Like 'C%';

SELECT *
FROM accounts
WHERE name Like '%one%';

SELECT *
FROM accounts
WHERE name Like '%s';

/* ----------------------------------------------------------*/
/* ----------------------------------------------------------*/

## 6. IN operator

/*
1. Use the accounts table to find the account name, primary_poc, and
sales_rep_id for Walmart, Target, and Nordstrom.

2. Use the web_events table to find all information regarding individuals who
were contacted via the channel of organic or adwords.
*/

SELECT name, primary_poc, sales_rep_id
FROM accounts
WHERE name IN ('Walmart', 'Target', 'Nordstrom');

SELECT *
FROM web_events
WHERE channel IN ('organic', 'adwords');

/* ----------------------------------------------------------*/
/* ----------------------------------------------------------*/

## 7. NOT operator

/* Eg:  To find traffic from sites othen than google. */
SELECT *
FROM web_events_full
WHERE referrer_url NOT LIKE '%google%';

/*
We can pull all of the rows that were excluded from the queries in the previous
 two concepts with our new operator.

1. Use the accounts table to find the account name, primary poc, and sales rep id
for all stores except Walmart, Target, and Nordstrom.

2. Use the web_events table to find all information regarding individuals who were
contacted via any method except using organic or adwords methods.

 */


 SELECT name, primary_poc, sales_rep_id
 FROM accounts
 WHERE name NOT IN ('Walmart', 'Target', 'Nordstrom');

 SELECT *
 FROM web_events
 WHERE channel NOT IN ('organic', 'adwords');

 /*
 Use the accounts table to find:
 1. All the companies whose names do not start with 'C'.
 2. All companies whose names do not contain the string 'one' somewhere in the name.
 3. All companies whose names do not end with 's'.
 */

SELECT *
FROM accounts
WHERE name NOT LIKE 'C%';

SELECT *
FROM accounts
WHERE name NOT LIKE '%one%';

SELECT *
FROM accounts
WHERE name NOT LIKE '%s';


/* ----------------------------------------------------------*/
/* ----------------------------------------------------------*/

## 8. AND and BETWEEN

/*
1. Write a query that returns all the orders where the standard_qty is over 1000,
 the poster_qty is 0, and the gloss_qty is 0.

2. Using the accounts table find all the companies whose names do not start with
'C' and end with 's'.

3. Use the web_events table to find all information regarding individuals who were
 contacted via organic or adwords and started their account at any point in
 2016 sorted from newest to oldest.
*/

SELECT *
FROM orders
WHERE standard_qty > 1000 AND poster_qty = 0 AND gloss_qty = 0;

/*Observe : used = :   If we use double equal to i.e., == then it will be error
 */

SELECT name
FROM accounts
WHERE (name NOT LIKE 'C%') AND (name LIKE '%s');

/*3. My answer*/
SELECT *
FROM web_events
WHERE (channel IN ('organic', 'adwords')) AND occurred_at >= '2016-01-01'
ORDER BY occurred_at DESC;

/* You will notice that using BETWEEN is tricky for dates! While BETWEEN is
generally inclusive of endpoints, it assumes the time is at 00:00:00
(i.e. midnight) for dates. This is the reason why we set the right-side
endpoint of the period at '2017-01-01'. */

/*Udacity solution*/
SELECT *
FROM web_events
WHERE channel IN ('organic', 'adwords') AND occurred_at BETWEEN '2016-01-01' AND '2017-01-01'
ORDER BY occurred_at DESC;
/* ----------------------------------------------------------*/
/* ----------------------------------------------------------*/

## 9. OR

/*
1. Find list of orders ids where either gloss_qty or poster_qty is greater than
4000. Only include the id field in the resulting table.

2. Write a query that returns a list of orders where the standard_qty is zero and
either the gloss_qty or poster_qty is over 1000.

3. Find all the company names that start with a 'C' or 'W', and the primary contact
 contains 'ana' or 'Ana', but it doesn't contain 'eana'.
*/

SELECT id
FROM orders
WHERE gloss_qty >= 4000  OR poster_qty >= 4000;

SELECT *
FROM orders
WHERE standard_qty = 0 AND (gloss_qty > 1000 OR poster_qty > 1000);

/* 3. MY answer --- wrong
SELECT name
FROM accounts
WHERE (name LIKE 'C%' OR name LIKE 'W%')
AND (primary_poc IN ('ana','Ana')) AND (primary_poc NOT IN ('eana'));
*/

SELECT *
FROM accounts
WHERE (name LIKE 'C%' OR name LIKE 'W%')
           AND ((primary_poc LIKE '%ana%' OR primary_poc LIKE '%Ana%')
           AND primary_poc NOT LIKE '%eana%');
