employee_details = LOAD '/home/acadgild/pig/employee_details.txt' USING PigStorage(',') AS (employee_id:int,employee_name:chararray,employee_salary:int,employee_rating:int);

employee_expenses = LOAD '/home/acadgild/pig/employee_expenses.txt' USING PigStorage(' ') AS (employee_id:int,employee_expense:int);

employee_join= JOIN employee_details BY employee_id LEFT outer,employee_expenses BY employee_id;

notavail= FILTER employee_join BY employee_expenses::employee_expense is NULL;

list= FOREACH notavail GENERATE employee_details::employee_id,employee_details::employee_name;

DUMP list;

