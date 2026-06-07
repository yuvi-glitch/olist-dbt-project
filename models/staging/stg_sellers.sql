{{config (materialized = 'view' )}}

with raw_sellers as (
    select * from {{source('olist','olist_sellers_dataset')}}
)

select 
SELLER_ID,
SELLER_ZIP_CODE_PREFIX,
{{ clean_string('SELLER_CITY')}} as SELLER_CITY,
SELLER_STATE
from raw_sellers