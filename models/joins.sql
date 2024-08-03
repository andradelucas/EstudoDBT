WITH prod as (
SELECT
ct.category_name, sp.company_name suppliers, pd.product_name,
pd.unit_price, pd.product_id
FROM {{source('sources','products')}}  pd
LEFT JOIN {{source('sources','suppliers')}} sp ON pd.supplier_id = sp.supplier_id
LEFT JOIN {{source('sources','categories')}} ct ON pd.category_id = ct.category_id
), orddetai as (
    SELECT
    pd.*,od.order_id,od.quantity,od.discount
    FROM {{ref('order_details')}}  od
    left join prod pd ON od.product_id = pd.product_id
)

SELECT * FROM orddetai