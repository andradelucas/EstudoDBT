
  
    

  create  table
    "northwind"."dbt_landradeesilva"."order_details__dbt_tmp"
    
    
    
  as (
    WITH temp as(
SELECT
od.order_id, od.product_id, od.unit_price,od.quantity, pr.product_name, pr.supplier_id, pr.category_id
,od.unit_price * od.quantity total
,(pr.unit_price * od.quantity) - total discount
from"northwind"."public"."order_details" od
left join  "northwind"."public"."products" pr on (od.product_id = pr.product_id)
)
select * FROM temp
  );
  