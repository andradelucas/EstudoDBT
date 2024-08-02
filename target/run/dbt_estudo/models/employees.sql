
  
    

  create  table
    "northwind"."dbt_landradeesilva"."employees__dbt_tmp"
    
    
    
  as (
    WITH calc_employees as(
SELECT
date_part(year,current_date) - date_part(year,birth_date) age
,date_part(year,current_date) - date_part(year,hire_date) lengthofservice
,first_name || ' ' || last_name, *
from"northwind"."public"."employees"
)
select * FROM calc_employees
  );
  