create database EmployeeManagement;

create table Employees(
EmployeeID int PRIMARY KEY identity,
Firstname varchar(255) not null,
Lastname varchar(255) not null,
Salary int not null,
DepartmentID int not null,
Foreign key (DepartmentID) REFERENCES Departments(DepartmentID)
);

create table Departments(
DepartmentID int Primary key identity ,
Departmentname varchar(255)
);

INSERT INTO Employees(Firstname, Lastname, Salary, DepartmentID)
VALUES
    ('Alice', 'Johnson', 75000, 1),
    ('Bob', 'Williams',  65000, 1),
    ('Charlie', 'Davis',  70000, 1),
    ('Diana', 'Miller',  60000, 3),
    ('Edward', 'Lee',  62000, 3),
    ('Fiona', 'Clark',  68000, 3),
    ('George', 'Taylor', 80000,2),
    ('Hannah', 'Moore',  58000,2),
    ('Ian', 'Johnson',  67000,3),
    ('Jessica', 'Smith',  72000,1);

	INSERT INTO Departments ( DepartmentName)
VALUES
    ( 'HR'),
    ( 'IT'),
    ( 'Sales');

	Update Employees set Salary = Salary+(Salary*0.10)

	select * from Employees

	Delete from Employees where Salary = (select Min(Salary) from Employees)

create login HR_Manager with password = 'password';

create user HR_Manager for login HR_Manager;

grant select on dbo.Employees to HR_Manager;

Revoke insert on dbo.Employees to HR_Manager;

create trigger Tr_insert_employee on Employees
after insert
as
begin
select * from inserted
end

create trigger Tr_update_employee on Employees
after update
as
begin
select * from deleted
select * from inserted
end

create trigger Tr_delete_employee on Employees
after delete
as
begin
select * from deleted
end


SELECT * FROM Employees WHERE LastName LIKE 'S%';

SELECT * FROM Employees WHERE FirstName LIKE '%an%';

SELECT * FROM Employees WHERE LastName LIKE '%son';


create table Students(
StudentID int PRIMARY KEY identity,
Firstname varchar(255) not null,
Lastname varchar(255) not null,
Age int not null,
GPA decimal not null,
CourseID int not null,
Foreign Key (CourseID) References Courses(CourseID)
);

create table Courses(
CourseID int Primary key identity,
CourseNAME varchar(255) not null,
Instructor varchar(255) not null
);

INSERT INTO Students(Firstname, Lastname, Age, GPA,CourseID)
VALUES
    ('Alice', 'Johnson', 23, 3.1, 1),
    ('Bob', 'Williams',  21, 2.9, 1),
    ('Charlie', 'Davis',  32, 3.5, 2),
    ('Diana', 'Miller',  19, 3.3, 3),
    ('Edward', 'Lee',  20, 4.0, 3),
    ('Fiona', 'Clark',  24, 3.2, 3)


	INSERT INTO Courses(CourseNAME, Instructor)
	VALUES
	     ('Computer Science', 'Wahab'),
		 ('Introduction to Data Science', 'Fatima'),
		 ('Business Analytics and Decision Making', 'Ahmed')


SELECT FirstName, LastName, GPA FROM Students WHERE GPA = (SELECT MAX(GPA) FROM Students);

SELECT c.CourseName, COUNT(e.StudentID) AS NumEnrolled FROM Courses c LEFT JOIN Students e ON c.CourseID = e.CourseID GROUP BY c.CourseID, c.CourseName;


SELECT AVG(s.GPA) AS AvgGPA FROM Students s JOIN Courses c ON s.CourseID = c.CourseID WHERE c.CourseName = 'Computer Science';
