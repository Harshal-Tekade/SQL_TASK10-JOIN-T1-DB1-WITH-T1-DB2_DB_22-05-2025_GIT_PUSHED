CREATE TABLE students (
    student_id SERIAL Primary key,
    first_name VARCHAR not null,
    last_name VARCHAR not null,
    email VARCHAR not null,
    city VARCHAR not null,
	university varchar not null
);





INSERT INTO students (first_name, last_name, email, city,university) VALUES
('John', 'Doe', 'john.doe@example.com', 'New York','Nagpur_University'),
('Jane', 'Smith', 'jane.smith@example.com', 'Los Angeles','Nagpur_University'),
('Mike', 'Johnson', 'mike.johnson@example.com', 'Chicago','Nagpur_University'),
('Emily', 'Davis', 'emily.davis@example.com', 'Houston','Nagpur_University'),
('Robert', 'Brown', 'robert.brown@example.com', 'Phoenix','Nagpur_University'),
('Linda', 'Garcia', 'linda.garcia@example.com', 'Philadelphia','Pune_University'),
('David', 'Martinez', 'david.martinez@example.com', 'San Antonio','Pune_University'),
('Susan', 'Lopez', 'susan.lopez@example.com', 'San Diego','Pune_University'),
('Daniel', 'Lee', 'daniel.lee@example.com', 'Dallas','Pune_University'),
('Karen', 'Walker', 'karen.walker@example.com', 'San Jose','Pune_University'),
('Mark', 'Hall', 'mark.hall@example.com', 'Austin','Delhi_University'),
('Nancy', 'Allen', 'nancy.allen@example.com', 'Jacksonville','Delhi_University'),
('Kevin', 'Young', 'kevin.young@example.com', 'Columbus','Delhi_University'),
('Donna', 'Hernandez', 'donna.hernandez@example.com', 'Charlotte','Delhi_University'),
('George', 'King', 'george.king@example.com', 'Fort Worth','Delhi_University'),
('Betty', 'Wright', 'betty.wright@example.com', 'Detroit','Mumbai_University'),
('Edward', 'Scott', 'edward.scott@example.com', 'El Paso','Mumbai_University'),
('Helen', 'Green', 'helen.green@example.com', 'Memphis','Mumbai_University'),
('Brian', 'Baker', 'brian.baker@example.com', 'Seattle','Mumbai_University'),
('Laura', 'Adams', 'laura.adams@example.com', 'Denver','Mumbai_University');

select * from students;

CREATE TABLE enrollments (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES students(student_id),
    course_id INT NOT NULL, 
    enrollment_date DATE NOT NULL,
    grade VARCHAR not null,
	CONSTRAINT fk_enrollments_students foreign key(student_id)  REFERENCES students(student_id)
);

INSERT INTO enrollments (student_id, course_id, enrollment_date, grade) VALUES
(3, 1, '2024-09-01', 'A'),
(7, 2, '2024-09-02', 'B'),
(15, 3, '2024-09-03', 'A'),
(8, 4, '2024-09-04', 'C'),
(12, 5, '2024-09-05', 'B'),
(3, 6, '2024-09-06', 'A'),
(18, 7, '2024-09-07', 'B'),
(6, 8, '2024-09-08', 'A'),
(11, 9, '2024-09-09', 'C'),
(1, 10, '2024-09-10', 'B');

select * from enrollments;


select sql_task10_db1.s.*, sql_task10_db2.courses.* from students as s
full join sql_task10_db2.courses
on s.university=c.university;



-- 1. Use dblink Extension
-- You can use the dblink extension to query tables from another database.

-- Example:

-- First, enable dblink in your database (run as a superuser):

CREATE EXTENSION dblink;

-- Suppose you are connected to sql_task10_db1 and want to join with courses from sql_task10_db2:
--sql_task10_db1 database to join students table from database name as sql_task10_db1 with the
--courses table from data base names as sql_task10_db2

SELECT s.*, c.*
FROM students s
FULL JOIN dblink(
    'dbname=sql_task10_db2 user=postgres password=admin',
    'SELECT course_id, course_name, department, credits, semester, university FROM courses'
) AS c(course_id INT, course_name VARCHAR, department VARCHAR, credits INT, semester VARCHAR, university VARCHAR)
ON s.university = c.university;

-- Replace your_user and your_password with your actual PostgreSQL credentials.




