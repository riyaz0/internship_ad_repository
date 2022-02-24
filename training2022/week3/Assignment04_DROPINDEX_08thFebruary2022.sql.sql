-- DROPINDEX :

-- To Remove An Index , You Use The DROP INDEX Statement :

DROP INDEX IndexMembersLastName;

-- Drop Index If Exists :

DECLARE Index_Count INTEGER;
BEGIN
SELECT COUNT (*) INTO Index_Count
    FROM USER_INDEXES
    WHERE INDEX_NAME = 'Index_Name';
IF Index_Count > 0 THEN
    EXECUTE IMMEDIATE 'DROP INDEX index_name';
END IF;
END;