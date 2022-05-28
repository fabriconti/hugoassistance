@REM @Author: Faber
@REM @Date:   2022-05-10 16:41:28
@REM @Last Modified by:   Faber
@REM Modified time: 2022-05-28 10:15:50

@echo off
@chcp 65001
echo.
color 70

pushd "%~dp0"


git add . || GOTO :ERRORE
figlet COMMIT
SET /P MSG=messaggio del commit?
git commit -m "%MSG%"
::https://github.com/fabriconti/hugoassistance.git
git push --force -u origin main || GOTO :ERRORE
color A0
popd
ping localhost>NUL
goto :EOF

:ERRORE
color CF
ECHO.
ECHO.
pause
