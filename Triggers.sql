-- every time we insert a dention row
    -- email will be sent to the guardian (enter a new row of data for
    -- gaurdian message )

    -- Data we have access to detention (detention_id, student_id)
                        -- Student_guardian (guardian_id , student_id)
                            -- from this table we gather the guardians of the student

-- CONN: only one guardian is being notified the last one
CREATE TRIGGER detention_trigger1
    ON DETENTION
    AFTER INSERT
    AS
    
    BEGIN
        DECLARE @student_id VARCHAR(20)  -- should be INT - actually dosent matter
        DECLARE @detention_summary VARCHAR(50)
        DECLARE @guardian_id VARCHAR(20)
        -- DECLARE @message_id VARCHAR(50)
        
        -- variables from DETENTION TABLE
        SELECT @student_id = student_id FROM inserted
        SELECT @detention_summary = detention_summary FROM inserted
        select @guardian_id = guardian_id FROM STUDENT_GUARDIAN
            WHERE student_id = @student_id   
        -- SELECT guardian_id FROM student_guardian 
        --     WHERE student_id = @student_id 
        
        INSERT INTO guardian_message(
            guardian_id, message_details
        )
        -- we inserted the value of detention_summary into message_details?
        VALUES(  @guardian_id, @detention_summary)
    
        PRINT('done')
        END
    GO

    -- SELECT guardian_id FROM student_guardian 
    --         WHERE student_id = @student_id


    --  DECLARE @cnt INT
    --     @cnt = SELECT guardian_id FROM student_guardian 
    --         WHERE student_id = '10101'