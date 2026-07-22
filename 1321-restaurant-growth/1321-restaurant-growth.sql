SELECT visited_on, amount, average_amount
FROM (
    SELECT *,
           ROUND(
               AVG(dayamount) OVER (
                   ORDER BY visited_on
                   ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
               ), 2
           ) AS average_amount,
           SUM(dayamount) OVER (
               ORDER BY visited_on
               ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
           ) AS amount,
           ROW_NUMBER() OVER (ORDER BY visited_on) AS rn
    FROM (
        SELECT visited_on,
               SUM(amount) AS dayamount
        FROM Customer
        GROUP BY visited_on
    ) d
) t
WHERE rn >= 7
ORDER BY visited_on;