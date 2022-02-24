-- SEQUENCE :

-- For Example , This Statement Uses The CREATE SEQUENCE Statement To Create A New Sequence Object Named SequenceItem :

CREATE SEQUENCE SequenceItem;

-- To Access The Next Available Value For A Sequence , You Use The NEXTVAL Pseudo - Column :

SELECT SequenceItem.NEXTVAL
FROM 
    Dual;
    
-- The Following Statement Uses The SequenceItem Sequence Repeatedly In An SQL Statement :

SELECT SequenceItem.NEXTVAL
FROM   
    Dual
CONNECT BY Level <= 5;

-- This Example Uses The SequenceItem Sequence In The INSERT Statements To Populate Values For The ItemID Column Of The Items Table :

CREATE TABLE Items (
    ItemID NUMBER
);

INSERT INTO Items (ItemID) VALUES (SequenceItem.NEXTVAL);

INSERT INTO Items (ItemID) VALUES (SequenceItem.NEXTVAL);

SELECT ItemID FROM Items;

DECLARE
    VSequence NUMBER;
BEGIN
    VSequence  := SequenceItem.NEXTVAL;
    DBMS_OUTPUT.PUT_LINE('VSequence = ' || VSequence);
END;

-- The Following Example Uses The ALTER SEQUENCE To Set The Maximum Value For The SequenceItem to 100 :

ALTER SEQUENCE SequenceItem MAXVALUE 100;

-- To Remove An Existing Sequence From The Database , You Use The DROP SEQUENCE Statement. The Following Example Uses The DROP SEQUENCE Statement To Delete The SequenceItem Sequence :

DROP SEQUENCE SequenceItem;