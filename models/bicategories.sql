SELECT * FROM {{ref('joins')}}
where category_name = '{{var('category')}}'