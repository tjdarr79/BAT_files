@echo off
set /P UserName= Enter AD User Name: 
Echo Searching for the largest files owned by %UserName%
Echo Output file will be saved to the desktop as %UserName%.txt
Echo Please wait while the R:\ is searched
echo Top 10 Files for %UserName% on the R:\ Drive > %USERPROFILE%\Desktop\%UserName%.txt
rainier.exe R:\ /s /t /v /d:a /u:"%UserName%" /n:10 >> %USERPROFILE%\Desktop\%UserName%.txt
Echo Please wait while the G:\ is searched
echo Top 10 Files for %UserName% on the G:\ Drive >> %USERPROFILE%\Desktop\%UserName%.txt
rainier.exe G:\ /s /t /v /d:a /u:"%UserName%" /n:10 >> %USERPROFILE%\Desktop\%UserName%.txt
Echo Please wait while the H:\ is searched
echo Top 10 Files for %UserName% on their H:\ Drive >> %USERPROFILE%\Desktop\%UserName%.txt
rainier.exe \\Rainier\home\%UserName% /s /t /v /d:a /u:"%UserName%" /n:10 >> %USERPROFILE%\Desktop\%UserName%.txt
Echo Please wait while the U:\ is searched
echo Top 10 Files for %UserName% on the U:\ Drive >> %USERPROFILE%\Desktop\%UserName%.txt
rainier.exe U:\ /s /t /v /d:a /u:"%UserName%" /n:10 >> %USERPROFILE%\Desktop\%UserName%.txt

