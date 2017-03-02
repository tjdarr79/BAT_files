@echo off


psexec \\p0138HR wmic.exe product where name="Camtasia Studio 8" call uninstall /nointeractive



pause