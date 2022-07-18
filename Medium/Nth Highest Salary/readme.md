# Nth Highest Salary
![made-with-sql](https://img.shields.io/badge/Made%20with-SQL-007396.svg)
![terminal](https://img.shields.io/badge/Windows%20Terminal-4D4D4D?logo=windows%20terminal&logoColor=white)
![sublime text](https://img.shields.io/badge/sublime_text-%23575757.svg?logo=sublime-text&logoColor=important)
![vscode](https://img.shields.io/badge/Visual_Studio_Code-0078D4?logo=visual%20studio%20code&logoColor=white)

**Employee Table**
```
+-------------+------+
| Column Name | Type |
+-------------+------+
| id          | int  |
| salary      | int  |
+-------------+------+
id is the primary key column for this table.
Each row of this table contains information about the salary of an employee.
```
 
Write an SQL query to report the n<sup>th</sup> highest salary from the Employee table. If there is no n<sup>th</sup> highest salary, the query should report null.

The query result format is in the following example.

__Example 1:__
```
Input:
Employee table:
+----+--------+
| id | salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+
n = 2
Output:
+------------------------+
| getNthHighestSalary(2) |
+------------------------+
| 200                    |
+------------------------+
```

__Example 2:__
```
Input:
Employee table:
+----+--------+
| id | salary |
+----+--------+
| 1  | 100    |
+----+--------+
n = 2
Output:
+------------------------+
| getNthHighestSalary(2) |
+------------------------+
| null                   |
+------------------------+
```

### Solution
```sql
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT BEGIN
SET
    N = N -1;

RETURN (
    SELECT
        DISTINCT salary
    FROM
        employee
    ORDER BY
        salary DESC
    LIMIT
        1 OFFSET N
);

END
```