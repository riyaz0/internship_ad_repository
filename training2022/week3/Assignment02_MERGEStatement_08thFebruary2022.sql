-- MEREGE Statement :

-- Created Members Table :

CREATE TABLE Members (
	MemberID NUMBER PRIMARY KEY ,
    FirstName VARCHAR2 (50) NOT NULL ,
    LastName VARCHAR2 (50) NOT NULL ,
    Rank VARCHAR2 (20)
);

-- Created MembersStaging Table :

CREATE TABLE MemberStaging AS 
SELECT * FROM Members;

-- Insert Data Into Members Table :

INSERT INTO Members (MemberID , FirstName , LastName , Rank) VALUES (1 , 'Abel' , 'Wolf' , 'Gold');
INSERT INTO Members (MemberID , FirstName , LastName , Rank) VALUES (2 , 'Clarita' , 'Franco' , 'Platinum');
INSERT INTO Members (MemberID , FirstName , LastName , Rank) VALUES (3 , 'Darryl' , 'Giles' , 'Silver');
INSERT INTO Members (MemberID , FirstName , LastName , Rank) VALUES (4 , 'Dorthea' , 'Suarez' , 'Silver');
INSERT INTO Members (MemberID , FirstName , LastName , Rank) VALUES (5 , 'Katrina' , 'Wheeler' , 'Silver');
INSERT INTO Members (MemberID , FirstName , LastName , Rank) VALUES (6 , 'Lilian' , 'Garza' , 'Silver');
INSERT INTO Members (MemberID , FirstName , LastName , Rank) VALUES (7 , 'Ossie' , 'Summers' , 'Gold');
INSERT INTO Members (MemberID , FirstName , LastName , Rank) VALUES (8 , 'Paige' , 'Mcfarland' , 'Platinum');
INSERT INTO Members (MemberID , FirstName , LastName , Rank) VALUES (9 , 'Ronna' , 'Britt' , 'Platinum');
INSERT INTO Members (MemberID , FirstName , LastName , Rank) VALUES (10 , 'Tressie' , 'Short' , 'Bronze');

-- Insert Data Into MemberStaging Table :

INSERT INTO MemberStaging (MemberID , FirstName , LastName , Rank) VALUES (1 , 'Abel' , 'Wolf' , 'Silver');
INSERT INTO MemberStaging (MemberID , FirstName , LastName , Rank) VALUES (2 , 'Clarita' , 'Franco' , 'Platinum');
INSERT INTO MemberStaging (MemberID , FirstName , LastName , Rank) VALUES (3 , 'Darryl' , 'Giles' , 'Bronze');
INSERT INTO MemberStaging (MemberID , FirstName , LastName , Rank) VALUES (4 , 'Dorthea' , 'Gate' , 'Gold');
INSERT INTO MemberStaging (MemberID , FirstName , LastName , Rank) VALUES (5 , 'Katrina' , 'Wheeler' , 'Silver');
INSERT INTO MemberStaging (MemberID , FirstName , LastName , Rank) VALUES (6, 'Lilian' , 'Stark' , 'Silver');

-- MERGE Statement That Performs All Of These Actions In One Shot :

MERGE INTO MemberStaging MemStag
USING (SELECT MemberID , FirstName , LastName , Rank FROM Members) Mem
ON (MemStag.MemberID = Mem.MemberID)
WHEN MATCHED THEN
    UPDATE SET MemStag.FirstName = Mem.FirstName, 
               MemStag.LastName = Mem.LastName, 
               MemStag.Rank = Mem.Rank
    WHERE MemStag.FirstName <> Mem.FirstName OR 
           MemStag.LastName <> Mem.LastName OR
           MemStag.Rank <> Mem.Rank
WHEN NOT MATCHED THEN
    INSERT(MemStag.MemberID , MemStag.FirstName , MemStag.LastName , MemStag.Rank) VALUES(Mem.MemberID , Mem.FirstName , Mem.LastName , Mem.Rank);
    
