WITH order_items AS (
    SELECT * FROM {{ ref('int_order_items_enriched') }}
)

SELECT
    seller_id,                        -- seller id
    seller_city,                        -- seller city
    seller_state,                        -- seller state
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(price) AS total_revenue,
    AVG(price) AS avg_price
FROM order_items
GROUP BY seller_id,seller_city,seller_state