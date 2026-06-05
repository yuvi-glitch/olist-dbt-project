WITH products AS (
    SELECT * FROM {{ ref('stg_products') }}
),
translations AS (
    SELECT * FROM {{ ref('stg_prod_cat_name_transl') }}
)

SELECT
    p.product_id,
    COALESCE(t.c2, p.product_category_name) AS product_category_english,
    p.product_category_name,
    p.product_weight_g,
    p.product_length_cm,
    p.product_height_cm,
    p.product_width_cm
FROM products p
LEFT JOIN translations t ON p.product_category_name = t.c1