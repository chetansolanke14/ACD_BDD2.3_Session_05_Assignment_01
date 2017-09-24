employee_details = LOAD '/home/acadgild/pig/employee_details.txt' USING PigStorage(',') AS (employee_id:int,employee_name:chararray,employee_salary:int,employee_rating:int);

employee_expenses = LOAD '/home/acadgild/pig/employee_expenses.txt' USING PigStorage(' ') AS (employee_id:int,employee_expense:int);

employee_join= JOIN employee_details BY employee_id,employee_expenses BY employee_id;

employee_order = ORDER employee_join BY employee_details::employee_name desc;

employee_high = ORDER employee_order BY employee_expenses::employee_expense desc;

high_expenses= FOREACH employee_high GENERATE employee_details::employee_id,employee_details::employee_name;

maximum_expense= LIMIT high_expenses 1;

DUMP maximum_expense;
