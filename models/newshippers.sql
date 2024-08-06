SELECT 
    sh.company_name, 
    se.shipper_email 
FROM
    {{ source('sources', 'shippers') }} sh
LEFT JOIN 
    {{ ref('shippers_emails') }} se 
ON 
    sh.shipper_id = se.shippers_id
