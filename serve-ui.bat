@echo off
cd /d "%~dp0"
echo.
echo === Math AI UI - Local server ===
echo.

py -3 -c "exit(0)" 2>nul
if errorlevel 1 (
  set PYCMD=python
) else (
  set "PYCMD=py -3"
)

echo Starting HTTP server on http://localhost:8080 ...
echo Open that URL in your browser. Keep this window open.
echo.

start /B cmd /c "timeout /t 3 >nul && start http://localhost:8080"
%PYCMD% -m http.server 8080

if errorlevel 1 (
  echo.
  echo Server failed. Try: python -m http.server 8080
  echo Or run from this folder: py -3 -m http.server 8080
)
pause
