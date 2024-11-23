CREATE DATABASE `EMPLOYING_COMPANY`;
USE employing_company;

CREATE TABLE Company (
    Name VARCHAR(100) PRIMARY KEY,
	Email VARCHAR(100),
    City VARCHAR(50),
    Street VARCHAR(100),
    ZipCode VARCHAR(20)
);
CREATE TABLE USERS (
    UserID INT PRIMARY KEY,
    Username VARCHAR(50),
    Password VARCHAR(100),
    Email VARCHAR(100),
    Resumes TEXT,
    ExperienceLevels VARCHAR(50),
    CName VARCHAR(100),
    JobID INT,
    FOREIGN KEY (CName) REFERENCES Company(Name),
    FOREIGN KEY (JobID) REFERENCES JOBS(JobID)
);
CREATE TABLE JOBS (
    JobID INT PRIMARY KEY,
    JobTitle VARCHAR(100),
	EmploymentType VARCHAR(50),
    WorkHours INT,
	ExperienceLevelsRequired VARCHAR(50),
    Salary DECIMAL(10, 2) 
);
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
	JobPosition VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
	DateOfBirth DATE,
    FirstName VARCHAR(50),
    MiddleName VARCHAR(50),
    LastName VARCHAR(50)
);
CREATE TABLE Feedback (
    CompanyName VARCHAR(100),
    Commenter VARCHAR(100),
    Date DATE,
    Text TEXT,
    FOREIGN KEY (CompanyName) REFERENCES Company(Name)
);
CREATE TABLE Interview (
    InterviewerName VARCHAR(100),
    CandidateName VARCHAR(100),
    TimeOfInterview TIME,
    DateOfInterview DATE,
    ResultOfInterview VARCHAR(50),
    JobID INT,
    EmployeeID INT,
    PRIMARY KEY (InterviewerName, DateOfInterview),
    FOREIGN KEY (JobID) REFERENCES JOBS(JobID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);
CREATE TABLE User_Skills (
    UserID INT,
    SkillName VARCHAR(50),
    FOREIGN KEY (UserID) REFERENCES USERS(UserID)
);
CREATE TABLE JOB_Skills (
    JobID INT,
    SkillsReq VARCHAR(100),
    FOREIGN KEY (JobID) REFERENCES JOBS(JobID)
);
INSERT INTO Company (Name, Email, City, Street, ZipCode) 
VALUES 
    ('Company A', 'companya@example.com', 'City A', 'Street A', '12345'),
    ('Company B', 'companyb@example.com', 'City B', 'Street B', '23456'),
    ('Company C', 'companyc@example.com', 'City C', 'Street C', '34567'),
    ('Company D', 'companyd@example.com', 'City D', 'Street D', '45678'),
    ('Company E', 'companye@example.com', 'City E', 'Street E', '56789');
    
SELECT *
FROM company ;
    
INSERT INTO JOBS (JobID, JobTitle, EmploymentType, WorkHours, ExperienceLevelsRequired, Salary) 
VALUES 
    (1, 'Software Engineer', 'Full-time', 40, 'Intermediate', 80000.00),
    (2, 'Data Scientist', 'Full-time', 40, 'Senior', 100000.00),
    (3, 'Marketing Manager', 'Full-time', 40, 'Senior', 90000.00),
    (4, 'Graphic Designer', 'Part-time', 20, 'Entry', 50000.00),
    (5, 'Customer Service Representative', 'Full-time', 40, 'Entry', 45000.00);
SELECT *
FROM jobs;

INSERT INTO Employees (EmployeeID, JobPosition, Email, DateOfBirth, FirstName, MiddleName, LastName)
VALUES 
    (6, 'Secretary', 'nour@example.com', '1993-08-25', 'Nour', '', 'Ahmad'),
    (7, 'Salesperson', 'ali@example.com', '1987-04-17', 'Ali', '', 'Rashid'),
    (8, 'Manager', 'mariam@example.com', '1980-12-05', 'Mariam', 'Abdul', 'Kareem'),
    (9, 'Engineer', 'sara@example.com', '1991-06-28', 'Sara', '', 'Hassan'),
    (10, 'Accountant', 'abdullah@example.com', '1983-09-10', 'Abdullah', '', 'Mahmoud');    
SELECT *
FROM employees; 
INSERT INTO USERS (UserID, Username, Password, Email, Resumes, ExperienceLevels, CName, JobID) 
VALUES 
    (1, 'user1', 'password1', 'user1@example.com', 'Resume for User 1', 'Intermediate', 'Company A', 1),
    (2, 'user2', 'password2', 'user2@example.com', 'Resume for User 2', 'Senior', 'Company B', 2),
    (3, 'user3', 'password3', 'user3@example.com', 'Resume for User 3', 'Senior', 'Company C', 3),
    (4, 'user4', 'password4', 'user4@example.com', 'Resume for User 4', 'Entry', 'Company D', 4),
    (5, 'user5', 'password5', 'user5@example.com', 'Resume for User 5', 'Entry', 'Company E', 5);
SELECT *
FROM users;

INSERT INTO Feedback (CompanyName, Commenter, Date, Text) 
VALUES 
    ('Company A', 'User1', '2024-02-09', 'Great company to work with.'),
    ('Company B', 'User2', '2024-02-09', 'Enjoyed my experience with this company.'),
    ('Company C', 'User3', '2024-02-09', 'Professional and efficient services provided.'),
    ('Company D', 'User4', '2024-02-09', 'Had some issues with communication, but overall satisfied.'),
    ('Company E', 'User5', '2024-02-09', 'Would not recommend this company, poor customer service.');
SELECT *
FROM feedback;

INSERT INTO Interview (InterviewerName, CandidateName, TimeOfInterview, DateOfInterview, ResultOfInterview, JobID, EmployeeID) 
VALUES 
    ('Interviewer1', 'Candidate1', '09:00:00', '2024-02-09', 'Accepted', 1, 6),
    ('Interviewer2', 'Candidate2', '10:30:00', '2024-02-09', 'Rejected', 2, 7),
    ('Interviewer3', 'Candidate3', '11:00:00', '2024-02-09', 'Pending', 3, 6),
    ('Interviewer4', 'Candidate4', '12:30:00', '2024-02-09', 'Accepted', 4, 8),
    ('Interviewer5', 'Candidate5', '13:00:00', '2024-02-09', 'Rejected', 5, 9);
SELECT *
FROM interview;

INSERT INTO User_Skills (UserID, SkillName)
VALUES 
    (1, 'Java'),
    (1, 'Python'),
    (1, 'SQL'),
    (2, 'Machine Learning'),
    (2, 'Python');
SELECT *
FROM user_skills;

INSERT INTO JOB_Skills (JobID, SkillsReq) 
VALUES 
    (1, 'Java, Python, SQL'),
    (2, 'Machine Learning, Python, Statistics'),
    (3, 'Marketing Strategy, Communication, Team Management'),
    (4, 'Adobe Photoshop, Illustrator, UI/UX Design'),
    (5, 'Customer Support, Communication, Problem Solving');
SELECT *
FROM  job_skills ; 

UPDATE JOBS
SET Salary = 90000
WHERE JobID = 5;

SELECT *
FROM JOBS;

UPDATE Interview
SET ResultOfInterview = 'Unsuccessful'
WHERE InterviewerName = 'John Interviewer';

SELECT *
FROM Interview;

DELETE FROM JOB_Skills
WHERE JobID = 5;

SELECT *
FROM JOB_Skills;

DELETE FROM user_skills
WHERE SkillName='Machine Learning';

SELECT *
FROM user_skills;

SELECT *
FROM Feedback
WHERE Commenter = 'User1';

SELECT InterviewerName
FROM Interview
WHERE CandidateName IN (SELECT CandidateName FROM Interview
WHERE ResultOfInterview = 'Accepted');

SELECT Commenter, 
COUNT(*) AS FeedbackCount
FROM Feedback
GROUP BY Commenter;

SELECT Company.Name, COUNT(USERS.UserID) AS UsersCount
FROM Company, USERS 
where Company.Name = USERS.CName
GROUP BY Company.Name
HAVING COUNT(USERS.UserID) <= 1;

SELECT *
FROM Feedback
ORDER BY Date DESC;

SELECT CandidateName, 
MAX(DateOfInterview) AS LatestInterviewDate
FROM Interview
GROUP BY CandidateName;

SELECT U.Username, U.CName
FROM USERS U
inner JOIN Company C ON U.CName = C.Name
WHERE U.ExperienceLevels = 'Intermediate';

SELECT U.CName, 
COUNT(*) AS UserCount
FROM USERS U
WHERE U.ExperienceLevels = 'Intermediate'
GROUP BY U.CName
HAVING COUNT(*) >= 1;

SELECT * 
FROM INTERVIEW
WHERE EmployeeID not IN (SELECT DISTINCT EmployeeID FROM Interview
WHERE EmployeeID = 1);

SELECT Users.*, Company.Name AS "CompanyName"
FROM Users
JOIN Company ON Users.CName = Company.Name;