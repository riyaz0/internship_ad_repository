-- DECODE Function :

-- In The Following Example , The Oracle DECODE() Function Compares The First Argument With The Second Argument. Because They Are Equal , The Function Returns The Third Argument Which Is The String 'One':

SELECT
    DECODE(1 , 1 , 'One')
FROM
    Dual;

-- It Works Like The Following IF Statement :

-- IF 1 = 1 THEN 
--    RETURN 'One'; 
-- END IF

-- The Query Returns A Null Value Because One Does Not Equal Two :

SELECT
    DECODE (1 , 2 , 'One')
FROM
    Dual;
    
-- If You Want To Specify A Default Value When The First Argument Is Not Equal To The Second One , You Append The Default Value To The Argument List As Shown Below :

SELECT
    DECODE(1 , 2 , 'One' , 'Not One')
FROM
    Dual;
    
-- It Works Like The Following If - Then - Else Statement :

-- IF 1 = 2 THEN
--    RETURN 'One';
-- ELSE
--    RETURN 'Not One';
-- END IF;

-- What If You Want To Compare The First Argument With A List Of Arguments ? :

SELECT
    DECODE(2 , 1 , 'One' ,  2 , 'Two')
FROM
    Dual;
    
-- It Works Like The Following If - Then - Elsif Statement :

-- IF 2 = 1 THEN 
--     RETURN 'One';
-- ELSIF 2 = 2 THEN 
--    RETURN 'Two';
-- END IF;

-- If You Want To Specify A Default Value When The Function Does Not Find Any Match , You Do It As Follows :

SELECT
    DECODE(3 , 1 , 'One' ,  2 , 'Two' , 'Not One Or Two')
FROM
    Dual;
    
-- The Query Works Like The Following If - Then - Elsif - Else Statement :

-- IF 3 = 1 THEN 
--     RETURN 'One';
-- ELSIF 3 = 2 THEN 
--    RETURN 'Two';
-- ELSE
--    RETURN 'Not one or two';
-- END IF;

-- The Following Query Uses The DECODE() Function In The ORDER BY Clause To Sort The Employees Result Set Based On An Input Argument :

SELECT FirstName , LastName
FROM
    Employees
ORDER BY
    DECODE('J' , 'F' , FirstName , 'L' , LastName);
    
-- NULL Cannot Be Compared To Anything Even NULL. However , DECODE() Function Treats Two Null Values Are Being Equal. The Following Statement Returns The String Equal :

SELECT
    DECODE(NULL , NULL , 'Equal' , 'Not Equal')
FROM
    Dual;