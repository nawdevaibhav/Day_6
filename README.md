# Day_6

# DATA-ANALYST-INTERN-DAY-6

# ☕ Coffee Shop Sales Analysis (SQL Project)

## 📊 Project Overview

This project focuses on analyzing transactional data from a coffee shop using SQL. The dataset contains key information on coffee purchases, payment types, timestamps, and amount spent. The goal is to derive actionable insights related to customer preferences, payment methods, peak hours, and daily trends.

---

## 🗃️ Schema Description

| Column Name  | Description                                  |
|--------------|----------------------------------------------|
| `date`       | Date of transaction (`YYYY-MM-DD`)           |
| `datetime`   | Timestamp of transaction (`YYYY-MM-DD HH:MM:SS`) |
| `cash_type`  | Payment mode: e.g., Cash, Card               |
| `card`       | Card type                                     |
| `money`      | Amount spent in the transaction              |
| `coffee_name`| Coffee purchased (e.g., Latte, Espresso)     |

---

## 🧠 Business Questions & SQL Queries

### 1. 💵 Total Sales Per Day

```sql
SELECT 
  date,
  SUM(money) AS daily_sales
FROM coffee_sales
GROUP BY date
ORDER BY date;
```

---

### 2. 📆 Total Sales by Month

```sql
SELECT 
  DATE_FORMAT(date, '%Y-%m') AS month,
  SUM(money) AS total_monthly_sales
FROM coffee_sales
GROUP BY month
ORDER BY month;
```

---

### 3. ☕ Most Popular Coffee Types

```sql
SELECT 
  coffee_name,
  COUNT(*) AS orders
FROM coffee_sales
GROUP BY coffee_name
ORDER BY orders DESC
LIMIT 5;
```

---

### 4. 💳 Payment Method Breakdown

```sql
SELECT 
  cash_type,
  COUNT(*) AS transaction_count,
  SUM(money) AS total_sales
FROM coffee_sales
GROUP BY cash_type;
```

---

### 5. 🕓 Peak Sales Hours

```sql
SELECT 
  HOUR(datetime) AS hour,
  COUNT(*) AS transactions,
  SUM(money) AS total_sales
FROM coffee_sales
GROUP BY hour
ORDER BY total_sales DESC
LIMIT 3;
```

---

### 6. 💰 Average Spend by Coffee Type

```sql
SELECT 
  coffee_name,
  ROUND(AVG(money), 2) AS avg_transaction
FROM coffee_sales
GROUP BY coffee_name
ORDER BY avg_transaction DESC;
```

---

### 7. 🔁 Repeat Coffee Orders (Same Day)

```sql
SELECT 
  date,
  coffee_name,
  COUNT(*) AS repeat_orders
FROM coffee_sales
GROUP BY date, coffee_name
HAVING repeat_orders > 1
ORDER BY repeat_orders DESC;
```

---

### 8. 💳 Total Revenue by Card Type

```sql
SELECT 
  card,
  SUM(money) AS revenue
FROM coffee_sales
WHERE cash_type = 'Card'
GROUP BY card
ORDER BY revenue DESC;
```

---

### 9. 📈 Daily Transaction Count

```sql
SELECT 
  date,
  COUNT(*) AS total_transactions
FROM coffee_sales
GROUP BY date
ORDER BY date;
```

---

### 10. 🏆 Best-Selling Coffee Each Day

```sql
SELECT 
  date,
  coffee_name,
  COUNT(*) AS coffee_orders
FROM coffee_sales
GROUP BY date, coffee_name
ORDER BY date, coffee_orders DESC;
```


```sql
SELECT *
FROM (
  SELECT 
    date,
    coffee_name,
    COUNT(*) AS coffee_orders,
    RANK() OVER (PARTITION BY date ORDER BY COUNT(*) DESC) AS rnk
  FROM coffee_sales
  GROUP BY date, coffee_name
) ranked
WHERE rnk = 1;
```

---

## 🛠 Tools Used

- **MySQL Workbench** for querying and data exploration
- **SQL** for analytics
- **Markdown** for reporting

---

---

## 📌 Summary

This SQL-based analysis helps uncover critical insights for a coffee shop, including:

- Sales trends over time
- Popular items
- Payment preferences
- High revenue hours
- Repeat customer behavior

---

## 📬 Contact

Want to visualize this in a dashboard (Excel/Power BI/Looker Studio)? Let me know, and I can help you build a live reporting tool from this dataset.
```

