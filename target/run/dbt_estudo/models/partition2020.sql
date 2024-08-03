
  
    

  create  table
    "northwind"."dbt_landradeesilva"."partition2020__dbt_tmp"
    
    
    
  as (
    select * FROM "northwind"."dbt_landradeesilva"."joins"
where date_part(year,order_date) = 2020
  );
  