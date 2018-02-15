/*
Aggregation Questions

1. Find the total amount of poster_qty paper ordered in the orders table.

2. Find the total amount of standard_qty paper ordered in the orders table.

3. Find the total dollar amount of sales using the total_amt_usd in the orders table.

4. Find the total amount spent on standard_amt_usd and gloss_amt_usd paper for
each order in the orders table. This should give a dollar amount for each order
 in the table.

5. Find the standard_amt_usd per unit of standard_qty paper. Your solution should
use both an aggregation and a mathematical operator.

*/


SELECT SUM(poster_qty) SUM_POSTER_QTY
FROM orders;

SELECT SUM(standard_qty) SUM_STD_QTY
FROM orders;

SELECT SUM(total_amt_usd) total_amount
FROM orders;

SELECT SUM(standard_amt_usd) total_std_amount, SUM(gloss_amt_usd) total_gloss_amt
FROM orders;
/*WRONG ANSWER*/

SELECT SUM(o.standard_amt_usd/(o.standard_qty+0.01)) std_amnt_per_unit
FROM orders o;

----------------------------------------------------------------------
/*UDACITY SOLUTIONS*/
/*
SUM Solutions

SELECT SUM(poster_qty) AS total_poster_sales
FROM orders;

SELECT SUM(standard_qty) AS total_standard_sales
FROM orders;

SELECT SUM(total_amt_usd) AS total_dollar_sales
FROM orders;

-----------------------------------------------------------------
Notice, this solution did not use an aggregate.
SELECT standard_amt_usd + gloss_amt_usd AS total_standard_gloss
FROM orders;
----------------------------------------------------------------------------
Though the price/standard_qty paper varies from one order to the next.
I would like this ratio across all of the sales made in the orders table.
Notice, this solution used both an aggregate and our mathematical operators

SELECT SUM(standard_amt_usd)/SUM(standard_qty) AS standard_price_per_unit
FROM orders;
--------------------------------------------------------------------------------

*/
