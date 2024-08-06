SELECT 
    sh.company_name, 
    se.shipper_email
FROM
    "northwind"."public"."shippers" sh
LEFT JOIN 
    "northwind"."dbt_landradeesilva"."shippers_emails" se 
ON 
    sh.shipper_id = se.shippers_id 