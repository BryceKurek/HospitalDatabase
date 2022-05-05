use hospital;

-- add new doctor
set @Fname = 'john';
set @Lname = 'smith';
set @phone = '9999999999';
set @Salary = '100000';
set @Doctorate = 'doctorate';

insert into emp (Lname, Fname) values 
(@Lname,@Fname);

set @Empid = (select E.Empid
from emp E
where @Lname = E.Lname and @Fname = E.Fname);

insert into Doctor(Empid, Phone, Salary, Doctorate) values
(@Empid, @phone, @Salary, @Doctorate);

select * from Doctor where @Empid = Doctor.Empid;

-- -------------------------------------------------------

-- add new nurse
set @Fname = 'nancy';
set @Lname = 'drew';
set @phone = '9999999999';
set @Wage_hr = '15';
set @Qualification = 'doctorate';

insert into emp (Lname, Fname) values 
(@Lname,@Fname);

set @Empid = (select E.Empid
from emp E
where @Lname = E.Lname and @Fname = E.Fname);

insert into nurse(Empid, Phone, Wage_hr, Qualification) values
(@Empid, @phone, @Wage_hr, @Qualification);

select * from nurse where @Empid = nurse.Empid;

-- -------------------------------------------------------

-- admit patient 
set @Fname = 'john';
set @Lname = 'doe';
set @cond = 'cond'; -- condition
set @Did = '1';

insert into patient (Lname, Fname, cond) values 
(@Lname,@Fname, @cond);

set @Pid = (select P.Pid
from patient P
where @Lname = P.Lname and @Fname = P.Fname);

insert into Admitted(Did, Pid, Day_admitted) values
(@Did, @Pid, current_date);

select * from patient where @Pid = patient.Pid; 

-- -------------------------------------------------------

-- set on call for employee
set @Empid = '38';
set @Dayw = 'TT'; -- one or two days in format m or tt, m = monday or tt = tuesday and thursday
set @start_time = '00:00:00'; -- hh:mm:ss
set @end_time = '00:00:00'; -- hh:mm:ss

insert into On_call (Empid, Dayw, Start_time, End_time) values
(@Empid, @Dayw, @start_time, @end_time);

select * from on_call where on_call.Empid = @Empid;

-- -------------------------------------------------------

-- set employee as manager/supervisor for department
set @Empid = '38';
set @Did = '1'; -- 1-4

insert into manages (Empid, Did) values
(@Empid, @Did);

select * from manages where manages.Empid = @Empid;

-- -------------------------------------------------------

-- set employee to department
set @Empid = '38';
set @Did = '1'; -- 1-4

insert into works_in (Empid, Did) values
(@Empid, @Did);

select * from works_in where works_in.Empid = @Empid;