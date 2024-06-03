@echo off
if exist EBOOT.BIN scetool -d EBOOT.BIN EBOOT.ELF
if exist EBOOT.ELF exit
if not exist EBOOT.BIN echo.
if not exist EBOOT.BIN echo No EBOOT.BIN found in folder!
if not exist EBOOT.BIN echo.
if not exist EBOOT.BIN pause
if not exist EBOOT.BIN exit
echo [^*] Error: Could not find Rap file in RAPS folder!
echo.
pause
exit