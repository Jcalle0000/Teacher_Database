CREATE TRIGGER detention_trigger2
    ON DETENTION
    AFTER INSERT
    AS
        BEGIN
            DECLARE @student_id int  --VARCHAR(20)  -- should be INT - actually dosent matter
            DECLARE @detention_summary VARCHAR(50)
            
            -- student_id and detention_summary 
            -- are inserted into the detention table
            SELECT @student_id = student_id FROM inserted
            SELECT @detention_summary = detention_summary FROM inserted
            
            CREATE TABLE #guardianTempTable (
                id int,
                message_m VARCHAR(50)
            )

            -- if a student has multiple guardians, 
            -- it will select all of them 

            INSERT INTO #guardianTempTable (id)
                SELECT guardian_id FROM STUDENT_GUARDIAN WHERE student_id=@student_id

            UPDATE #guardianTempTable SET message_m = @detention_summary
           
            INSERT INTO GUARDIAN_MESSAGE ( message_details ,guardian_id )
                SELECT message_m, id FROM #guardianTempTable

            PRINT('done')
        END
    
-- DECLARE @guardians table (Id int)
-- IF (guardian_id FROM student_guardian where student_id = '10101')

-- SELECT * FROM STUDENT_GUARDIAN
--     WHERE Id (in)

--     set @guardians = select guardian_id FROM student_guardian


-- DECLARE @guardians table (Id int)
-- insert into @guardians select guardian_id from STUDENT_GUARDIAN WHERE student_id='10101'

-- select Id from @guardians
-- -- https://www.sqlservertutorial.net/sql-server-user-defined-functions/sql-server-table-variables/

-- select guardian_id 

--     into #myTemp

--     FROM student_guardian
--         where student_id=10101

-- -- Get the data 
-- select *from #myTemp
-- ALTER TABLE #myTemp ADD message_details VARCHAR(50) 

-- UPDATE #myTemp set message_details = 'test'
