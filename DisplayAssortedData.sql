SELECT developer_name AS person
FROM developers
UNION
SELECT salesperson_name AS person
FROM sales_team;
SELECT game_title
FROM digital_sales
UNION ALL
SELECT game_title
FROM physical_sales;
SELECT game_id, title
FROM games
MINUS
SELECT game_id, title
FROM sales;
SELECT s.studio_name, p.platform_name
FROM studios s
CROSS JOIN platforms p;
SELECT e1.employee_name AS employee,
       e2.employee_name AS coworker,
       e1.manager_id
FROM employees e1
JOIN employees e2
  ON e1.manager_id = e2.manager_id
 AND e1.employee_id <> e2.employee_id;
