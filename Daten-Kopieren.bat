@echo on

color 0A

set rootfolder=C:
set destfolder=D:

for /f "delims=" %%g in ('dir /b /ad /tc /od "%rootfolder%\"') do set "subfolder=%%g"

ECHO %subfolder%

xcopy rootfolder\%subfolder% desfolder\%subfolder% /D /E /Y /I

PAUSE