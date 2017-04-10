ECHO OFF
CLS
:MENU
ECHO.
ECHO ...............................................
ECHO .         Robert's Help Desk .bat File        .
ECHO .   If you run the Rainier audits, they will  .
ECHO .     write to the desktop as username.txt    .
ECHO ...............................................
ECHO.
ECHO 1 - Reset AD password
ECHO 2 - Unlock AD user account
ECHO 3 - Audit User Quota on Rainier R:\ Only
ECHO 4 - Audit User Quota on Rainier, All Share Drives
ECHO 5 - Find Computer Encryption Password
ECHO 6 - EXIT
ECHO.
CHOICE /C:123456
IF ERRORLEVEL 1 SET M=1
IF ERRORLEVEL 2 SET M=2
IF ERRORLEVEL 3 SET M=3
IF ERRORLEVEL 4 SET M=4
IF ERRORLEVEL 5 SET M=5
IF ERRORLEVEL 6 SET M=6
IF %M%==1 GOTO Execute1
IF %M%==2 GOTO Execute2
IF %M%==3 GOTO Execute3
IF %M%==4 GOTO Execute4
IF %M%==5 GOTO Execute5
IF %M%==6 GOTO EOF
:Execute1
@echo off&&powershell.exe -C "& {Import-Module ActiveDirectory; Set-ADAccountPassword ($u=Read-Host 'User') -R;Set-ADUser $u -Ch 1}"
CLS
GOTO MENU
:Execute2
@echo off&&powershell.exe -Command "& {Import-Module ActiveDirectory; Write-Host "Accounts Currently Locked If Any"; Search-ADAccount -LockedOut -UsersOnly | FT SamAccountName; Read-Host "Enter the user account to unlock" | Unlock-ADAccount}"
CLS
GOTO MENU
:Execute3
@echo off
set /P UserName= Enter AD User Name: 
echo Please wait while the R:\ is searched, this may take a while...
dir \\Rainier\department\*.* /s /q | Find /i "%UserName%" > %USERPROFILE%\Desktop\%UserName%.txt
CLS
GOTO MENU
:Execute4
@echo off
set /P UserName= Enter AD User Name: 
Echo Searching for the largest files owned by %UserName%
Echo Output file will be saved to the desktop as %UserName%.txt
Echo Please wait while the R:\ is searched
echo Top 10 Files for "%UserName%" on the R:\ Drive > %USERPROFILE%\Desktop\%UserName%.txt
rainier.exe R:\ /s /t /v /d:a /u:"%UserName%" /n:10 >> %USERPROFILE%\Desktop\%UserName%.txt
Echo Please wait while the G:\ is searched
echo Top 10 Files for "%UserName%" on the G:\ Drive >> %USERPROFILE%\Desktop\%UserName%.txt
rainier.exe G:\ /s /t /v /d:a /u:"%UserName%" /n:10 >> %USERPROFILE%\Desktop\%UserName%.txt
Echo Please wait while the H:\ is searched
echo Top 10 Files for "%UserName%" on their H:\ Drive >> %USERPROFILE%\Desktop\%UserName%.txt
rainier.exe \\Rainier\home\%UserName% /s /t /v /d:a /u:"%UserName%" /n:10 >> %USERPROFILE%\Desktop\%UserName%.txt
Echo Please wait while the U:\ is searched
echo Top 10 Files for "%UserName%" on the U:\ Drive >> %USERPROFILE%\Desktop\%UserName%.txt
rainier.exe U:\ /s /t /v /d:a /u:"%UserName%" /n:10 >> %USERPROFILE%\Desktop\%UserName%.txt
CLS
GOTO MENU
:Execute5
@echo off
set /P TCPassword= Enter Password: 
%~dp0\truecrypt\truecrypt.exe /v truecrypt\truecrypt.tc /a /q /l x /p "%TCPassword%"
timeout 5
set /P ComputerName= Enter PC Name: 
type x:\passwords.csv | find /i "%ComputerName%" > password.txt
type password.txt
pause
echo Press any key to continue...
%~dp0\truecrypt\truecrypt.exe /d /q
del password.txt
CLS
GOTO MENU