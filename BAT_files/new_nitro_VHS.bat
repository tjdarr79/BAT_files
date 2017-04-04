@echo off

tasklist /s P0165vh

taskkill /s P0165vh /FI "IMAGENAME eq NitroPDF.exe"
pause

psexec \\lt4334 wmic.exe product where name="Nitro Pro 7" call uninstall /nointeractive
psexec \\lt4334 wmic.exe product where name="Nitro Pro 8" call uninstall /nointeractive
psexec \\lt4334 wmic.exe product where name="Nitro Pro 9" call uninstall /nointeractive
psexec \\lt4334 wmic.exe product where name="Nitro Pro 10" call uninstall /nointeractive

xcopy c:\scripts\nitro_pro11_x64.msi "\\p0165vh\c$\windows"
psexec \\p0165vh cmd /c msiexec.exe /i "c:\windows\nitro_pro10_x64.msi" /qb NPSERIAL=234600019515504896

taskkill /s p0165vh /FI "IMAGENAME eq UI0Detect.exe"
pause