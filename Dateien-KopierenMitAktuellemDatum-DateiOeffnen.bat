@echo on

color 0A

set rootfolder=C:
set destfolder=D:

for /f "delims=" %%g in ('dir /b /ad /tc /od "%rootfolder%\"') do set "subfolder=%%g"

ECHO %subfolder%

set /a day=%date:~0,2%
set month=%date:~3,2%
set year=%date:~6,4%

set newDate=%year%.%month%.%day%

set /a tag=%date:~0,2%-1
set monat=%date:~3,2%
set jahr=%date:~6,4%
if %tag% EQU 0 set /a monat=%monat%-1
if %monat% EQU 1 set tag1=31
if %monat% EQU 2 set tag1=29
if %monat% EQU 3 set tag1=31
if %monat% EQU 4 set tag1=30
if %monat% EQU 5 set tag1=31
if %monat% EQU 6 set tag1=30
if %monat% EQU 7 set tag1=31
if %monat% EQU 8 set tag1=31
if %monat% EQU 9 set tag1=30
if %monat% EQU 10 set tag1=31
if %monat% EQU 11 set tag1=30
if %monat% EQU 12 set tag1=31
if %monat% EQU 0 set /a jahr=%jahr%-1
if %monat% EQU 0 set monat=12
if %monat% EQU 1 set tag1=31
if %monat% EQU 2 set tag1=29
if %monat% EQU 3 set tag1=31
if %monat% EQU 4 set tag1=30
if %monat% EQU 5 set tag1=31
if %monat% EQU 6 set tag1=30
if %monat% EQU 7 set tag1=31
if %monat% EQU 8 set tag1=31
if %monat% EQU 9 set tag1=30
if %monat% EQU 10 set tag1=31
if %monat% EQU 11 set tag1=30
if %monat% EQU 12 set tag1=31
if %tag% EQU 0 set tag=%tag1%
set oldDate=%jahr%.%monat%.%tag%

set folder=Stand-%oldDate%

mkdir destfolder\%folder%

xcopy rootfolder\%subfolder% destfolder\%folder% /D /E /Y /I

::heutige Kopie erstellen

set rootfolder=destfolder

for /f "delims=" %%g in ('dir /b /ad /tc /od "%rootfolder%\"') do set "subfolder=%%g"

ECHO %subfolder%

set folder=Stand-%newDate%

xcopy rootfolder\%subfolder% rootfolder\%folder% /D /E /Y /I

::Datei öffnen

start rootfolder\%folder%\LaTeX\src\Hauptdatei.tex

PAUSE
