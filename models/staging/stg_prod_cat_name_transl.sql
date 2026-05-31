{{config (materialized = 'view' )}}

with raw_prod_cat_name_transl as (
    select * from {{source ('olist','product_category_name_translation')}}
 )

 select 
C1,
C2
 from raw_prod_cat_name_transl