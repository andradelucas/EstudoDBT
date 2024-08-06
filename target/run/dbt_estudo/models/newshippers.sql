
  
    

  create  table
    "northwind"."dbt_landradeesilva"."newshippers__dbt_tmp"
    
    
    
  as (
    SELECT 
    sh.company_name, 
    se.* 
FROM
    "northwind"."public"."shippers" sh
LEFT JOIN 
    "northwind"."dbt_landradeesilva"."shippers_emails" se 
ON 
    sh.shipper_id = se.shippers_id
  );
  