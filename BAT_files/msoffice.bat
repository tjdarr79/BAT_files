@echo off
psexec @"c:\pc.txt" %computername% & cscript “C:\Program Files (x86)\Microsoft Office\Office15\OSPP.VBS” /dstatus >> c:\test\test.txt
pause
