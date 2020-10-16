create database PJ_RESTORE
use PJ_RESTORE
go

create table pc
(
	cpu varchar(30) not null primary key,
	gpu varchar(40) not null,
	ram int not null,
	hdd int not null
)

create table software
(
	os varchar(50) not null primary key,
	manufacturer varchar(30)
)

use master
go

exec sp_addumpdevice 'disk', 'RESTORE_DISK', 'C:\Program Files\Microsoft SQL Server\MSSQL10.MSSQLSERVER\MSSQL\Backup\RESTORE_DISK.bak'
exec sp_dropdevice 'RESTORE_DISK'

backup database PJ_RESTORE to RESTORE_DISK with init
backup log PJ_RESTORE to RESTORE_DISK with init
backup database PJ_RESTORE to RESTORE_DISK with differential

use master
go

drop database PJ_RESTORE

restore database PJ_RESTORE from RESTORE_DISK with norecovery
restore log PJ_RESTORE from RESTORE_DISK with norecovery
restore database PJ_RESTORE from RESTORE_DISK with file=3, recovery