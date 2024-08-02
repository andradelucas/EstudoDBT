WITH markup {
select *
,first_value(customer_id) 
over(partition by company_name, contact_name 
order by company_name
rows between unbounded preceding and unbounded following) as result
From {{ source('sources', 'customers') }}
}, removed {
    Select distinct result FROM markup
}

select * from removed