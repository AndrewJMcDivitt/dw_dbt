{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
    )
}}


select
employee_id as employee_key,
employee_id,
email,
first_name,
last_name,
phone_number,
position,
hire_date
FROM {{ source('oliver_landing', 'employee') }}