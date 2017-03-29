DECLARE @pathName NVARCHAR(512) 
--SET @pathName = 'D:\SQL Backup\EZData_MidColumbiaTest2_' + Convert(varchar(8), GETDATE(), 112) + '.bak' 
SET @pathName = 'D:\SQL Backup\EZData_MidColumbiaTest2' +'.bak' 
BACKUP DATABASE [EZData_MidColumbiaTest2] 
--TO DISK = @pathName WITH NOFORMAT, NOINIT, NAME = N'db_backup', SKIP, NOREWIND, NOUNLOAD, STATS = 10
TO DISK = @pathName WITH FORMAT, NAME = N'db_backup', SKIP, NOREWIND, NOUNLOAD, STATS = 10


--SET @pathName = 'D:\SQL Backup\EZData_MidColumbiaTest2_' + Convert(varchar(8), GETDATE(), 112) + '.bak' 
SET @pathName = 'D:\SQL Backup\EZData_dmesleep' +'.bak' 
BACKUP DATABASE [EZData_dmesleep] 
--TO DISK = @pathName WITH NOFORMAT, NOINIT, NAME = N'db_backup', SKIP, NOREWIND, NOUNLOAD, STATS = 10
TO DISK = @pathName WITH FORMAT, NAME = N'db_backup', SKIP, NOREWIND, NOUNLOAD, STATS = 10