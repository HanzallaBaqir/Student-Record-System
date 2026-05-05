
DROP DATABASE StudentRecordDB;
CREATE DATABASE StudentRecordDB;
USE StudentRecordDB;



CREATE TABLE Department (
    Department_ID INT PRIMARY KEY AUTO_INCREMENT,
    Department_Name VARCHAR(100) NOT NULL UNIQUE,
    Office_Location VARCHAR(100)
);


CREATE TABLE Student (
    Student_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Age INT CHECK (Age BETWEEN 15 AND 60),
    Class VARCHAR(50),
    Address VARCHAR(255),
    Department_ID INT,
    
    FOREIGN KEY (Department_ID) REFERENCES Department(Department_ID)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);



CREATE TABLE Teacher (
    Teacher_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Department_ID INT,
    
    FOREIGN KEY (Department_ID) REFERENCES Department(Department_ID)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);



CREATE TABLE Course (
    Course_ID INT PRIMARY KEY AUTO_INCREMENT,
    Course_Name VARCHAR(100) NOT NULL,
    Credits INT CHECK (Credits > 0),
    Teacher_ID INT,
    
    FOREIGN KEY (Teacher_ID) REFERENCES Teacher(Teacher_ID)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);



CREATE TABLE Enrollment (
    Enrollment_ID INT PRIMARY KEY AUTO_INCREMENT,
    Student_ID INT,
    Course_ID INT,
    Enrollment_Date DATE DEFAULT (CURRENT_DATE),

    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID)
        ON DELETE CASCADE,
    FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID)
        ON DELETE CASCADE,

    UNIQUE (Student_ID, Course_ID)
);


INSERT INTO Department (Department_Name, Office_Location)
VALUES 
('Computer Science', 'Block A'),
('Electrical Engineering', 'Block B'),
('Business Administration', 'Block C');



INSERT INTO Teacher (Name, Email, Department_ID)
VALUES
('Ali Khan', 'ali@uni.com', 1),
('Sara Ahmed', 'sara@uni.com', 2),
('John Smith', 'john@uni.com', 3);



INSERT INTO Student (Name, Age, Class, Address, Department_ID)
VALUES
('Hanzala Baqir', 21, 'BSCS-4', 'Rawalpindi', 1),
('Ahmed Ali', 22, 'BSCS-4', 'Islamabad', 1),
('Usman Khan', 23, 'BSEE-3', 'Lahore', 2),
('Ayesha Noor', 20, 'BBA-2', 'Karachi', 3);



INSERT INTO Course (Course_Name, Credits, Teacher_ID)
VALUES
('Database Systems', 3, 1),
('Electrical Circuits', 4, 2),
('Marketing Principles', 3, 3);


INSERT INTO Enrollment (Student_ID, Course_ID)
VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 3),
(1, 3);





SELECT s.Student_ID, s.Name, s.Class, d.Department_Name
FROM Student s
LEFT JOIN Department d ON s.Department_ID = d.Department_ID;




SELECT s.Name AS Student, c.Course_Name
FROM Enrollment e
JOIN Student s ON e.Student_ID = s.Student_ID
JOIN Course c ON e.Course_ID = c.Course_ID;


SELECT t.Name AS Teacher, c.Course_Name
FROM Course c
JOIN Teacher t ON c.Teacher_ID = t.Teacher_ID;



SELECT d.Department_Name, COUNT(s.Student_ID) AS Total_Students
FROM Department d
LEFT JOIN Student s ON d.Department_ID = s.Department_ID
GROUP BY d.Department_Name;



SELECT COUNT(*) AS Total_Students FROM Student;


SELECT AVG(Age) AS Average_Age FROM Student;


USE StudentRecordDB;
SHOW TABLES;

DESCRIBE Student;
SELECT * FROM Student;


INSERT INTO Student (Name, Age, Class, Address, Department_ID)
VALUES ('Ali Raza', 22, 'BSCS-3', 'Lahore', 1);

SELECT * FROM Student;

