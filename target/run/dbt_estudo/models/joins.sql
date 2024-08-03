
  
    

  create  table
    "northwind"."dbt_landradeesilva"."joins__dbt_tmp"
    
    
    
  as (
    WITH prod as (
SELECT
ct.category_name, sp.company_name suppliers, pd.product_name,
pd.unit_price, pd.product_id
FROM "northwind"."public"."products"  pd
LEFT JOIN "northwind"."public"."suppliers" sp ON pd.supplier_id = sp.supplier_id
LEFT JOIN "northwind"."public"."categories" ct ON pd.category_id = ct.category_id
), orddetai as (
    SELECT
        pd.*,od.order_id,od.quantity,od.discount
    FROM "northwind"."dbt_landradeesilva"."order_details"  od
    LEFT JOIN prod pd ON od.product_id = pd.product_id
), Ordrs as( 
SELECT
    ord.order_date
    ,ord.order_id
    ,cs.company_name customers
    ,em.employee_name employees
    ,em.age
    ,em.lengthofservice
FROM "northwind"."public"."orders" ord
    LEFT JOIN    "northwind"."dbt_landradeesilva"."customers" cs ON ord.customer_id = cs.customer_id
    LEFT JOIN    "northwind"."dbt_landradeesilva"."employees" em ON ord.employee_id = em.employee_id
    LEFT JOIN    "northwind"."public"."shippers" sh ON ord.ship_via = sh.shipper_id
), finaljoin as (

    SELECT
        od.*, ord.order_date, ord.customers, ord.employees, ord.age, ord.lengthofservice
    FROM orddetai od
    inner join Ordrs ord on od.order_id = ord.order_id
)

SELECT * FROM finaljoin
  );
  