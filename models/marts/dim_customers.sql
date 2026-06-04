WITH customers AS (

    SELECT *
    FROM {{ ref('stg_customers') }}

)

SELECT
    customer_unique_id,
    MIN(city) AS city,
    MIN(state) AS state,
    COUNT(customer_id) AS total_orders
FROM customers
GROUP BY customer_unique_id