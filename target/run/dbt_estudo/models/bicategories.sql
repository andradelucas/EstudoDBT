
  
    

  create  table
    "northwind"."dbt_landradeesilva"."bicategories__dbt_tmp"
    
    
    
  as (
    SELECT * FROM "northwind"."dbt_landradeesilva"."joins"
where category_name = 'Seafood'
  );
  