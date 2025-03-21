{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
) }}


SELECT
    cu.customer_key,
    d.date_key,
    e.employee_key,
    p.product_key,
    s.store_key,
    ol.unit_price,
    ol.quantity,
    ol.unit_price * ol.quantity AS dollars_sold
FROM {{ source('oliver_landing', 'orderline') }} ol
INNER JOIN {{ source('oliver_landing', 'orders') }} o ON ol.order_id = o.order_id
INNER JOIN {{ ref('oliver_dim_product') }} p ON p.product_id = ol.product_id
INNER JOIN {{ ref('oliver_dim_customer') }} cu ON o.customer_id = cu.customer_id
INNER JOIN {{ ref('oliver_dim_employee') }} e ON o.employee_id = e.employee_id
INNER JOIN {{ ref('oliver_dim_date') }} d ON d.date_day = o.order_date
INNER JOIN {{ ref('oliver_dim_store') }} s ON o.store_id = s.store_id
