{{config (materialized = 'view' )}}

with raw_order_reviews as (
    select * from {{ source ( 'olist','olist_order_reviews_dataset')}}
)

select 
REVIEW_ID,
ORDER_ID,
REVIEW_SCORE,
REVIEW_COMMENT_TITLE,
REVIEW_COMMENT_MESSAGE,
REVIEW_CREATION_DATE as REVIEW_CREATION_DT,
REVIEW_ANSWER_TIMESTAMP
from raw_order_reviews