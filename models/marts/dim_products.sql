WITH products AS (
    SELECT * FROM {{ ref('int_order_items_enriched') }}  -- which intermediate model?
)

SELECT DISTINCT
    product_id,   -- product id
    product_category_english,   -- category in English
    seller_city,   -- seller city
    seller_state    -- seller state
FROM products