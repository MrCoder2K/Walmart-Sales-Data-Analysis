-- Q1: Find Different Payment Method and Number of Transactions, Number of Qty Sold
SELECT payment_method, COUNT(*) as no_payments, SUM(quantity) as no_qty_sold
FROM walmart
GROUP BY payment_method;

-- Q2: Identify the highest-rated category in each branch, displaying the branch, category and Avg Rating
SELECT *
FROM ( SELECT *,RANK() OVER (PARTITION BY branch ORDER BY avg_rating DESC) AS `rank`
FROM ( SELECT branch, category, AVG(rating) AS avg_rating
FROM walmart
GROUP BY branch, category) AS avg_table) AS ranked
WHERE `rank` = 1;

-- Q3: Identify the Busiest day for each branch based on the Number of Transactions
SELECT date, STR_STR_TO_DATE(date, '%d-%m-%Y') AS formatted_date
FROM walmart;

SELECT branch,  DATE_FORMAT(STR_STR_TO_DATE(date, '%d-%m-%Y'),'%W') AS day_name,
COUNT(*) AS no_transactions
FROM walmart
GROUP BY branch, day_name
ORDER BY branch, no_transactions DESC;

SELECT branch, DATE_FORMAT(STR_TO_DATE(date, '%d-%m-%Y'), '%W') AS day_name, 
COUNT(*) AS no_transactions,
RANK() OVER (PARTITION BY branch ORDER BY COUNT(*) DESC) AS rank
FROM walmart
GROUP BY branch, day_name

SELECT *
FROM ( SELECT *, RANK() OVER (PARTITION BY branch ORDER BY no_transactions DESC) AS `rank`
FROM ( SELECT branch, DATE_FORMAT(STR_TO_DATE(date, '%d-%m-%Y'), '%W') AS day_name, COUNT(*) AS no_transactions
FROM walmart
GROUP BY branch, day_name) AS counted_data) AS ranked_data
WHERE `rank` = 1;

-- Q4: Calculate the Total Quantity of Items Sold Per Payment Method. List Payment Method and Total Quantity
SELECT payment_method, SUM(quantity) as no_qty_sold
FROM walmart
GROUP BY payment_method;

-- Q5: Determine the Average, Minimum, and Maximum Rating of Category for each City. List the City, Average Rating, Min Rating, and Max Rating.
SELECT city, category, MIN(rating) AS min_rating, MAX(rating) AS max_rating, AVG(rating) AS avg_rating
FROM walmart
GROUP BY city, category;

-- Q6: Calculate the Total Profit for each Category by considering Total Profit as  (unit_price * quantity * profit_margin).List Category and Total Profit, Ordered from Highest to Lowest Profit.
SELECT category, SUM(total) as total_revenue, SUM(total * profit_margin) as profit
FROM walmart
GROUP BY category;

SELECT category, SUM(unit_price * quantity * profit_margin) AS total_profit
FROM walmart
GROUP BY category
ORDER BY total_profit DESC;

-- Q7: Determine the most common payment method for each branch. Display the Branch and Preferred Paymeny Method
SELECT branch, payment_method, COUNT(*) AS total_trans,
RANK() OVER(PARTITION BY branch ORDER BY COUNT(*) DESC) AS `rank`
FROM walmart
GROUP BY branch, payment_method;

WITH cpm AS (
SELECT branch, payment_method, COUNT(*) AS total_trans,
RANK() OVER(PARTITION BY branch ORDER BY COUNT(*) DESC) AS `rank`
FROM walmart
GROUP BY branch, payment_method)
SELECT branch, payment_method AS preferred_payment_method
FROM cpm
WHERE `rank` = 1;

-- Q8: Categorize Sales into Morning, Afternoon, and Evening Shifts.Find Out Each of the Shift and Number of Invoices
SELECT TIME(time) FROM walmart;

SELECT branch,
CASE 
WHEN HOUR(TIME(time)) < 12 THEN 'Morning'
WHEN HOUR(TIME(time)) BETWEEN 12 AND 17 THEN 'Afternoon'
ELSE 'Evening'
END AS shift,
COUNT(*) AS num_invoices
FROM walmart
GROUP BY branch, shift
ORDER BY branch, num_invoices DESC;

-- Q9: Identify the 5 Branches with the Highest Revenue Decrease ratio from Last year to Current year (e.g., 2022 to 2023)

SELECT branch, SUM(total) AS revenue
FROM walmart
WHERE YEAR(STR_TO_DATE(date, '%d-%m-%Y')) = 2022
GROUP BY branch;

SELECT branch, SUM(total) AS revenue
FROM walmart
WHERE YEAR(STR_TO_DATE(date, '%d-%m-%Y')) = 2023
GROUP BY branch;

WITH revenue_2022 AS (
SELECT branch, SUM(total) AS revenue 
FROM walmart
WHERE YEAR(STR_TO_DATE(date, '%d-%m-%Y')) = 2022
GROUP BY branch),
revenue_2023 AS (
SELECT branch, SUM(total) AS revenue
FROM walmart
WHERE YEAR(STR_TO_DATE(date, '%d-%m-%Y')) = 2023
GROUP BY branch)
SELECT r2022.branch, r2022.revenue AS last_year_revenue, r2023.revenue AS current_year_revenue,
ROUND(((r2022.revenue - r2023.revenue) / r2022.revenue) * 100, 2) AS revenue_decrease_ratio
FROM revenue_2022 AS r2022
JOIN revenue_2023 AS r2023 ON r2022.branch = r2023.branch
WHERE r2022.revenue > r2023.revenue
ORDER BY revenue_decrease_ratio DESC
LIMIT 5;