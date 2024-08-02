WITH markup AS (
    SELECT *,
           first_value(customer_id) 
           OVER (PARTITION BY company_name, contact_name 
                 ORDER BY company_name
                 ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS result
    FROM "northwind"."public"."customers"
), 
removed AS (
    SELECT DISTINCT result 
    FROM markup
), 
final AS (
    SELECT * 
    FROM "northwind"."public"."customers" 
    WHERE customer_id IN (SELECT result FROM removed)
)

SELECT * 
FROM final