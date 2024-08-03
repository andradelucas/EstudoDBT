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
    LEFT JOIN prod pd ON od.product_id = pd.product_id
), Ordrs as( 
SELECT
    ord.order_date
    ,ord.order_id
    ,cs.company_name customers
    ,em.employee_name employees
    ,em.age
    ,em.lengthofservice
FROM {{source('sources','orders')}} ord
    LEFT JOIN    {{ref('customers')}} cs ON ord.customer_id = cs.customer_id
    LEFT JOIN    {{ref('employees')}} em ON ord.employee_id = em.employee_id
    LEFT JOIN    {{source('sources','shippers')}} sh ON ord.ship_via = sh.shipper_id
), finaljoin as (

    SELECT
        od.*, ord.order_date, ord.customers, ord.employees, ord.age, ord.lengthofservice
    FROM orddetai od
    inner join Ordrs ord on od.order_id = ord.order_id
)

SELECT * FROM finaljoin