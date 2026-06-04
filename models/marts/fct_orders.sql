{{
    config(
        materialized = 'incremental',  
        unique_key = 'order_id'     
    )
}}

WITH orders AS (
    SELECT * FROM {{ ref('int_orders_with_customers') }}
),
payments AS (
    SELECT * FROM {{ ref('stg_order_payments') }}
),
reviews AS (
    SELECT * FROM {{ ref('int_reviews_summary') }}
)

SELECT
    o.order_id,
    o.customer_id,
    o.city,
    o.state,
    o.order_status,
    o.order_purchase_timestamp,
    p.payment_value,   -- total payment value
    r.avg_review_score,   -- average review score
    DATEDIFF('day', o.order_purchase_timestamp, 
             o.order_delivered_customer_dt) AS delivery_days,
    CASE 
        WHEN o.order_delivered_customer_dt <= o.order_estimated_delivery_dt 
        THEN 'ON_time' 
        ELSE 'Delayed' 
    END AS is_on_time

FROM orders o
LEFT JOIN payments p ON o.order_id = p.order_id
LEFT JOIN reviews r ON o.order_id = r.order_id

{% if is_incremental() %}
    WHERE o.order_purchase_timestamp > (
        SELECT MAX(order_purchase_timestamp) FROM {{ this }}
    )
{% endif %}