-- 🎯 Problem Statement

-- You are given a bank transactions table with columns:

-- transaction_id | type (deposit/withdrawal) | amount | transaction_date


-- You must calculate the daily running balance for each transaction, considering that:

-- Deposits add to the balance.

-- Withdrawals subtract from the balance.

-- 🧠 Approach Explained

-- Adjust the amount sign

-- Convert withdrawals into negative values:

-- CASE WHEN type = 'withdrawal' THEN -amount ELSE amount END
  
-- Compute the cumulative (running) balance
-- Use a window function:

-- SUM(
--   CASE WHEN type='withdrawal' THEN -amount ELSE amount END
-- ) OVER (ORDER BY transaction_date) AS running_balance


-- Handle daily or monthly grouping (optional)
-- If asked per day/month, include partition:
-- OVER (PARTITION BY DATE(transaction_date))
-- or
-- OVER (PARTITION BY MONTH(transaction_date))

-- 🧩 Sample Input
-- transaction_id	type	amount	transaction_date
-- 1	deposit	100	2022-07-08 10:00:00
-- 2	withdrawal	25	2022-07-08 13:00:00
-- 3	deposit	50	2022-07-10 10:00:00
  
-- ✅ Expected Output
-- transaction_date	balance
-- 2022-07-08	75
-- 2022-07-10	125
  
  CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    transaction_type VARCHAR(20),  -- 'deposit' or 'withdrawal'
    amount DECIMAL(10,2),
    transaction_date TIMESTAMP
);

INSERT INTO transactions (transaction_id, transaction_type, amount, transaction_date)
VALUES
(1, 'deposit',     100.00, '2022-07-08 10:00:00'),
(2, 'withdrawal',   25.00, '2022-07-08 13:00:00'),
(3, 'deposit',      50.00, '2022-07-10 10:00:00'),
(4, 'withdrawal',   10.00, '2022-07-11 09:30:00'),
(5, 'deposit',      75.00, '2022-07-12 15:00:00');

SELECT distinct 
  DATE(transaction_date) AS transaction_date,
  SUM(
      CASE WHEN transaction_type = 'deposit'
           THEN amount
           ELSE -amount
      END
  ) OVER (ORDER BY DATE(transaction_date)) AS running_balance
FROM transactions
ORDER BY transaction_date;


💡 Key SQL Concepts Covered
CASE WHEN for conditional logic
Window functions (SUM OVER)
Cumulative totals / running sums
Date truncation for daily grouping
