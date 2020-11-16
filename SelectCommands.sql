-- Select Commands

SELECT * FROM [TEACHERS] ;

SELECT * FROM [CLASS_DETAILS] ;

SELECT * FROM [CLASSES] ;



select *
from Transcripts

select * 
from Behavior_Monitoring

select * 
from Ref_Detention_Type

select * from Student
SELECT * FROM GUARDIAN
SELECT * From STUDENT_GUARDIAN
-- lets select the detention id and student_id
SELECT * FROM Detention
SELECT * FROM GUARDIAN_MESSAGE



select detention_id, student_id
    from  Detention

-- once we have the student_id we have to look up the guardian_id of the student 

-- find a way to select the data that allows us to enter the detention_id
    -- and then we can get the student_id 
            -- once we have the student_id we look at the student guardian table 
                -- to get the guardian id
SELECT student_id
    FROM Detention
    WHERE detention_id=1

SELECT guardian_id
    FROM STUDENT_GUARDIAN
    WHERE student_id=10101;

-- Nested query to get the guardian id's from the dention_id
-- involving dention table and student_guardian table
SELECT guardian_id
    FROM STUDENT_GUARDIAN
    WHERE student_id IN
        (
            SELECT student_id
            FROM Detention
            WHERE detention_id=1
        )

