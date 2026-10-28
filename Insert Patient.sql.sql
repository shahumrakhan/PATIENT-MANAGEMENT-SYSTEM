USE HM

SELECT * FROM HospitalTable
SELECT * FROM TestTable

SELECT TOP 10 * FROM TestTable

-- select where charges > 500

SELECT DISTINCT PatientName, Charges FROM TestTable
WHERE Charges > 500

-- select where charges between 500 and 1200

SELECT PatientName, Charges FROM TestTable
WHERE Charges BETWEEN 500 and 1200

-- select all where charges are 900, 1200,1000

Select * from TestTable
where Charges in (900, 1200, 1000)

--reteive all PAtientName that start from J
SELECT PatientName FROM TestTable
WHERE PatientName like 'J%'

--reteive all PAtientName that end with y
SELECT PatientName FROM TestTable
WHERE PatientName like '%y'

--retreive all the patient names whose patient state is either AZ or UT or GA

SELECT PatientName, PatientState FROM TestTable
WHERE PatientState IN ('AZ', 'UT', 'GA')

SELECT PatientName, PatientState FROM TestTable
WHERE PatientState = 'AZ'
	OR PatientState = 'UT'
	OR PatientState = 'GA'

--retreive all patient names that starts with a and have exactly 4 length string
SELECT PatientName FROM TestTable
WHERE PatientName like 'A___'

--retreive all patient names that starts with a having atleast 3 and atmost 4
-- ATLEAST 3
SELECT PatientName FROM TestTable
WHERE PatientName like 'A__%'

--ATMOST 4
SELECT PatientName FROM TestTable
WHERE PatientName like 'A_'
	OR PatientName like 'A__'
	OR PatientName like 'A___'

-- retreive all patient names starts with either A,B,C,D
SELECT PatientName FROM TestTable
WHERE PatientName like '[A-D]%'

--retreive all the patients who do not have the letter s in their name
SELECT PatientName FROM TestTable
WHERE not PatientName like '%s%'

--find all patient name that starts with either A or J
SELECT PatientName FROM TestTable
WHERE PatientName like 'A%'
	OR PatientName like 'J%'

SELECT PatientName FROM TestTable
WHERE PatientName like '[AJ]%'

-- retreive all patient name that start with B and ends with L and is exactly of 4 length string
SELECT PatientName FROM TestTable
WHERE PatientName like 'B__L'

--retreive the PatientName and PatientState where the gender is M order by the Patient State
SELECT PatientName, PatientState FROM TestTable
WHERE Gender = 'M'
ORDER BY PatientState     -- over here we left as is so it in Ascending, by default it is so,  but for Descending write DESC

--
--DAY3
--count the number of patients in the testable
SELECT COUNT(PatientID) AS 'Count of Patients' FROM TestTable

--groupby
--it means grouping something by something
--it always comes after where clause and if where is not their then just use it directly
--count of patients statewise
SELECT PatientState, COUNT(*) AS 'State Wise Patients'
FROM TestTable
GROUP BY PatientState

--count the distinct patient name group by patient state
SELECT PatientState, COUNT(DISTINCT PatientName) AS 'State Wise Patients Name'
FROM TestTable
GROUP BY PatientState

--determine the maximum charges paid by a patient in a particular state
SELECT PatientState, MAX(Charges) as 'Max Charges by State'
FROM TestTable
GROUP BY PatientState

--detrmine the max salary of a employee in each department

--find the average charges in each state
SELECT PatientState, AVG(Charges) as 'Avg Charges by State'
FROM TestTable
GROUP BY PatientState

--retreive the patient name whose charges lie between 500 and 8000 and increase the charges by 10%
SELECT PatientName, (Charges + 0.1 * Charges) AS '10% INC in Charges'
FROM TestTable 
WHERE Charges BETWEEN 500 and 8000

SELECT PatientName, Charges
FROM TestTable
UPDATE TestTable SET Charges = Charges + (Charges * 0.1)
WHERE Charges BETWEEN 500 and 8000

--List the patient States where Average charges are greater than 800
SELECT PatientState, AVG(Charges) AS 'AVG CHARGES'
FROM TestTable
GROUP BY PatientState
HAVING AVG(Charges) > 800

SELECT PatientState, AVG(Charges) AS 'AVG CHARGES'
FROM TestTable
WHERE 'AVG CHARGES' > 800
GROUP BY PatientState

--select PatientName, PatientState, Average Charges per visit
--Group by patient name and patient state, where the gender is female and patients are from state GA and FL and the charges of the patients are greater than or equals to 800


--the hotel management wants a report showing the spending pattern of female from GA and FL State.
--group data by patients
--calaculate total amounts billed
--calculate the total visits
--compute avergae cgharge per visit
--exclude patients with the billing window below 900
--order the report the patient name

SELECT PatientName, PatientState,
SUM(Charges) as 'Amount Billed',
SUM(Visits) as 'Total Visits',
SUM(Charges)/SUM(Visits) as 'Avg Charge per Visit'
FROM TestTable
WHERE Gender = 'F' and PatientState in ('GA', 'FL')
GROUP BY PatientName, PatientState
HAVING SUM(Charges) >= 900
ORDER BY PatientName

--Case Statement
SELECT DISTINCT PatientID, PatientName,
	CASE WHEN PatientState = 'GA' then 'Georgia'
	WHEN PatientState = 'AL' then 'Alabama'
	WHEN PatientState = 'AK' then 'Alaska'
	WHEN PatientState = 'AZ' then 'Arizona'
	WHEN PatientState = 'UT' then 'Utah'
	ELSE PatientState
		END AS 'PatientState'
FROM TestTable


--JOINS
SELECT * FROM HospitalTable
SELECT * FROM TestTable

--retreive all patients names, location names that are from location [78522, 786027, 786229]
SELECT HospitalTable.LocationID, TestTable.PatientName, HospitalTable.LocationName FROM TestTable
INNER JOIN HospitalTable ON
	TestTable.LocationID = HospitalTable.LocationID
WHERE TestTable.LocationID IN ('78522', '786027', '786229')


--give all the location names where avg charges of the patients is above 4000
SELECT HospitalTable.LocationName, AVG(TestTable.Charges) AS 'AVG CHARGES' FROM TestTable
INNER JOIN HospitalTable ON
	TestTable.LocationID = HospitalTable.LocationID
GROUP BY HospitalTable.LocationName
HAVING AVG(TestTable.Charges) > 4000

--give state wise location names
SELECT TestTable.PatientState, HospitalTable.LocationName FROM TestTable
INNER JOIN HospitalTable ON
	TestTable.LocationID = HospitalTable.LocationID
GROUP BY TestTable.PatientState, HospitalTable.LocationName
ORDER BY TestTable.PatientState

--total charges collected per hospital
SELECT HospitalTable.LocationName, MAX(TestTable.Charges) AS 'TOTAL CHARGES' FROM TestTable
INNER JOIN HospitalTable ON
	TestTable.LocationID = HospitalTable.LocationID
GROUP BY HospitalTable.LocationName

--number of patients treated at each Hospital
SELECT HospitalTable.LocationName, COUNT(TestTable.PatientID) AS 'TOTAL PATIENTS' FROM TestTable
INNER JOIN HospitalTable ON
	TestTable.LocationID = HospitalTable.LocationID
GROUP BY HospitalTable.LocationName

--find patients whose location does not exist in the hospitaltable of any
SELECT TestTable.PatientID , HospitalTable.LocationName FROM TestTable
INNER JOIN HospitalTable ON
	TestTable.LocationID = HospitalTable.LocationID
WHERE TestTable.LocationID != HospitalTable.LocationID

