with reviews as (
    select * from {{ ref('stg_order_reviews') }}
)
select 
    order_id,
    count(*) as total_reviews,
    AVG(review_score) as avg_review_score,
    MIN(review_score) as min_review_score,
    MAX(review_score) as max_review_score
    from reviews
    group by order_id
