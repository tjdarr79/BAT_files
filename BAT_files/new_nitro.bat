
@echo off

tasklist /s lt4334

taskkill /s lt4334 /FI "IMAGENAME eq NitroPDF.exe"
pause

psexec \\lt4334 wmic.exe product where name="Nitro Pro 7" call uninstall /nointeractive
psexec \\lt4334 wmic.exe product where name="Nitro Pro 8" call uninstall /nointeractive
psexec \\lt4334 wmic.exe product where name="Nitro Pro 9" call uninstall /nointeractive
psexec \\lt4334 wmic.exe product where name="Nitro Pro 10" call uninstall /nointeractive

xcopy c:\scripts\nitro_pro10_x64.msi "\\lt4334\c$\windows"
psexec \\lt4334 cmd /c msiexec.exe /i "c:\windows\nitro_pro10_x64.msi" /qb NPSERIAL=00000041

taskkill /s lt4334 /FI "IMAGENAME eq UI0Detect.exe"
pause