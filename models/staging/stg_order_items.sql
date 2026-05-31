{{config (materialized = 'view' )}}

with raw_order_items as (
    select * from {{ source('olist', 'olist_order_items_dataset')}}
)

select 
ORDER_ID,
ORDER_ITEM_ID,
PRODUCT_ID,
SELLER_ID,
SHIPPING_LIMIT_DATE as SHIPPING_LIMIT_DT,
PRICE,
FREIGHT_VALUE
from raw_order_items