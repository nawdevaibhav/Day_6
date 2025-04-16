SELECT * FROM day6.coffee_sales;

SELECT 
  date,
  SUM(money) AS daily_sales
FROM coffee_sales
GROUP BY date
ORDER BY date;

SELECT 
  DATE_FORMAT(date, '%Y-%m') AS month,
  SUM(money) AS total_monthly_sales
FROM coffee_sales
GROUP BY month
ORDER BY month;


SELECT 
  coffee_name,
  COUNT(*) AS orders
FROM coffee_sales
GROUP BY coffee_name
ORDER BY orders DESC
LIMIT 5;

SELECT 
  cash_type,
  COUNT(*) AS transaction_count,
  SUM(money) AS total_sales
FROM coffee_sales
GROUP BY cash_type;


SELECT 
  coffee_name,
  ROUND(AVG(money), 2) AS avg_transaction
FROM coffee_sales
GROUP BY coffee_name
ORDER BY avg_transaction DESC;


SELECT 
  card,
  SUM(money) AS revenue
FROM coffee_sales
WHERE cash_type = 'Card'
GROUP BY card
ORDER BY revenue DESC;


SELECT 
  date,
  COUNT(*) AS total_transactions
FROM coffee_sales
GROUP BY date
ORDER BY date;


