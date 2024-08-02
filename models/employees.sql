WITH calc_employees as{
SELECT
date_part(year,current_date) - date_part(year,bith_date) age
,date_part(year,current_date) - date_part(year,hire_date) lengthofservice
,first_name || ' ' || last_name, *
from{{'source','employees'}}
}
select * FROM calc_employees