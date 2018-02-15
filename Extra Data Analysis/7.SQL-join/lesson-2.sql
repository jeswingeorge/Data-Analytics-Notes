## JOIN
/* QUIZ qtns JOIN 2 tables

1. Try pulling all the data from the accounts table, and all the data from the
orders table.

2. Try pulling standard_qty, gloss_qty, and poster_qty from the orders table, and
the website and the primary_poc from the accounts table.
*/

SELECT accounts.*, orders.*
FROM accounts
JOIN orders
ON accounts.id = orders.account_id;

SELECT orders.standard_qty, orders.gloss_qty, orders.poster_qty, accounts.website, accounts.primary_poc
FROM accounts
JOIN orders
ON accounts.id = orders.account_id;

-------------------------------------------------------------------------------

/* JOIN 3 tables*/
SELECT *
FROM web_events
JOIN accounts
ON web_events.account_id = accounts.id
JOIN orders
ON accounts.id = orders.account_id

------------------------------------------------------------------------------
------------------------------------------------------------------------------

/*  JOIN Questions

1. Provide a table for all web_events associated with account name of Walmart.
There should be three columns. Be sure to include the primary_poc, time of the
event, and the channel for each event. Additionally, you might choose to add a
fourth column to assure only Walmart events were chosen.

2. Provide a table that provides the region for each sales_rep along with their
 associated accounts. Your final table should include three columns: the region
  name, the sales rep name, and the account name. Sort the accounts alphabetically
   (A-Z) according to account name.

3. Provide the name for each region for every order, as well as the account
name and the unit price they paid (total_amt_usd/total) for the order. Your
final table should have 3 columns: region name, account name, and unit price. A
 few accounts have 0 for total, so I divided by (total + 0.01) to assure not
 dividing by zero.

*/

SELECT a.primary_poc, w.occurred_at, w.channel, a.name
FROM accounts a
JOIN web_events w
ON a.id = w.account_id;
/* WRONG ANSWER */

SELECT r.name, s.name, a.name
FROM region r
JOIN sales_reps s
ON s.region_id = r.id
JOIN accounts a
ON s.id = a.sales_rep_id;
ORDER BY a.name;
/*BUT THIS GAVE ONLY SINGLE COLUMN ONLY THE a.name*/
/*But maybe not got answer since not given column names */

/*Had trouble doing the 3rd one as there were no matiching columns or PK=FK*/

------------------------------------------------------------------------------
/*Udacity solutions*/

SELECT a.primary_poc, w.occurred_at, w.channel, a.name
FROM web_events w
JOIN accounts a
ON w.account_id = a.id
WHERE a.name = 'Walmart';

SELECT r.name region, s.name rep, a.name account
FROM sales_reps s
JOIN region r
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
ORDER BY a.name;

SELECT r.name region, a.name account,
       o.total_amt_usd/(o.total + 0.01) unit_price
FROM region r
JOIN sales_reps s
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
JOIN orders o
ON o.account_id = a.id;

----------------------------------------------------------------------------
----------------------------------------------------------------------------
/*
Questions
1. Provide a table that provides the region for each sales_rep along with their
associated accounts. This time only for the Midwest region. Your final table
should include three columns: the region name, the sales rep name, and the
account name. Sort the accounts alphabetically (A-Z) according to account name.

2. Provide a table that provides the region for each sales_rep along with their
associated accounts. This time only for accounts where the sales rep has a first
 name starting with S and in the Midwest region. Your final table should include
  three columns: the region name, the sales rep name, and the account name. Sort
   the accounts alphabetically (A-Z) according to account name.

3. Provide a table that provides the region for each sales_rep along with their
associated accounts. This time only for accounts where the sales rep has a last
name starting with K and in the Midwest region. Your final table should include
three columns: the region name, the sales rep name, and the account name. Sort
the accounts alphabetically (A-Z) according to account name.

4. Provide the name for each region for every order, as well as the account name
and the unit price they paid (total_amt_usd/total) for the order. However, you
 should only provide the results if the standard order quantity exceeds 100.
 Your final table should have 3 columns: region name, account name, and unit
 price. In order to avoid a division by zero error, adding .01 to the
 denominator here is helpful total_amt_usd/(total+0.01).

5. Provide the name for each region for every order, as well as the account name
and the unit price they paid (total_amt_usd/total) for the order. However, you
should only provide the results if the standard order quantity exceeds 100 and
the poster order quantity exceeds 50. Your final table should have 3 columns:
region name, account name, and unit price. Sort for the smallest unit price
first. In order to avoid a division by zero error, adding .01 to the denominator
 here is helpful (total_amt_usd/(total+0.01).

6. Provide the name for each region for every order, as well as the account name
and the unit price they paid (total_amt_usd/total) for the order. However, you
should only provide the results if the standard order quantity exceeds 100 and
the poster order quantity exceeds 50. Your final table should have 3 columns:
region name, account name, and unit price. Sort for the largest unit price
first. In order to avoid a division by zero error, adding .01 to the denominator
here is helpful (total_amt_usd/(total+0.01).

7. What are the different channels used by account id 1001? Your final table should
 have only 2 columns: account name and the different channels.
 You can try SELECT DISTINCT to narrow down the results to only the unique values.

8. Find all the orders that occurred in 2015. Your final table should have 4 columns:
occurred_at, account name, order total, and order total_amt_usd.

*/

SELECT r.name region_name, s.name sales_rep_name, a.name account_name
FROM region r
JOIN sales_reps s
ON r.id = s.region_id
LEFT JOIN accounts a
ON s.id = a.sales_rep_id
WHERE r.name = 'Midwest'
ORDER BY a.name;
/*Do not use hyphen - in column name*/
/*WHERE region_name = 'Midwest' causes error use r.name*/

SELECT r.name region_name, s.name sales_rep_name, a.name account_name
FROM region r
JOIN sales_reps s
ON r.id = s.region_id
LEFT JOIN accounts a
ON s.id = a.sales_rep_id
WHERE r.name = 'Midwest' AND (s.name LIKE 'S%')
ORDER BY a.name;

SELECT r.name region_name, s.name sales_rep_name, a.name account_name
FROM region r
JOIN sales_reps s
ON r.id = s.region_id
LEFT JOIN accounts a
ON s.id = a.sales_rep_id
WHERE r.name = 'Midwest' AND (s.name LIKE '%K%')
ORDER BY a.name;
/*Wrong answer as some Names starting with K are also coming up in answer.*/

SELECT r.name region_name, a.name account_name, o.total_amt_usd/(o.total+0.01) unit_price
FROM region r
JOIN sales_reps s
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
JOIN orders o
ON o.account_id = a.id AND (o.standard_qty > 100);

SELECT r.name region_name, a.name account_name, o.total_amt_usd/(o.total+0.01) unit_price
FROM region r
JOIN sales_reps s
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
JOIN orders o
ON o.account_id = a.id AND (o.standard_qty > 100) AND (o.poster_qty > 50);

SELECT r.name region_name, a.name account_name, o.total_amt_usd/(o.total+0.01) unit_price
FROM region r
JOIN sales_reps s
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
JOIN orders o
ON o.account_id = a.id AND (o.standard_qty > 100) AND (o.poster_qty > 50)
ORDER BY unit_price DESC;

SELECT DISTINCT a.name, w.channel
FROM web_events w
JOIN accounts a
ON w.account_id = a.id AND a.id = 1001;

SELECT o.occurred_at, a.name, o.total, o.total_amt_usd
FROM orders o
LEFT JOIN accounts a
ON (o.account_id = a.id) AND (o.occurred_at >= '2015-01-01' );

------------------------------------------------------------------------
/*  UDACITY SOLUTIONS  */

SELECT r.name region, s.name rep, a.name account
FROM sales_reps s
JOIN region r
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
WHERE r.name = 'Midwest'
ORDER BY a.name;

SELECT r.name region, s.name rep, a.name account
FROM sales_reps s
JOIN region r
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
WHERE r.name = 'Midwest' AND s.name LIKE 'S%'
ORDER BY a.name;

SELECT r.name region, s.name rep, a.name account
FROM sales_reps s
JOIN region r
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
WHERE r.name = 'Midwest' AND s.name LIKE '% K%'
ORDER BY a.name;

SELECT r.name region, a.name account, o.total_amt_usd/(o.total + 0.01) unit_price
FROM region r
JOIN sales_reps s
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
JOIN orders o
ON o.account_id = a.id
WHERE o.standard_qty > 100;

SELECT r.name region, a.name account, o.total_amt_usd/(o.total + 0.01) unit_price
FROM region r
JOIN sales_reps s
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
JOIN orders o
ON o.account_id = a.id
WHERE o.standard_qty > 100 AND o.poster_qty > 50
ORDER BY unit_price;

SELECT r.name region, a.name account, o.total_amt_usd/(o.total + 0.01) unit_price
FROM region r
JOIN sales_reps s
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
JOIN orders o
ON o.account_id = a.id
WHERE o.standard_qty > 100 AND o.poster_qty > 50
ORDER BY unit_price DESC;

SELECT DISTINCT a.name, w.channel
FROM accounts a
RIGHT JOIN web_events w
ON a.id = w.account_id
WHERE a.id = '1001';

SELECT o.occurred_at, a.name, o.total, o.total_amt_usd
FROM accounts a
JOIN orders o
ON o.account_id = a.id
WHERE o.occurred_at BETWEEN '01-01-2015' AND '01-01-2016'
ORDER BY o.occurred_at DESC;

---------------------------------------------------------------------------
-----------------------------------------------------------------------------
