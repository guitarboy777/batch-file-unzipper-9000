@echo off
setlocal EnableDelayedExpansion

set "ROOT=%~dp0"

echo.
echo ========================================
echo Recursive ZIP Extractor
echo ========================================
echo.
echo Folder: %ROOT%
echo.

:SCAN
set "FOUND="

for /r "%ROOT%" %%F in (*.zip) do (
set "FOUND=1"

echo Extracting:
echo %%F

powershell -NoProfile -ExecutionPolicy Bypass -Command ^
"Expand-Archive -LiteralPath '%%F' -DestinationPath '%%~dpF%%~nF' -Force"

if !ERRORLEVEL! EQU 0 (
del "%%F"
echo Done.
echo.
) else (
echo ERROR extracting %%F
echo.
)
)

if defined FOUND goto SCAN

echo ========================================
echo Finished!
echo ========================================
pause
