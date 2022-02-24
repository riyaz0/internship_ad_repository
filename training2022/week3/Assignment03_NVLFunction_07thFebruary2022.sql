-- NVL Function :

-- The Following Example Returns 100 Because The First Argument Is Not Null :

SELECT
    NVL (100 , 200)
FROM
    Dual;
    
-- The Following Example Returns N/A Because The First Argument Is Null :

SELECT
    NVL (NULL , 'N/A')
FROM
    Dual;