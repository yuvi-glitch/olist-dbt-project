{{config (materialized = 'view' )}}

with raw_products as (
    select * from {{ source('olist','olist_products_dataset')}}
)

select 
PRODUCT_ID,
PRODUCT_CATEGORY_NAME,
PRODUCT_NAME_LENGHT,
PRODUCT_DESCRIPTION_LENGHT,
PRODUCT_PHOTOS_QTY,
PRODUCT_WEIGHT_G,
PRODUCT_LENGTH_CM,
PRODUCT_HEIGHT_CM,
PRODUCT_WIDTH_CM
from raw_products