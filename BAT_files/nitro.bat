
@echo off


xcopy c:\scripts\nitro_pro10_x64.msi "\\PC3046\c$\windows"
psexec \\pc3046 cmd /c msiexec.exe /i "c:\windows\nitro_pro10_x64.msi" /qb NPSERIAL=0000000041

taskkill /s pc3046 /FI "IMAGENAME eq UI0Detect.exe"
pause