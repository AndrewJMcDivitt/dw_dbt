{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
    )
}}


select
customer_id as customer_key,
customer_id,
email,
first_name,
last_name,
phone_number,
state
FROM {{ source('oliver_landing', 'customer') }}