select * FROM {{ref('joins')}}
where date_part(year,order_date) = 2021