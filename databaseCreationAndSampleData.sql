use hospital;

select * from admitted;
select * from department;
select * from doctor;
select * from emp;
select * from manages;
select * from nurse;
select * from on_call;
select * from patient;
select * from works_in;
select * from admitted;


create table emp(
Empid int not null auto_increment,
Lname char(244) not null,
Fname char(244) not null,
primary key (empid));

insert into emp (Lname, Fname) values 
('Divina','Malati'),
('Nathalie','Zarko'),
('Dragoljub','Danylo'),
('Bion','Luciana'),
('Gernot','Cerridwen'),
('Erna','Haney'),
('Deanna','Nixon'),
('Edward','Hill'),
('Jerold','Frye'),
('Irene','Dominquez'),
('Luisa','Lester'),
('Vince','Sloan'),
('Linsay','garrett'),
('Leopold','Saunders'),
('Kirk','Conley'),
('Lindsey','Conley'),
('Orville','Carrillo'),
('Erik','Bradley'),
('Nicolas','Santos'),
('Nigel','Franco'),
('Carey','Riddle'),
('Wyatt','Simpson'),
('Lea','Underwood'),
('Wesley','Gillespie'),
('Virgilio','Yang'),
('Zane','Duke'),
('Andrea','Macias'),
('Janet','Coleman'),
('Velma','Barnett');

create table Doctor(
Empid int not null,
Phone char(12),
Salary float,
Doctorate char(244),
foreign key (empid) references emp(Empid));

insert into Doctor (Empid, Salary, Phone, Doctorate) values 
('1','200000','1238468431','medicine'),
('2','180000','5648546542','medicine'),
('3','120000','7852186478','medicine'),
('4','160000','7856468846','pyschology'),
('5','220000','8946456516','pyschology'),
('11','190000','8949494944','pediatrics'),
('12','250000','7849498963','pediatrics'),
('13','230000','8949456334','medicine'),
('14','170000','7884986865','medicine'),
('15','200000','1964181816','nueroscience'),
('16','210000','7841516132','nueroscience');

create table Nurse(
Empid int not null,
Phone char(12),
Wage_hr float,
Qualification char(244),
foreign key (Empid) references emp(Empid));

insert into Nurse (Empid, Wage_hr, Phone, Qualification) values 
('6','30','7847856456','radiology'),
('7','22','9648648648',null),
('8','30','7846458465','radiology'),
('9','22','8648648618',null),
('10','25','7854984964','radiology'),
('17','22','8786121745',null),
('18','22','9172186521',null),
('19','22','7846521653',null),
('20','22','7811751523',null),
('21','22','7485461238',null),
('22','22','8574652165',null),
('23','22','8946218546',null),
('24','22','8963218965',null),
('25','22','8415165216',null),
('26','22','6562156515',null),
('27','22','5619684652',null),
('28','22','8598965176',null),
('29','25','8951891518','radiology');

create table Patient(
Pid int not null auto_increment,
Fname char(244),
Lname char(244),
cond char(244),
primary key (Pid));

insert into Patient (Fname, Lname, cond) values
('Deandre','Becker','burns'),
('Stantley','Obrien','deep cut'),
('Titus','Humphrey','diabetes'),
('Ernie','Murphy','cancer'),
('Omar','Chang','heart attack'),
('Earline','Escobar','cancer'),
('Nita','Moyer','cancer'),
('Sherri','Sparks','heart attack'),
('Leonard','Pope','diabetes'),
('Jaclyn','Chase','diabetes');

create table Department(
Did int not null auto_increment,
Dname char(244),
primary key (Did));

insert into Department (Dname) values
('Radiology'),
('Surgery'),
('Administration'),
('Pediatrics');

create table On_call(
Empid int not null,
Dayw char(2) not null,
Start_time time not null,
End_time time not null,
foreign key (Empid) references emp(Empid));

insert into On_call (Empid, Dayw, Start_time, End_time) values
('1','WF','14:00:00','20:00:00'),
('4','TT','12:00:00','16:00:00'),
('12','SS','08:00:00','18:00:00'),
('15','WF','08:00:00','16:00:00'),
('6','WF','12:00:00','16:00:00'),
('8','SS','08:00:00','18:00:00'),
('10','TT','12:00:00','16:00:00');

create table Admitted(
Did int not null,
Pid int not null,
Day_admitted date not null,
Day_released date,
foreign key (Did) references Department(Did),
foreign key (Pid) references Patient(Pid));

insert into Admitted (Pid, Did, Day_admitted) values
('1','3','2022-01-15'),
('2','3','2022-02-21'),
('4','1','2022-02-26'),
('5','3','2022-03-19'),
('7','1','2022-02-28'),
('8','3','2022-01-27'),
('9','3','2022-02-02'),
('10','3','2022-03-01');

insert into Admitted (Pid, Did, Day_admitted, Day_released) values
('3','3','2021-12-14', '2022-02-06'),
('6','1','2021-12-03', '2022-01-16');

create table Manages(
Did int not null,
Empid int not null,
foreign key (Did) references Department(Did),
foreign key (Empid) references emp(Empid));

insert into Manages (Did, Empid) values
('1','1'),
('2','15'),
('3','13'),
('4','12');

create table Works_In(
Did int not null,
Empid int not null,
foreign key (Did) references Department(Did),
foreign key (Empid) references emp(Empid));

insert into Works_In (Did,Empid) values
('1','1'),
('1','2'),
('3','3'),
('4','4'),
('3','5'),
('1','6'),
('4','7'),
('1','8'),
('2','9'),
('1','10'),
('1','11'),
('2','12'),
('3','13'),
('3','14'),
('2','15'),
('2','16'),
('1','17'),
('2','18'),
('2','19'),
('3','20'),
('4','21'),
('1','22'),
('2','23'),
('3','24'),
('2','25'),
('3','26'),
('1','27'),
('2','28'),
('1','29');