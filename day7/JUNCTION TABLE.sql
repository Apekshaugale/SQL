create index IND ON EMP1 (ENAME);
SELECT *FROM EMP1;


-- 1. Base Table: Students
CREATE TABLE Students1 (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100) NOT NULL
);

-- 2. Base Table: Courses
CREATE TABLE Courses1 (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL
);

-- 3. Junction Table: Enrollments
CREATE TABLE Enrollments1 (
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE DEFAULT CURRENT_DATE, -- Metadata (Optional)
    Grade VARCHAR(2),                         -- Metadata (Optional)
    
    -- Composite Primary Key guarantees no duplicate pairs
    PRIMARY KEY (StudentID, CourseID), 
    
    -- Foreign Keys link back to the parent tables
    FOREIGN KEY (StudentID) REFERENCES Students1(StudentID) ON DELETE CASCADE,
    FOREIGN KEY (CourseID) REFERENCES Courses1(CourseID) ON DELETE CASCADE
);

select *from ENROLLMENTS1;