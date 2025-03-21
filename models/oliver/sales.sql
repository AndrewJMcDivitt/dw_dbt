{{ config(
materialized = 'table',
schema = 'dw_oliver'
) }}

SELECT
cu.Customer_ID,
e.Employee_ID,
d.Date_Day,
p.Product_ID,
s.Store_ID,
ol.Quantity,
ol.Unit_Price,
(ol.Quantity * ol.Unit_Price) AS Total_Sales
FROM {{ ref('fact_sales') }} ol 
JOIN {{ ref('oliver_dim_product') }} p ON ol.Product_Key = p.Product_Key
JOIN {{ ref('oliver_dim_customer') }} cu ON ol.Customer_Key = cu.Customer_ID
JOIN {{ ref('oliver_dim_employee') }} e ON ol.Employee_Key = e.Employee_ID
JOIN {{ ref('oliver_dim_date') }} d ON ol.Date_Key = d.Date_Day
JOIN {{ ref('oliver_dim_store') }} s ON ol.Store_Key = s.Store_ID