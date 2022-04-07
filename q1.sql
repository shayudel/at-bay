/* building Orders table */
CREATE TABLE Orders (
    order_id INT,
    order_datetime DATE,	
    customer_id INT,
    total_amount CHAR(100), 
    number_of_products INT
);

INSERT INTO Orders (order_id, order_datetime, customer_id, total_amount, number_of_products)
VALUES (15, '2019-07-08 10:23:11', 1001, '$100', 4),
        (16, '2019-08-02 14:40:56', 1002, '$200', 9);

/* building a table that shows all the customer_ids that made an order last month */
WITH last_month_orders AS
(
    SELECT DISTINCT customer_id
    FROM Orders
    WHERE MONTH(order_datetime) = MONTH(DATE_SUB(current_date, INTERVAL 1 MONTH))
        AND YEAR(order_datetime) = YEAR(DATE_SUB(current_date, INTERVAL 1 MONTH))
)

/* using the table we built earlier, we return only the customer_ids that didn't made an order this month */
SELECT DISTINCT customer_id
FROM last_month_orders
WHERE customer_id NOT IN (SELECT DISTINCT customer_id
                        FROM Orders
                        WHERE MONTH(order_datetime) = MONTH(current_date)
                            AND YEAR(order_datetime) = YEAR(current_date))
;
  
  
  
  

