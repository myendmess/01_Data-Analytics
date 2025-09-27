  SELECT
  employees.name AS employee_name,
  employees.role AS employee_role,
  departments.name AS department_name
FROM
  `civic-wharf-403915`.`employee_data`.`employees` AS employees
FULL OUTER JOIN
  `civic-wharf-403915`.`employee_data`.`departements` AS departments
ON employees.department_id = departments.department_id;
