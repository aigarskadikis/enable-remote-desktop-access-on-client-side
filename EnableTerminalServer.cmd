@echo off
set path=%path%;%~dp0
set TS=HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server
psexec /accepteula \\%1 reg add "%TS%" /v AllowTSConnections /t REG_DWORD /d 1 /f
psexec \\%1 reg add "%TS%" /v fDenyTSConnections /t REG_DWORD /d 0 /f
psexec \\%1 reg add "%TS%" /v fAllowToGetHelp /t REG_DWORD /d 1 /f
start /w mstsc /v:%1
psexec \\%1 reg add "%TS%" /v AllowTSConnections /t REG_DWORD /d 0 /f
psexec \\%1 reg add "%TS%" /v fDenyTSConnections /t REG_DWORD /d 1 /f
psexec \\%1 reg add "%TS%" /v fAllowToGetHelp /t REG_DWORD /d 0 /f
