select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      select count(*) count, company_name, contact_name FROM
"northwind"."dbt_landradeesilva"."customers"
group by company_name, contact_name
having count > 1
      
    ) dbt_internal_test