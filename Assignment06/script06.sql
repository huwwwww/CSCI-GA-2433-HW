-- Replace zk1 with your NetID

-- execute data setup script
@dataSetupScript06.sql

spool spool06.txt

PROMPT jw6602
/*

YOU START YOUR ANSWERS AFTER THE END OF THIS COMMENT BLOCK

ANSWER0 is an example to show you the structure of what you need to produce, unless instructed otherwise in the assignment. Please read carefully what you are asked to do.

Insert your solution for ANSWERX between the string -- ANSWERX and the string PROMPT ANSWERX

*/

-- Answer 0 represents a sample query that uses the temp table TEMP0 just to demonstrate the usage of temp table.
-- ANSWER0
CREATE TABLE TEMP0
AS SELECT *
FROM SMALL;

CREATE TABLE ANSWER0
AS SELECT DISTINCT TIN
FROM TEMP0
ORDER BY TIN DESC;


PROMPT ANSWER0
SELECT * FROM ANSWER0;

-- ANSWER1
CREATE TABLE ANSWER1 AS
SELECT RegNumber, TIN FROM Company
ORDER BY RegNumber ASC, TIN DESC;


PROMPT ANSWER1
SELECT * FROM ANSWER1;

-- ANSWER2
CREATE TABLE ANSWER2 AS
SELECT Company.RegNumber, Company.TIN FROM Company, Company_Domain, Big
WHERE Company_Domain.Domain_Name='IT' AND Big.FamilyName='Garcia' AND Company.TIN=Company_Domain.TIN AND Company_Domain.TIN=Big.TIN; 


PROMPT ANSWER2
SELECT * FROM ANSWER2;

-- ANSWER3
CREATE TABLE ANSWER3 AS
SELECT DISTINCT helper AS helperTIN, helped AS helpedTIN From Helps;


PROMPT ANSWER3
SELECT * FROM ANSWER3;

-- ANSWER4
CREATE TABLE ANSWER4 AS
SELECT Company.RegNumber, Company.TIN FROM Company, Company_Domain 
WHERE Company_Domain.Domain_Name='IT' AND Company.TIN=Company_Domain.TIN
INTERSECT (
SELECT Company.RegNumber, Company.TIN FROM Company, Helps
WHERE Company.TIN=Helps.helped AND Helps.helper='59515298'
UNION
SELECT Company.RegNumber, Company.TIN FROM Company, Helps
WHERE Company.TIN=Helps.helped AND Helps.helper='51251930'
);


PROMPT ANSWER4
SELECT * FROM ANSWER4;

-- ANSWER5
CREATE TABLE ANSWER5 AS
SELECT RegNumber, TIN FROM Company
MINUS
SELECT Company.RegNumber, Company.TIN FROM Company, Helps
WHERE Company.TIN=Helps.helper;


PROMPT ANSWER5
SELECT * FROM ANSWER5;

-- ANSWER6
CREATE TABLE ANSWER6 AS
SELECT Company.RegNumber, Company.TIN FROM Company, Company_Domain
WHERE Company_Domain.Domain_Name!='IT' AND Company.TIN=Company_Domain.TIN
MINUS
SELECT Company.RegNumber, Company.TIN FROM Company, Company_Domain
WHERE Company_Domain.Domain_Name='IT' AND Company.TIN=Company_Domain.TIN
ORDER BY RegNumber ASC, TIN DESC;


PROMPT ANSWER6
SELECT * FROM ANSWER6;

-- ANSWER7
CREATE TABLE TEMP1 AS
SELECT Company.RegNumber, Company.TIN FROM Company, Company_Domain
WHERE Company_Domain.Domain_Name='IT' AND Company.TIN=Company_Domain.TIN
MINUS
SELECT Company.RegNumber, Company.TIN FROM Company, Big
WHERE Company.TIN=Big.TIN;

CREATE TABLE TEMP2 AS
SELECT * FROM TEMP1
INTERSECT
SELECT Company.RegNumber, Company.TIN FROM Company, Company_Domain
WHERE Company_Domain.Domain_Name='Banking' AND Company.TIN=Company_Domain.TIN;

CREATE TABLE ANSWER7 AS
SELECT TEMP2.RegNumber AS RegNumber, TEMP2.TIN AS TIN FROM TEMP1, TEMP2, Helps
WHERE TEMP2.TIN=Helps.helped AND TEMP1.TIN=Helps.helper;


PROMPT ANSWER7
SELECT * FROM ANSWER7;



spool off