@echo off
xcopy c:\micdrivers /E "\\pc3127\c$\"
xcopy c:\Fluency.Direct /E "\\pc3127\c$\"
sleep 30
psexec \\pc3127 cmd.exe /c C:\PhilipsDeviceControlCenterSetup.exe /V" /qn
sleep 30
psexec \\pc3127 cmd.exe /c "c:\Fluency.Direct.9.1.118.7.8.5.v7\fd.client\install_silent.bat" 
pause
