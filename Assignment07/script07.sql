-- Replace zk1 with your NetID
@dataSetupScript07.sql

spool spool07.txt

PROMPT jw6602

/*

YOU START YOU’RE ANSWERS AFTER THE END OF THIS COMMENT BLOCK

ANSWER0 is an example to show you the structure of what you need to produce, unless instructed otherwise in the assignment. Please read carefully what you are asked to do.

Insert your solution for ANSWERX between the string -- ANSWERX and the string PROMPT ANSWERX

*/

-- ANSWER0
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
SELECT Company.RegNumber, Big.TIN
FROM Company
INNER JOIN Big ON Company.TIN=Big.TIN
WHERE Big.FamilyName IS NULL AND Big.PersonalName IS NULL
ORDER BY RegNumber ASC, TIN ASC;

PROMPT ANSWER1
SELECT * FROM ANSWER1;

-- ANSWER2
CREATE TABLE TEMP1 AS
SELECT Big.TIN, Manager.Salary/Big.Company_Value AS SalaryRatio 
FROM Big
INNER JOIN Manager ON Big.FamilyName = Manager.FamilyName AND Big.PersonalName = Manager.PersonalName;

CREATE TABLE ANSWER2 AS
SELECT * FROM TEMP1
WHERE SalaryRatio > 0.1
ORDER BY TIN ASC, SalaryRatio ASC;

PROMPT ANSWER2
SELECT * FROM ANSWER2;

-- ANSWER3
CREATE TABLE TEMP2 AS
SELECT TIN, COUNT(Domain_Name) AS NumDomain 
FROM Company_Domain
GROUP BY TIN;

CREATE TABLE ANSWER3 AS
SELECT TIN FROM TEMP2
WHERE NumDomain >= 3 AND TIN >= '20000000'
ORDER BY TIN ASC;

PROMPT ANSWER3
SELECT * FROM ANSWER3;

-- ANSWER4
/*
CREATE TABLE TEMP3 AS
SELECT Domain_Name FROM Company_Domain
WHERE TIN = '99448276';
*/

CREATE TABLE TEMP3 AS
SELECT TIN, Count(Domain_Name) AS NumDomain
FROM Company_Domain
WHERE Domain_Name = 'IT' OR Domain_Name = 'Banking'
GROUP BY TIN;

CREATE TABLE ANSWER4 AS
SELECT TIN FROM TEMP3
WHERE NumDomain = 2
ORDER BY TIN ASC;

PROMPT ANSWER4
SELECT * FROM ANSWER4;

-- ANSWER5
DELETE FROM Helps WHERE HELPER = '74939103' OR HELPED = '74939103';
DELETE FROM Small WHERE TIN = '74939103';
-- DELETE FROM Big WHERE TIN = '74939103';
DELETE FROM Company_Domain WHERE TIN = '74939103';
DELETE FROM Company WHERE TIN = '74939103';

PROMPT ANSWER5
SELECT * FROM Company;

-- ANSWER6
INSERT INTO Manager (FamilyName, PersonalName, Salary) VALUES ( 'Aldrin' , 'Mickey', '100000');
UPDATE Big Set FamilyName = 'Aldrin', PersonalName = 'Mickey'
WHERE TIN='95499546';

PROMPT ANSWER6
SELECT * FROM Company;
SELECT * FROM Big;
SELECT * FROM Manager;

-- ANSWER7
-- SELECT * FROM Big WHERE TIN = '35983220';
DELETE FROM Big WHERE TIN = '35983220';
INSERT INTO Small (TIN) VALUES ( '35983220');

PROMPT ANSWER7
SELECT * FROM Company;
SELECT * FROM Big;
SELECT * FROM Small;

-- ANSWER8
INSERT INTO Helps (HELPER, HELPED) VALUES ( '74939103' , '90309251');

PROMPT ANSWER8
SELECT * FROM HELPS;

-- ANSWER9
PROMPT ANSWER9
/*
Write your solution below
*/

CREATE TABLE ANSWER9 AS
SELECT DISTINCT A, B FROM R
LEFT OUTER JOIN S ON A = C AND B = D
WHERE C IS NULL AND D IS NULL;

SELECT * FROM ANSWER9;

spool off