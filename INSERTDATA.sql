-- INSERT DATA


-- Teacher Details
INSERT INTO TEACHER_DETAILS
( -- Columns to insert data into
 [Fname], [Lname], [Salary]
)
VALUES
( -- First row: values for the columns in the list above
 'Name1', 'LastName', '60000'
);

INSERT INTO TEACHER_DETAILS
( -- Columns to insert data into
 [Fname], [Lname], [Salary]
)
VALUES
( -- First row: values for the columns in the list above
 'Name2', 'LastName2', '60000'
);
INSERT INTO TEACHER_DETAILS
( -- Columns to insert data into
 [Fname], [Lname], [Salary]
)
VALUES
( -- First row: values for the columns in the list above
 'Name3', 'LastName3', '60000'
);

-- insert into teachers
INSERT INTO TEACHERS
( -- Columns to insert data into
 [Teacher_id] , [Teacher_name] , [Teacher_lastName], [Teacher_salary]
)
VALUES
( -- First row: values for the columns in the list above
 '004' , 'Name4', 'LastName4', '6000'
);
INSERT INTO TEACHERS
( -- Columns to insert data into
 [Teacher_id] , [Teacher_name] , [Teacher_lastName], [Teacher_salary]
)
VALUES
( -- First row: values for the columns in the list above
 '002' , 'Name2', 'LastName2', '60000'
);

-- insert into class_details
INSERT INTO CLASS_DETAILS
( -- Columns to insert data into
 [class_name] , [class_size] , [class_subject]
)
VALUES
( -- First row: values for the columns in the list above
 'Math01' , '15', 'Math'
);

INSERT INTO CLASS_DETAILS
( -- Columns to insert data into
 [class_name] , [class_size] , [class_subject]
)
VALUES
( -- First row: values for the columns in the list above
 'Math02' , '16', 'Math'
);

INSERT INTO CLASS_DETAILS
( -- Columns to insert data into
 [class_name] , [class_size] , [class_subject]
)
VALUES
( -- First row: values for the columns in the list above
 'Math03' , '17', 'Math'
);


INSERT INTO CLASSES
( -- Columns to insert data into
 [cc_id] , [cc_name] , [cc_size], [cc_subject], [cc_teacher_id]
)
VALUES
( -- First row: values for the columns in the list above
 '100' , 'Math01', '15', 'Math', '1'
);

-- cc_id is unique to a class_name, class_size, class_subject, class_teacher_id
INSERT INTO CLASSES
( -- Columns to insert data into
 [cc_id] , [cc_name] , [cc_size], [cc_subject], [cc_teacher_id]
)
VALUES
( -- First row: values for the columns in the list above
 '105' , 'Math05', '18', 'Math', '5'
);

-- How to insert data in one table and then 
-- automatically insert the data into the other tables



insert Students
values (10101, 'This is dummy detail', 
'this is not a real student')
go
insert Students
values (10102, 'This is dummy detail', 
'this is not a real student')
go
insert Students
values (10103, 'This is dummy detail', 
'this is not a real student')
go
insert Students
values (10104, 'This is dummy detail', 
'this is not a real student')
go
insert Students
values (10105, 'This is dummy detail', 
'this is not a real student')
go

insert Transcripts
values(99, 10101, '6/17/18', 'idk what to say')
go
insert Transcripts
values(98, 10102, '6/17/18', 'idk what to say')
go 
insert Transcripts
values(97, 10103, '6/17/18', 'idk what to say')
go
insert Transcripts
values(96, 10104, '6/17/18', 'idk what to say')
go
insert Transcripts
values(95, 10105, '6/17/18', 'idk what to say')
go

insert Behavior_Monitoring
values(51, 10101, 'Monitoring some stsuff')
go
insert Behavior_Monitoring
values(52, 10102, 'Monitoring some stsuff')
go
insert Behavior_Monitoring
values(53, 10103, 'Monitoring some stsuff')
go
insert Behavior_Monitoring
values(54, 10104, 'Monitoring some stsuff')
go
insert Behavior_Monitoring
values(55, 10105, 'Monitoring some stsuff')
go

insert Ref_Detention_Type
values(71, 'A type of detention')
go
insert Ref_Detention_Type
values(72, 'A type of detention')
go
insert Ref_Detention_Type
values(73, 'A type of detention')
go
insert Ref_Detention_Type
values(74, 'A type of detention')
go
insert Ref_Detention_Type
values(75, 'A type of detention')
go

insert Detention
values(1, 71, 10101, '6/18/21', '6/19/21', 
'detention details', 'other details i guess')
go
insert Detention
values(2, 72, 10102, '6/18/21', '6/19/21', 
'detention details', 'other details i guess')
go
insert Detention
values(3, 73, 10103, '6/18/21', '6/19/21', 
'detention details', 'other details i guess')
go
insert Detention
values(4, 74, 10104, '6/18/21', '6/19/21', 
'detention details', 'other details i guess')
go
insert Detention
values(5, 75, 10105, '6/18/21', '6/19/21', 
'detention details', 'other details i guess')
go