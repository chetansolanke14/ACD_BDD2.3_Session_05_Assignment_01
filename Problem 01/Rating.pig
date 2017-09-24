employee_details = LOAD '/home/acadgild/pig/employee_details.txt' USING PigStorage(',') AS (employee_id:int,employee_name:chararray,employee_salary:int,employee_rating:int);
employee_name_sort= ORDER employee_details by employee_name asc;
highest_rating= ORDER employee_name_sort by employee_rating desc;
employees= FOREACH highest_rating GENERATE employee_id,employee_name;
limit_rating= LIMIT employees 5;
DUMP limit_rating;
