select count(*) count, company_name, contact_name FROM
{{ref('customers')}}
group by company_name, contact_name
having count > 1