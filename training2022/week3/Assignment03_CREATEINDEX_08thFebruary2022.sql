-- CREATEINDEX :

-- The Members Table Has A Primary Key Column , Therefore , MemberID Oracle Created A New Index For This Column. To View All Indexes Of A Table , You Query From The AllIndexes View :

SELECT 
    Index_Name , Index_Type , Visibility , Status 
FROM 
    All_Indexes
WHERE 
    Table_Name = 'Members';

-- Suppose , You Often Want To Look Up Members By The Last Name And You Find That The Query Is Quite Slow. To Speed Up The Lookup , You Create An Index For The LastName Column :

CREATE INDEX IndexMembersLastName
ON Members (LastName);

-- The Following Statement Finds Members Whose Last Name Is Harse :

SELECT * FROM Members
WHERE 
    LastName = 'Garza';
    
-- To Check If A Query Uses The Index For Lookup Or Not , You Follow These Steps. First , Add The EXPLAIN PLAN FOR Clause Immediately Before The SQL Statement :

EXPLAIN PLAN FOR
SELECT * FROM Members
WHERE 
    LastName = 'Garza';
    
-- Then , Use The DBMS_XPLAN.DISPLAY() Procedure To Show The Content Of The Plan_Table :

SELECT 
    PLAN_TABLE_OUTPUT 
FROM 
    TABLE(DBMS_XPLAN.DISPLAY());
    
-- To Remove An Index , You Use The DROP INDEX Statement :

DROP INDEX IndexMembersLastName;

-- The Following Example Creates An Index On Both First Name And Last Name Columns :

CREATE INDEX IndexMembersName
ON members (FirstName , LastName);

-- The Following Query Finds Members Whose Last Name Starts With The Letter A And First Name Starts With The Letter M :

SELECT * FROM Members
WHERE
    FirstName LIKE 'A%' AND LastName LIKE 'W%';

-- This Statement Definitely Uses The IndexMembersName Index As Shown In The Execution Plan Below :

EXPLAIN PLAN FOR
SELECT * FROM Members
WHERE
    FirstName LIKE 'A%' AND LastName LIKE 'W%';    
    
SELECT 
    PLAN_TABLE_OUTPUT 
FROM 
    TABLE(DBMS_XPLAN.DISPLAY());