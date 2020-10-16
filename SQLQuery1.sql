create database PrJob1_61_12
on primary
(
	name ="PrJob_dat",
	FILENAME = "C:\Program Files\Microsoft SQL Server\MSSQL10.MSSQLSERVER\MSSQL\DATA\PrJob.mdf",
	size = 4,
	MAXSIZE = 10
)
log on 
(
	name ="PrJob_log",
	FILENAME = "C:\Program Files\Microsoft SQL Server\MSSQL10.MSSQLSERVER\MSSQL\DATA\PrJob.ldf",
	size = 4,
	MAXSIZE = 10
)
go
use PrJob1_61_12
go
create table Departament 
(
	Dept_no char(2) primary key not null,
	Dept_name varchar(50) not null,
	location varchar(50) not null
)
create table Employee 
(
	Emp_no int primary key not null,	
	Emp_fname varchar(50) not null,	
	Emp_lname varchar(50) not null,	
	Dept_no char(2) not null
)
create table Project 
(
	Project_no char(2) primary key not null,	
	Project_name varchar(50) not null,	
	Budget int not null
)
create table Works_on
(
	Emp_no int not null,	
	Project_no char(2) not null,
	Job varchar(50),
	Enter_date varchar(50) 
)
go
alter table Works_on
add constraint Emp_no_fk foreign key (Emp_no) references Employee(Emp_no),
constraint Project_no_fk foreign key (Project_no) references Project(Project_no)
alter table Employee
add constraint Dept_no_fk foreign key (Dept_no) references Departament(Dept_no)

insert Departament values ('D1','Research','Dallas')
insert Departament values ('D2','Accounting','Seattle')
insert Departament values ('D3','Marketing','Dallas')

insert Employee values (25384,'Matthew','Smith','D3')
insert Employee values (10102,'Ann','Jones','D3')
insert Employee values (18316,'John','Barrimore','D1')
insert Employee values (29346,'James','James','D2')
insert Employee values (9031,'Elsa','Bertoni','D2')
insert Employee values (2581,'Elke','Hansel','D2')
insert Employee values (28559,'Sybill','Moser','D1')

insert Project values ('P1','Apollo',120000)
insert Project values ('P2','Germini',95000)
insert Project values ('P3','Mercury',185600)


insert Works_on values (10102,'P1','Analyst', '2006.10.1')
insert Works_on values (10102,'P3','Manager', '2008.1.1')
insert Works_on values (25384,'P2','Clerk', '2007.2.15')
insert Works_on values (18316,'P2',Null, '2007.6.1')
insert Works_on values (29346,'P2',Null, '2006.12.15')
insert Works_on values (2581,'P3','Analyst', '2007.10.15')
insert Works_on values (9031,'P1','Manager', '2007.4.15')
insert Works_on values (28559,'P1',Null, '2007.8.1')
insert Works_on values (9031,'P2','Clerk', '2008.2.1')
insert Works_on values (9031,'P3','Clerk', '2006.11.15')
insert Works_on values (10102,'P1','Clerk', '2005.1.4')
insert Works_on values (10102,'P1','Clerk', '2003.1.4')
insert Works_on values (29346,'P1','Clerk', '2007.1.4')
insert Works_on values (29346,'P1','Clerk', '2007.1.4')


select *from Departament
select *from Employee
select *from Project
select *from Works_on

EXEC sp_addumpdevice 'disk', 'KoZel_Backup_61', 'C:\Program Files\Microsoft SQL Server\MSSQL10.MSSQLSERVER\MSSQL\Backup\KoZel_Backup.bak'
EXEC sp_addumpdevice 'disk', 'KoZel_Backup_61_log', 'C:\Program Files\Microsoft SQL Server\MSSQL10.MSSQLSERVER\MSSQL\Backup\KoZel_Backup_log.bak'
Backup database PrJob1_61_12 to KoZel_Backup_61 with init

insert Departament values ('I2','Maslooooy', 'Fuloy')

Backup log PrJob1_61_12 to KoZel_Backup_61_log with init

insert Departament values ('I1','Maslofigooy', 'Figarooo')

Backup log PrJob1_61_12 to KoZel_Backup_61_log

create table Proverka( Pole1 char(8) primary key not null, Pole2 char(8))
insert Proverka values('12','34')

Backup database PrJob1_61_12 to KoZel_Backup_61 with differential

delete from Departament where Dept_no = 'I1'
drop table Proverka

 

use master
restore database PrJob1_61_12 from KoZel_Backup_61 file = 2 with recovery