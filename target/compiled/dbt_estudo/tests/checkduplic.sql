select count(*) count, company_name, contact_name FROM
"northwind"."dbt_landradeesilva"."customers"
group by company_name, contact_name
having count > 1