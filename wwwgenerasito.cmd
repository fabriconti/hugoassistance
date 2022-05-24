@echo off
color 70
chcp 65001
title GENERA SITO

figlet HUGO GENERA SITO

SET DESTINAZIONE=%USERPROFILE%\Documents\hugo-public

if not exist "%DESTINAZIONE%" mkdir "%DESTINAZIONE%"

ECHO.
ECHO %DESTINAZIONE%
ECHO.

hugo -b="https://www.ilmosaicodanza.it" -d "%DESTINAZIONE%"
	
:FINE
color a0
figlet FATTO
ping localhost >nul

