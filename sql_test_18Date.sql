use regex;
create database TestDemo;
use TestDemo;
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    department VARCHAR(50),
    age INT,
    gender CHAR(1) CHECK (gender IN ('M', 'F'))
);
INSERT INTO Students (student_id, name, department, age, gender) VALUES
(1, 'Alice', 'CS', 21, 'F'),
(2, 'Bob', 'EE', 22, 'M'),
(3, 'Carol', 'ME', 20, 'F'),
(4, 'David', 'CS', 23, 'M'),
(5, 'Eva', 'EE', 21, 'F');


CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_code VARCHAR(20),
    semester INT,
    marks INT CHECK (marks BETWEEN 0 AND 100),
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

INSERT INTO Enrollments (enrollment_id, student_id, course_code, semester, marks) VALUES
(101, 1, 'CS101', 1, 85),
(102, 1, 'CS102', 2, 90),
(103, 2, 'EE101', 1, 75),
(104, 3, 'ME101', 1, 88),
(105, 4, 'CS101', 1, 95),
(106, 5, 'EE101', 2, 78),
(107, 5, 'EE102', 3, 82);

select * from students;
select * from Enrollments;
-- List all students along with the courses they have enrolled in.

select s.* , e.enrollment_id ,e.course_code from students as s join Enrollments as e
on s.student_id=e.student_id group by e.course_code ;

-- Find students who are not enrolled in any course. 
select s.* , e.enrollment_id  from students as s join Enrollments as e
on  s.student_id=e.student_id where e.enrollment_id is null;

-- select s.name , e.enrollment_id from students as s join Enrollments as e on s.student_id=e.student_id where e.enrollment_id is null;

select student_id ,enrollment_id from  Enrollments  where enrollment_id is null;
select student_id  from  students  where student_id is null;


-- 3 questions Find students who scored above the average marks in their respective departments.

select e1.student_id, avg(e1.marks) from Enrollments as e1 join students as s1 where (select avg(e.marks) from Enrollments as e) ;


-- Rank students by marks within each course.
select course_code,student_id,marks ,rank() over(partition by course_code order by marks desc) as rank1 from Enrollments;
-- Find running average of marks for each student ordered by semester.
select student_id ,avg(marks) over(partition by student_id order by semester) as avg_marks from Enrollments;

-- Average marks per department across all enrolled courses
select s.department ,avg(e.marks) over(partition by s.department order by e.enrollment_id) as Average_marks from Enrollments as e join students as s where s.student_id = e.student_id ;
