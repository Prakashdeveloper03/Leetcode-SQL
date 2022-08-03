# Exchange Seats
![made-with-sql](https://img.shields.io/badge/Made%20with-SQL-007396.svg)
![terminal](https://img.shields.io/badge/Windows%20Terminal-4D4D4D?logo=windows%20terminal&logoColor=white)
![sublime text](https://img.shields.io/badge/sublime_text-%23575757.svg?logo=sublime-text&logoColor=important)
![vscode](https://img.shields.io/badge/Visual_Studio_Code-0078D4?logo=visual%20studio%20code&logoColor=white)

**Seat Table**
```
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
+-------------+---------+
id is the primary key column for this table.
Each row of this table indicates the name and the ID of a student.
id is a continuous increment.
```

**Department Table**
```
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
+-------------+---------+
id is the primary key column for this table.
Each row of this table indicates the ID of a department and its name.
```
 
Write an SQL query to swap the seat id of every two consecutive students. If the number of students is odd, the id of the last student is not swapped.

Return the result table ordered by `id` in **ascending order**.

The query result format is in the following example.

__Example 1:__
```
Input:
Seat table:
+----+---------+
| id | student |
+----+---------+
| 1  | Abbot   |
| 2  | Doris   |
| 3  | Emerson |
| 4  | Green   |
| 5  | Jeames  |
+----+---------+
Output:
+----+---------+
| id | student |
+----+---------+
| 1  | Doris   |
| 2  | Abbot   |
| 3  | Green   |
| 4  | Emerson |
| 5  | Jeames  |
+----+---------+
Explanation:
Note that if the number of students is odd, there is no need to change the last one's seat.
```

### Solution
```sql
SELECT
    CASE
        WHEN id <> (
            SELECT
                MAX(id)
            FROM
                seat
        ) THEN CASE
            WHEN mod(id, 2) <> 0 THEN id + 1
            ELSE id - 1
        END
        WHEN id = (
            SELECT
                MAX(id)
            FROM
                seat
        ) THEN CASE
            WHEN id % 2 <> 0 THEN id
            ELSE id - 1
        END
    END AS id,
    student
FROM
    seat
ORDER BY
    id
```