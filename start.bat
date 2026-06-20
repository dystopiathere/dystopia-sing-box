@echo off

set "SINGBOX_DIR=%~dp0"
if "%SINGBOX_DIR:~-1%"=="\" set "SINGBOX_DIR=%SINGBOX_DIR:~0,-1%"

set SINGBOX_EXE=%SINGBOX_DIR%\sing-box.exe
set CONFD_DIR=%SINGBOX_DIR%\confd

%SINGBOX_EXE% run -D "%SINGBOX_DIR%" -C "%CONFD_DIR%"