USE HM
CREATE TABLE HospitalTable
      (LocationID VARCHAR(255) PRIMARY KEY,
	   LocationName VARCHAR(255))
		SELECT * FROM HospitalTable

INSERT INTO HospitalTable
	(LocationID, LocationName)

VALUES
		('785522','Evergreen Clinic')
		,('785623','Twin Mountains Hospital')
		,('785724','Big Heart Community Hospital')
		,('785825','Pioneer Clinic')
		,('785926','Fairmont Hospital Center')
		,('786027','Angelstone Community Hospital')
		,('786128','Genesis Hospital Center')
		,('786229','Principal Medical Clinic')
		,('786330','Fairview General Hospital')
		,('786431','Guardian Medical Clinic')
		,('786532','Memorial Medical Center')

		SELECT * FROM HospitalTable
CREATE TABLE TestTable
	(
	Patient_ID VARCHAR(255) PRIMARY KEY,
	Patient_Name VARCHAR(255) NOT NULL,
	Patient_State VARCHAR NOT NULL,
	Gender CHAR NOT NULL,
	Visits INT DEFAULT(0),
	Charges INT DEFAULT(0)
	)

	DROP TABLE TestTable
	--TRUNCATE TABLE TestTable


CREATE TABLE TestTable

(PatientID VARCHAR(255) NOT NULL PRIMARY KEY,
LocationID VARCHAR(255) FOREIGN KEY REFERENCES HospitalTable(LocationID),
PatientName VARCHAR(255),
PatientState VARCHAR(255),
Gender VARCHAR(255),
Visits INT DEFAULT 0,
Charges INT DEFAULT 0)

SELECT * FROM TestTable

INSERT INTO TestTable
	(PatientID, LocationID, PatientName, PatientState, Gender, Visits, Charges)

VALUES
	 ('12345','785522','John','AL','M','3','200')
	,('12346','785623','Jane','AK','F','1','400')
	,('12347','785724','Alex','AZ','F','6','900')
	,('12348','785825','Bob','CA','M','7','8000')
	,('12349','785926','Josh','CO','M','12','19000')
	,('12350','786027','Stephanie','FL','F','18','25000')
	,('12351','786128','Amber','GA','F','4','400')
	,('12352','786229','Brittany','GA','F','6','4000')
	,('12353','786330','Bill','UT','M','8','5000')
	,('12354','786431','Nate','WY','M','22','28000')
	,('12355','785522','Joe','GA','M','8','1900')
	,('12356','785623','Garret','GA','M','1','900')
	,('12357','785724','Jill','UT','F','8','8000')
	,('12358','785825','Justin','WY','M','2','300')
	,('12359','785926','Bret','UT','M','2','5000')
	,('12360','786027','Kellie','WY','F','20','29000')
	,('12361','786229','Gerald','GA','M','3','1900')
	,('12362','786330','Rudy','GA','M','1','400')
	,('12363','786431','Ruby','UT','F','4','2000')
	,('12364','785724','Ava','WY','F','6','3300')
	,('12365','785926','Liam','AL','M','4','1200')
	,('12366','786229','Rich','AK','M','7','4400')
	,('12367','786330','Alice','AZ','F','9','1900')
	,('12368','786532','Kris','CA','M',null,'1000')
	,('12369','786431','Arthur','CO','M','15','9000')

SELECT * FROM TestTable

SELECT PatientName, Gender FROM TestTable

UPDATE TestTable SET Visits = 4 WHERE PatientID = '12345'

UPDATE TestTable SET PatientState = 'CA' WHERE PatientID = '12349' AND PatientName = 'Josh'

SELECT * FROM TestTable WHERE PatientID = '12349'

-- >Drop
--deletes the table
-->truncate
--empties sthe table
-->delete
--it is a row/column level command

DELETE FROM TestTable WHERE PatientID = '12349'
SELECT * FROM TestTable WHERE PatientID = '12349'

ALTER TABLE TestTable ADD Address VARCHAR(255)

select PatientID, PatientName
into TestTable2
from TestTable where charges>900

select * from TestTable2

select distinct PatientID from TestTable

select * from TestTable

-- Patient State Cayou have to pick up distinct Combination of name and charges are greater than 500

select PatientName, Charges
From TestTable where Charges>500
select distinct PatientName From TestTable
select distinct Charges from TestTable


