@echo off
timeout /t 10 /nobreak >nul

sc stop cvas >nul 2>&1
sc stop vcas >nul 2>&1
sc stop vcsass >nul 2>&1

exit