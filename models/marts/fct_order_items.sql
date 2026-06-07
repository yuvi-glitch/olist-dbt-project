WITH order_items AS (
    SELECT * FROM {{ ref('int_order_items_enriched') }}
),
orders AS (
    SELECT
        order_id,
        order_status,
        order_purchase_timestamp,
        is_on_time,
        delivery_days
    FROM {{ ref('fct_orders') }}
)

SELECT
    oi.order_id,
    oi.product_id,
    oi.seller_id,
    oi.price,
    oi.freight_value,
    oi.price + oi.freight_value AS total_item_value,
    oi.product_category_english,
    oi.seller_city,
    oi.seller_state,
    o.order_status,
    o.order_purchase_timestamp,
    o.is_on_time,
    o.delivery_days
FROM order_items oi
LEFT JOIN orders o ON oi.order_id = o.order_id