with order_items as (
    select * from {{ref('stg_order_items') }}
),
products as (
    select * from {{ref('stg_products')}}
),
sellers as (
    select * from {{ref('stg_sellers')}}
),
translations as (
    select * from {{ref('stg_prod_cat_name_transl')}}
)
select
    oi.order_id,
    oi.product_id,
    oi.seller_id,
    oi.price,
    oi.freight_value,
    p.product_category_name,
    t.c2 AS product_category_english,
    s.seller_city,
    s.seller_state
FROM order_items oi
LEFT JOIN products p ON oi.product_id = p.product_id
LEFT JOIN translations t ON p.product_category_name = t.c1
LEFT JOIN sellers s ON oi.seller_id = s.seller_id