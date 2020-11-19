CREATE TABLE Teachers
(
    teacher_id VARCHAR(20) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    phone_number VARCHAR(10),
    email VARCHAR(20) NOT NULL,
    PRIMARY KEY (teacher_id)
)

GO

CREATE TABLE Students
(
    student_id VARCHAR(20) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    phone_number VARCHAR(10),
    email VARCHAR(50) NOT NULL,
    sudent_summary VARCHAR(250),
    PRIMARY KEY (student_id)
)

GO

CREATE TABLE Detention
(
    detention_id VARCHAR(20) NOT NULL,
    student_id VARCHAR(20) NOT NULL
        REFERENCES Students(student_id),
    date_of_detention DATE NOT NULL,
    detention_summary VARCHAR(150) NOT NULL,
    PRIMARY
     KEY (detention_id)
)

GO

CREATE TABLE Student_Guardian
(
    guardian_id VARCHAR(20) NOT NULL,
    student_id VARCHAR(20) NOT NULL
        REFERENCES Students(student_id),
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    phone_number VARCHAR(10) NOT NULL,
    email VARCHAR(100) NOT NULL,
    PRIMARY KEY(guardian_id)
)

GO

CREATE TABLE Guardian_Messages
(
    message_id INT IDENTITY(100,1) PRIMARY KEY,
    guardian_id VARCHAR(20) NOT NULL
        REFERENCES Student_Guardian(guardian_id),
    message_details VARCHAR(250) NOT NULL,
)

GO

CREATE TRIGGER detention_trigger ON Detention
AFTER INSERT
AS
BEGIN
    DECLARE @guardian_id VARCHAR(20)

    DECLARE @student_id VARCHAR(20)
    DECLARE @detention_summary VARCHAR(150)

    SELECT @student_id = student_id
    FROM inserted
    SELECT @detention_summary = detention_summary
    FROM inserted

    SELECT @guardian_id = guardian_id
    FROM Student_Guardian
    WHERE student_id = @student_id

    INSERT Guardian_Messages
        (guardian_id, message_details)
    VALUES(@guardian_id, @detention_summary)

    PRINT('done')
END

GO

CREATE PROCEDURE check_student_detentions
    @student_id VARCHAR(20)
AS
BEGIN
    DECLARE @count INT

    DECLARE @guardian_id VARCHAR(20)

    SELECT @count = COUNT(*)
    FROM Detention
    WHERE student_id = @student_id

    IF (@count >= 3)
    PRINT('Sending warning!')
    SELECT @guardian_id = guardian_id
    FROM Student_Guardian
    WHERE student_id = @student_id

    INSERT Guardian_Messages
        (guardian_id, message_details)
    VALUES(@guardian_id, 'This student has at least 3 detentions. Please contact teacher')
END

GO

--insert into Teachers table
INSERT Teachers
VALUES('200', 'Kumud', 'Majumder', '2127769999', 'email@gmail.com')

 GO

INSERT Teachers
VALUES('201', 'Kumud', 'Majumder', '211269999', 'email2@gmail.com')

 GO

--insert into Students table
INSERT Students
VALUES('400', 'Amadou', 'Jallow', '9179998765', 'email3@cuny.com', 'blalala')

 GO

INSERT Students
VALUES('401', 'Christina', 'Barry', '9178887865', 'email3@cuny.com', 'balalala')

 GO

--insert into Student_Guardian table
INSERT Student_Guardian
VALUES('600', '400', 'Kumuddsdd', 'Majumderdddd', '2127769999', 'email111@gmail.com')

GO

INSERT Student_Guardian
VALUES('601', '401', 'Kumuddsddsd', 'Majumderdddddd', '2126619999', 'email111@gmail.com')

--insert into Detention table
INSERT Detention
VALUES('800', '400', GETDATE(), 'first detention')

GO

INSERT Detention
VALUES('801', '400', GETDATE(), 'second detention')

GO

INSERT Detention
VALUES('802', '400', GETDATE(), 'third detention')

GO

INSERT Detention
VALUES('803', '401', GETDATE(), 'first detention')

GO

-- execute stored procedure
EXEC check_student_detentions @student_id = '400'

SELECT *
FROM Teachers

SELECT *
FROM Students

SELECT *
FROM Detention

SELECT *
FROM Student_Guardian

SELECT *
FROM Guardian_Messages

GO

-- DROP TABLE Detention
-- DROP TABLE Student_Guardian
-- DROP TABLE Teachers
-- DROP TABLE Students
-- DROP TABLE Guardian_Messages
