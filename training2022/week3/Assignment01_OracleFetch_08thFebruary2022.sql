-- Oracle Fetch :

-- The Row Limiting Clause Returns The Top 5 EmployeeNames With The Highest Department Name Level :

SELECT
    EmployeeName , DepartmentName
FROM
    Employee
INNER JOIN Department
    USING(DepartmentNumber)
FETCH NEXT 5 ROWS ONLY;

-- The Following Query Uses The Row Limiting Clause With The WITH TIES Option :

SELECT
    EmployeeName , DepartmentName
FROM
    Employee
INNER JOIN Department
    USING(DepartmentNumber)
FETCH NEXT 5 ROWS WITH TIES;

-- The Following Query Returns Top 5% Employee Names With The Highest Department Names Level :

SELECT
    EmployeeName , DepartmentName
FROM
    Employee
INNER JOIN Department
    USING(DepartmentNumber)
FETCH NEXT 5 PERCENT ROWS ONLY;

-- The Following Query Skips The First 10 Employee Names With The Highest Level Of Department Names And Returns The Next 10 Ones :

SELECT
    EmployeeName , DepartmentName
FROM
    Employee
INNER JOIN Department
    USING(DepartmentNumber)
OFFSET 5 ROWS
FETCH NEXT 5 ROWS ONLY;