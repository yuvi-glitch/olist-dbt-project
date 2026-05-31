{{config (materialized = 'view' )}}

with raw_order_payments as (
    select * from {{ source ('olist', 'olist_order_payments_dataset')}}
)

select 
ORDER_ID,
PAYMENT_SEQUENTIAL,
PAYMENT_TYPE,
PAYMENT_INSTALLMENTS,
PAYMENT_VALUE
from raw_order_payments