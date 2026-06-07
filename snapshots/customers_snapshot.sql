{% snapshot customers_snapshot %}

{{
    config(
        target_schema='snapshots',
        unique_key='customer_unique_id',
        strategy='check',
        check_cols=['customer_zip_code_prefix', 'customer_city', 'customer_state']
    )
}}

SELECT
    customer_unique_id,
    customer_zip_code_prefix,
    customer_city,
    customer_state

FROM {{ source('olist', 'olist_customers_dataset') }}

{% endsnapshot %}