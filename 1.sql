========================================================================================================


CREATE TABLE Department(
DeptNo varchar(20) PRIMARY KEY,
DeptName char(20),
Location varchar(20)
);


CREATE TABLE Project(
ProjNo char(5) PRIMARY KEY,
Project_Name varchar(20),
DeptNo varchar(20)

CONSTRAINT Project_fk1 FOREIGN KEY(DeptNo) REFERENCES Department
);


CREATE TABLE Employee (
EmpNo varchar(20) PRIMARY KEY,
fname char(20),
lname char(20),
address varchar(40),
salary int,
DeptNo varchar(20),

CONSTRAINT Employee_fk1 FOREIGN KEY(DeptNo) REFERENCES Department
);



CREATE TABLE Works_On(
EmpNo varchar(20),
ProjNo char(5),
DateWorked date,
Hours time,
CONSTRAINT Works_On_pk PRIMARY KEY(EmpNo, ProjNo),
CONSTRAINT Works_On_fk1 FOREIGN KEY(EmpNo) REFERENCES Employee,
CONSTRAINT Works_On_fk2 FOREIGN KEY(ProjNo) REFERENCES Project
);


========================================================================================================================

INSERT INTO Department VALUES ('001', 'Accounts', 'Bangalore');
INSERT INTO Department VALUES ('002', 'IT', 'Mumbai');
INSERT INTO Department VALUES ('003', 'ECE', 'Mumbai');
INSERT INTO Department VALUES ('004', 'ISE', 'Mumbai');
INSERT INTO Department VALUES ('005', 'CSE', 'Delhi');

INSERT INTO Project VALUES ('P01', 'IOT', '005');
INSERT INTO Project VALUES ('P02', 'Cloud', '005');
INSERT INTO Project VALUES ('P03', 'BankMgmt', '004');
INSERT INTO Project VALUES ('P04', 'Sensors ', '003');
INSERT INTO Project VALUES ('P05', 'BigData', '002');

INSERT INTO Employee VALUES ('Emp01', 'John', 'Scott', 'Mysore', '45000', '003');
INSERT INTO Employee VALUES ('Emp02', 'James', 'Smith', 'Bangalore', '50000', '005');
INSERT INTO Employee VALUES ('Emp03', 'Edward', 'Hedge ', 'Bangalore', '65000', '002');
INSERT INTO Employee VALUES ('Emp04', 'Santhosh', 'Kumar', 'Delhi ', '80000', '002');
INSERT INTO Employee VALUES ('Emp05', 'Veena', 'M', 'Mumbai', '45000', '004');

INSERT INTO Works_On VALUES ('Emp02', 'P03', '02-OCT-2018', '4');
INSERT INTO Works_On VALUES ('Emp01', 'P02', '22-JAN-2014', '13');
INSERT INTO Works_On VALUES ('Emp02', 'P02', '19-JUN-2020', '15');
INSERT INTO Works_On VALUES ('Emp02', 'P01', '11-JUN-2020', '10');
INSERT INTO Works_On VALUES ('Emp01', 'P04', '08-FEB-2009', '6');
INSERT INTO Works_On VALUES ('Emp02', 'P04', '18-OCT-2018', '18');
INSERT INTO Works_On VALUES ('Emp01', 'P05', '02-SEP-2011', '7');


===========================================================================================================================

SELECT e.fname, e.lname, e.address
FROM Employee e, Department d
WHERE e.DeptNo=d.DeptNo AND d.DeptName='IT'

----------------------------------------------------------------------------------------------------------------------------

SELECT  DISTINCT salary
FROM Employee

----------------------------------------------------------------------------------------------------------------------------

SELECT e.fname, e.lname 
FROM Employee e, Works_On w, Project p
WHERE e.EmpNo=w.EmpNo AND e.DeptNo='005' p.ProjNo=w.ProjNo AND p.ProjNo='P01' AND w.Hours >10

----------------------------------------------------------------------------------------------------------------------------

SELECT e.lname, e.fname, p.Project_name, p.DeptNo
FROM Employee e, Project p, works_on w
where w.EmpNo = e.EmpNo and p.ProjNo = w.ProjNo
order by p.DeptNo,  e.lname , e.fname 

----------------------------------------------------------------------------------------------------------------------------

SELECT e.salary +(e.salary * 10/100) AS Salary
FROM Employee e, Project p, works_on w
where w.EmpNo = e.EmpNo and p.ProjNo = w.ProjNo AND p.Project_Name='IOT'
