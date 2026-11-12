SELECT
    DATE_ADD('day', -(DAY_OF_WEEK(transaction_date) % 7), transaction_date) AS week_start,
    SUM(quantity) AS total_quantity
FROM transactions
WHERE transaction_date >= DATE '2026-01-01'
  AND transaction_date <  DATE '2026-04-01'
GROUP BY 1
ORDER BY week_start;
