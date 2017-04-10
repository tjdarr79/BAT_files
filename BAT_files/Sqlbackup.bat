sqlcmd -S suttonMtn\daytona -U backup -P MCacce55 -i NightlyBackup.sql
7z a -tzip D:\Back up \db_backup_%date%.zip -i! D:\Back up\db_backup_*.bak
del d:\Back up\db_backup_*.bak