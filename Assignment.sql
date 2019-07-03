--Question 1

SELECT fname, lname, ssn, salary
FROM employee
WHERE sex = "M" AND salary > 30000;

--Question 2

SELECT SSN 
FROM Employee e JOIN DeptLocations d ON (e.dno = d.dnumber)
WHERE d.dlocation = 'Sugarland' OR d.dlocation = 'Stafford'
ORDER BY SSN DESC;

--Question 3

SELECT fname, lname, dependent_name
FROM employee e JOIN dependent d ON (e.ssn = d.essn)
WHERE d.relationship <> 'SPOUSE';

--Question 4

SELECT e.Fname, m.lname
FROM Employee e JOIN (SELECT lname, SSN FROM Department d JOIN Employee m ON (d.MGRSSN = m.SSN) ) m
WHERE m.ssn = e.superSSN;

--Question 5

SELECT p.pno,v.pname
FROM
(SELECT pno FROM employee e JOIN Works_On w ON (e.ssn = w.essn)
 WHERE e.fname = 'Franklin') p
 JOIN
 (SELECT pno FROM employee z JOIN Works_On b ON (z.ssn = b.essn) 
 WHERE z.fname = 'Alicia') c
 ON (p.pno = c.pno) JOIN Project v ON (p.pno = v.pnumber);

--Question 6

SELECT e.ssn, e.lname, COUNT(w.pno) as "NUM"
FROM employee e JOIN works_on w ON (e.ssn = w.essn)
group by e.ssn
HAVING COUNT(w.pno) = 2;

--Question 7

SELECT ssn,salary/(SUM(hours)*52) AS WAGE
FROM employee e JOIN works_on w ON (e.ssn = w.essn)
GROUP BY ssn
ORDER BY WAGE ASC;


