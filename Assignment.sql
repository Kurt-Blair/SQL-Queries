/*Question1:*/
 
SELECT fname, lname, ssn 
FROM employee, department
WHERE (SSN = MGRSSN AND employee.Sex= 'M' AND Salary > 30000)

/*Question2:*/

SELECT DISTINCT essn 
FROM project, works_on 
WHERE (project.PNumber = works_on.PNo 
AND (project.Plocation = 'Stafford' OR project.PLocation='Sugarland'))
ORDER BY eSSN DESC

/*Question3:*/


SELECT Fname, Lname, dependent_name
FROM employee, dependent
WHERE (ssn = essn AND (dependent.Relationship = 'Son' OR dependent.Relationship = 'Daughter')) 



/*Question 4:*/

CREATE TEMPORARY TABLE managers(
        MSSN		CHAR(11)	NOT NULL,
        Mlname	VARCHAR(20)	NOT NULL,
        PRIMARY KEY(MSSN)
    );
INSERT INTO managers 
(SELECT department.MGRSSN AS MSSN, employee.LName AS Mlname
FROM department, employee
WHERE department.MGRSSN = employee.SSN
);
(SELECT employee.LName, managers.Mlname
FROM employee, managers
 WHERE employee.SuperSSN = managers.MSSN
);

/*Question 5:*/

CREATE TEMPORARY TABLE FrankProjects(
        fSSN		CHAR(11)	NOT NULL,
        Projname	VARCHAR(15)	NOT NULL,
        pnum int NOT NULL,
        PRIMARY KEY(pnum)
    );
INSERT INTO FrankProjects 
(SELECT works_on.ESSN AS fSSN, project.PName AS Projname, project.PNumber as pnum
FROM works_on, project
WHERE works_on.PNo = project.PNumber AND ESSN = '333445555'
);

CREATE TEMPORARY TABLE AliciaProjects(
        fSSN		CHAR(11)	NOT NULL,
        Proname	VARCHAR(15)	NOT NULL,
        pnu int NOT NULL,
        PRIMARY KEY(pnu)
    );
INSERT INTO AliciaProjects 
(SELECT works_on.ESSN AS fSSN, project.PName AS Proname, project.PNumber as pnu
FROM works_on, project
WHERE works_on.PNo = project.PNumber AND ESSN = '999887777'
);

(SELECT Proname, pnu
 FROM AliciaProjects,FrankProjects
 WHERE AliciaProjects.pnu = FrankProjects.pnum)
 
/*Question */

SELECT DISTINCT
    lname,
    SSN
FROM
    employee,
    works_on
GROUP BY
    lname,
    essn
HAVING
    COUNT(*) = 2
	
/*Question 7	*/

CREATE TEMPORARY TABLE hourly(
        esn		CHAR(11)	NOT NULL,
        hours int NOT NULL,
        numprojs int NOT NULL,
        Salary int NOT NULL,
        PRIMARY KEY(esn)
    );

INSERT INTO hourly 
(SELECT ESSN, SUM(Hours),COUNT(Hours),Salary
FROM works_on,employee
GROUP BY ESSN
);

(SELECT esn, numprojs, Salary/(52*hours) as HourlyWage
 FROM hourly)
 
