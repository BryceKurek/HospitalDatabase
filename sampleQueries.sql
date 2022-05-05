use hospital;

-- query 1 list names of nurses on call

select E.Fname, E.Lname
from nurse N, on_call O, emp E
where O.Empid = N.Empid and E.Empid = N.Empid;

-- query 2 list names, and department of released patients

select P.Fname, P.Lname, D.Dname
from Patient P, Admitted A, Department D
where P.Pid = A.Pid and A.Day_released is not null and D.Did = A.Did;

-- query 3 list amount of doctors in each department

select D.Dname, Count(*) as Doctors
from Department D, Doctor MD, Works_in 
where W.Empid = MD.Empid and W.Did = D.Did
group by D.Did;

-- Query 4 find the condition of the last admitted patient (by day)

select P.cond
from patient P, admitted A
where P.Pid = A.Pid and A.Day_admitted in (
											select max(A.Day_admitted)
											from admitted A, patient P
											where A.Pid = P.Pid);

-- query 5 name and salary of highest paid manager

select E.Fname, E.Lname, max(D.Salary)
from emp E, Doctor D, Manages M
where E.Empid = D.Empid and M.Empid = D.Empid;