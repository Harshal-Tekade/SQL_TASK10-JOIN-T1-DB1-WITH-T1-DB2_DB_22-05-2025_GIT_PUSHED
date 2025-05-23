CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR not null,
    department VARCHAR not null,
    credits INT not null,
    semester VARCHAR not null,
	university varchar not null
);


INSERT INTO courses (course_name, department, credits, semester,university) VALUES
('Database Systems', 'Computer Science', 4, 'Fall','Mumbai_University'),
('Calculus I', 'Mathematics', 3, 'Fall','Mumbai_University'),
('English Literature', 'Arts', 3, 'Spring','Mumbai_University'),
('Physics I', 'Science', 4, 'Fall','Mumbai_University'),
('Intro to Psychology', 'Social Sciences', 3, 'Spring','Mumbai_University'),
('Algorithms', 'Computer Science', 4, 'Spring','Delhi_University'),
('Statistics', 'Mathematics', 3, 'Fall','Delhi_University'),
('World History', 'History', 3, 'Spring','Delhi_University'),
('Organic Chemistry', 'Science', 4, 'Fall','Delhi_University'),
('Creative Writing', 'Arts', 3, 'Spring','Delhi_University'),
('Linear Algebra', 'Mathematics', 3, 'Fall','Pune_University'),
('Data Structures', 'Computer Science', 4, 'Fall','Pune_University'),
('Microeconomics', 'Economics', 3, 'Spring','Pune_University'),
('Macroeconomics', 'Economics', 3, 'Fall','Pune_University'),
('Art History', 'Arts', 3, 'Spring','Pune_University'),
('Biochemistry', 'Science', 4, 'Fall','Nagpur_University'),
('Machine Learning', 'Computer Science', 4, 'Spring','Nagpur_University'),
('Sociology', 'Social Sciences', 3, 'Fall','Nagpur_University'),
('Ethics', 'Philosophy', 3, 'Spring','Nagpur_University'),
('Public Speaking', 'Communications', 2, 'Spring','Nagpur_University');


select * from courses;


CREATE TABLE instructors (
    instructor_id SERIAL PRIMARY KEY,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    email VARCHAR UNIQUE NOT NULL,
    department VARCHAR NOT NULL,
    university VARCHAR NOT NULL
);

INSERT INTO instructors (first_name, last_name, email, department, university) VALUES
('Alice', 'Johnson', 'alice.johnson@univ1.edu', 'Computer Science', 'Nagpur_University'),
('Bob', 'Smith', 'bob.smith@univ2.edu', 'Mathematics', 'Nagpur_University'),
('Clara', 'Davis', 'clara.davis@univ1.edu', 'Physics', 'Pune_University'),
('David', 'Lee', 'david.lee@univ3.edu', 'Chemistry', 'Pune_University'),
('Eva', 'Martinez', 'eva.martinez@univ2.edu', 'English', 'Delhi_University'),
('Frank', 'Brown', 'frank.brown@univ1.edu', 'Computer Science', 'Delhi_University'),
('Grace', 'Kim', 'grace.kim@univ4.edu', 'Biology', 'Mumbai_University'),
('Henry', 'Wilson', 'henry.wilson@univ3.edu', 'Economics', 'Mumbai_University'),
('Irene', 'Nguyen', 'irene.nguyen@univ4.edu', 'Mathematics', 'Pune_University'),
('Jack', 'Patel', 'jack.patel@univ2.edu', 'Philosophy', 'Delhi_University');

select * from instructors;

create extension dblink;

--sql_task10_db2 database: query to join courses table from database name as sql_task10_db2 with the
--students table from data base names as sql_task10_db1

select c.*,s.* 
from courses as c
full join dblink('dbname=sql_task10_db1 user= postgres password=admin',
				'select student_id, first_name, last_name, email, city, university from students')
				as s(student_id int, first_name VARCHAR, last_name VARCHAR, email VARCHAR, city VARCHAR, university varchar)
on c.university=s.university;

