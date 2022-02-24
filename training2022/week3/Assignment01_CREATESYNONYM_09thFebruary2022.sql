-- SYNONYMS :

-- CREATE SYNONYM :

-- This Example Uses The CREATE SYNONYM Statement To Create A Synonym For The Inventories Table From The Sample Database :

CREATE SYNONYM Emp
FOR Employee;

-- Now , You Can Use The Emp Synonym Instead Of The Employee Table In The Query Like The Following :

SELECT * FROM Emp;