WITH orders AS (
    SELECT * FROM {{ ref('stg_orders') }}  -- which staging model?
),

customers AS (
    SELECT * FROM {{ ref('stg_customers') }}  -- which staging model?
)

SELECT
    o.order_id,
    o.customer_id,
    c.customer_unique_id,          -- unique customer identifier
    c.city,          -- customer city
    c.state,          -- customer state
    o.order_status,
    o.order_purchase_timestamp,
    o.order_delivered_customer_dt,
    o.order_estimated_delivery_dt

FROM orders o
LEFT JOIN customers c ON o.customer_id = c.customer_id  -- what type of join and which key?