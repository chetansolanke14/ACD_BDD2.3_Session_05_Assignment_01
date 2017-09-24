employee_details = LOAD '/home/acadgild/pig/employee_details.txt' USING PigStorage(',') AS (employee_id:int,employee_name:chararray,employee_salary:int,employee_rating:int);
employee_name_sort= ORDER employee_details by employee_name asc;
employee_odd= FILTER employee_name_sort BY ($0%2!=0);
employee_salary= ORDER employee_odd BY employee_salary desc;
employees= FOREACH employee_salary GENERATE employee_id,employee_name;
limit_salary= LIMIT employees 3;
DUMP limit_salary;

