WITH customers AS (
    SELECT * FROM {{ ref('stg_customers') }}  -- which model?
)

SELECT
    customer_id,   -- unique customer identifier
    city,   -- city
    state,   -- state
    COUNT(*) AS total_orders   -- how many orders per customer?
FROM customers
GROUP BY customer_id,city,state