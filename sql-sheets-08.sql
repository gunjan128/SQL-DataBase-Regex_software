create database regex1;
use regex1;
CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(100)
);

INSERT INTO Departments (DeptID, DeptName) VALUES
(1, 'Engineering'),
(2, 'Marketing'),
(3, 'HR');
select * from departments;


CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(100),
    Salary DECIMAL(10, 2),
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

INSERT INTO Employees (EmpID, EmpName, Salary, DeptID) VALUES
(1, 'Alice', 70000, 1),
(2, 'Bob', 60000, 1),
(3, 'Charlie', 50000, 1),
(4, 'Diana', 55000, 2),
(5, 'Eve', 65000, 2),
(6, 'Frank', 40000, 3);



select * from employees;
-- avg salaary of the each salary 
select DeptId,avg(salary)  from employees  group by DeptID;

select * from employees as ee where salary > (select avg(salary) from employees as d where ee.DeptId = d.DeptId);

desc Departments;
desc employees;
select DeptId,DeptName from departments as d where EXISTS (select salary from employees as e where d.DeptId=e.DeptId and  e.salary>60000);




select * from employees as ee where salary =(select max(salary)  from employees as d where ee.DeptId = d.DeptId);

-----

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100),
    Department VARCHAR(50)
);

INSERT INTO Students (StudentID, StudentName, Department) VALUES
(1, 'Alice', 'Computer Science'),
(2, 'Bob', 'Computer Science'),
(3, 'Charlie', 'Mathematics'),
(4, 'Diana', 'Mathematics'),
(5, 'Eve', 'Physics');


CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    Department VARCHAR(50)
);

INSERT INTO Courses (CourseID, CourseName, Department) VALUES
(101, 'Data Structures', 'Computer Science'),
(102, 'Algorithms', 'Computer Science'),
(201, 'Calculus', 'Mathematics'),
(202, 'Linear Algebra', 'Mathematics'),
(301, 'Quantum Mechanics', 'Physics');

CREATE TABLE Enrollments (
    StudentID INT,
    CourseID INT,
    Grade DECIMAL(5, 2),
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO Enrollments (StudentID, CourseID, Grade) VALUES
(1, 101, 88.5),
(1, 102, 92.0),
(2, 101, 76.0),
(2, 102, 81.5),
(3, 201, 85.0),
(3, 202, 90.0),
(4, 201, 78.0),
(4, 202, 82.5),
(5, 301, 91.0);


select * from Students;
select *  from Courses;
select *  from  Enrollments;

desc Students;
desc Courses;
desc Enrollments;

select * from Enrollments as s
where Grade > (select avg(e.Grade) from Enrollments as e
	where s.studentId = e.studentId);

select  s.studentId ,s.StudentName,c.courseName from students as s
 join Courses as c where s.studentId = c.courseId;

 select * from Enrollments as ee where Grade=(select max(Grade)  from Enrollments as d where ee.studentId = d.studentId);

