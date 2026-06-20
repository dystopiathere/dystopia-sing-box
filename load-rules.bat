@echo off
setlocal enabledelayedexpansion

set "RULES_DIR=%~dp0rules"

if not exist "%RULES_DIR%" (
    echo [INFO] Creating %RULES_DIR%...
    mkdir "%RULES_DIR%"
)

echo [INFO] Downloading rule-set files into %RULES_DIR%...
echo.

call :download "https://raw.githubusercontent.com/runetfreedom/russia-blocked-geoip/release/srs/telegram.srs" "telegram.srs"
call :download "https://raw.githubusercontent.com/SagerNet/sing-geoip/rule-set/geoip-ru.srs" "geoip-ru.srs"

echo.
echo [OK] All downloads finished.
pause
exit /b 0

:download
set URL=%~1
set FILENAME=%~2
echo [GET] %FILENAME%
curl -fsSL -o "%RULES_DIR%\%FILENAME%" "%URL%"
if !errorlevel! neq 0 (
    echo [ERROR] Failed to download %FILENAME%
) else (
    echo [OK] %FILENAME%
)
echo.
exit /b 0