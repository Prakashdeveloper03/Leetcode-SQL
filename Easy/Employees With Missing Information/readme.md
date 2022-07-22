# Employees With Missing Information
![made-with-sql](https://img.shields.io/badge/Made%20with-SQL-007396.svg)
![terminal](https://img.shields.io/badge/Windows%20Terminal-4D4D4D?logo=windows%20terminal&logoColor=white)
![sublime text](https://img.shields.io/badge/sublime_text-%23575757.svg?logo=sublime-text&logoColor=important)
![vscode](https://img.shields.io/badge/Visual_Studio_Code-0078D4?logo=visual%20studio%20code&logoColor=white)

**Employees Table**
```
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| employee_id | int     |
| name        | varchar |
+-------------+---------+
employee_id is the primary key for this table.
Each row of this table indicates the name of the employee whose ID is employee_id.
```

**Salaries Table**
```
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| employee_id | int     |
| salary      | int     |
+-------------+---------+
employee_id is the primary key for this table.
Each row of this table indicates the salary of the employee whose ID is employee_id.
```
 
Write an SQL query to report the IDs of all the employees **with missing information**. The information of an employee is missing if:
    - The employee's **name** is missing, or
    - The employee's **salary** is missing.

Return the result table ordered by `employee_id` **in ascending order**.

The query result format is in the following example.

__Example 1:__
```
Input:
Employees table:
+-------------+----------+
| employee_id | name     |
+-------------+----------+
| 2           | Crew     |
| 4           | Haven    |
| 5           | Kristian |
+-------------+----------+
Salaries table:
+-------------+--------+
| employee_id | salary |
+-------------+--------+
| 5           | 76071  |
| 1           | 22517  |
| 4           | 63539  |
+-------------+--------+
Output:
+-------------+
| employee_id |
+-------------+
| 1           |
| 2           |
+-------------+
Explanation:
Employees 1, 2, 4, and 5 are working at this company.
The name of employee 1 is missing.
The salary of employee 2 is missing.
```

### Solution
```sql
SELECT
    *
FROM
    (
        SELECT
            Emp.employee_id
        FROM
            Employees Emp
            LEFT JOIN Salaries Sal ON Emp.employee_id = Sal.employee_id
        WHERE
            Sal.salary IS NULL
        UNION
        SELECT
            Sal.employee_id
        FROM
            Employees Emp
            RIGHT JOIN SALARIES Sal ON Emp.employee_id = Sal.employee_id
        WHERE
            Emp.name IS NULL
    ) T
ORDER BY
    T.employee_id;
```