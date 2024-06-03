SETLOCAL ENABLEDELAYEDEXPANSION

move %DIR_SRC%\%1.sprx %DIR_DEST%\

for /F "tokens=*" %%* in ('dir /b %DIR_DEST%\*.sprx') do set sprx=%%*

set pprx=%1.prx
set prx=%1.prx
set prx
set prx=%prx:"=%
set prx

cls
scetool -i %DIR_DEST%/%sprx% >selfinfo.txt
for /f "skip=3 tokens=1,*" %%i in (selfinfo.txt) do if "%%i"=="ContentID" set contentid=%%j
echo %contentid% >cid.txt
for /f "tokens=2 delims=-,_" %%k in (cid.txt) do set titleid=%%k
find /I "%titleid%" klicense.txt >results.txt
for /f "skip=3 tokens=1,*" %%o in (selfinfo.txt) do if "%%o"=="Licence" set Licence=%%p
for /f "skip=3 tokens=1,*" %%m in (selfinfo.txt) do if "%%m"=="SELF-Type" set type=%%n
for /f "skip=3 tokens=1,*" %%s in (selfinfo.txt) do if "%%s"=="App" set app=%%t
for /f "skip=3 tokens=1,*" %%w in (selfinfo.txt) do if "%%w"=="FW" set FW=%%x
echo %FW% >fw.txt
for /f "tokens=3" %%r in (fw.txt) do set fwv=%%r
find /I "Type                   [EXEC]" selfinfo.txt >exec.txt
if %errorlevel%==0 set ELF_TYPE=[EXEC]
find /I "Type                   [PRX]" selfinfo.txt >prx.txt
if %errorlevel%==0 set ELF_TYPE=[PRX]
if "%app%"=="Type     0x00000000" set apptype=SPRX
if "%app%"=="Type     0x00000001" set apptype=EXEC
if "%app%"=="Type     0x00000020" set apptype=USPRX
if "%app%"=="Type     0x00000021" set apptype=UEXEC
if "%app%"=="Type       [EXEC]" set apptype=EXEC
if "%app%"=="Type       [UEXEC]" set apptype=UEXEC
if "%app%"=="Type       [SPRX]" set apptype=SPRX
if "%app%"=="Type       [USPRX]" set apptype=USPRX

SET klic=NONE
SET klic2=NONE
SET klic3=NONE
SET "data="
FOR /f %%a IN (results.txt) DO SET "data=!data! %%a
SET "data=%data:~1%"
echo %data% >K2.txt
FOR /f "tokens=2" %%b IN (K2.txt) DO SET klic=%%b
FOR /f "tokens=3" %%c IN (K2.txt) DO SET klic2=%%c
FOR /f "tokens=4" %%d IN (K2.txt) DO SET klic3=%%d

if "%klic2%"=="%klic%" set klic2=NONE
if "%klic3%"=="%klic%" set klic3=NONE
if "%klic2%"=="%klic3%" set klic3=NONE

if "%Licence%"=="Type 0x00000003" set wwr=FREE-TYPE NPDRM
if "%Licence%"=="Type   [FREE]" set wwr=FREE-TYPE NPDRM
if "%Licence%"=="Type 0x00000001" set wwr=NETWORK-TYPE NPDRM
if "%Licence%"=="Type 0x00000002" set wwr=LOCAL-TYPE NPDRM
if "%type%"=="[Application]" set wwr=DISC-TYPE APPLICATION
if "%Licence%"=="Type   [LOCAL]" set wwr=LOCAL-TYPE NPDRM
if "%Licence%"=="Type   [NETWORK]" set wwr=NETWORK-TYPE NPDRM

cls
echo =====================================================================
if "%type%"=="[Application]" echo =     This is a DISC-Type APP    No NEED for a Rap or Dev-Klic      =
echo =====================================================================
if "%Licence%"=="Type   [NETWORK]" echo =             NETWORK-Type NEEDS Rap to Decrypt header              =
if "%Licence%"=="Type   [LOCAL]" echo =             LOCAL-Type NEEDS Rap to Decrypt header                =
if "%Licence%"=="Type 0x00000003" echo =        FREE-Type NPDRM NEEDS Dev-Klic to Decrypt header           =
if "%Licence%"=="Type   [FREE]"   echo =        FREE-Type NPDRM NEEDS Dev-Klic to Decrypt header           =
if "%Licence%"=="Type 0x00000001" echo =             NETWORK-Type NEEDS Rap to Decrypt header              =
if "%Licence%"=="Type 0x00000002" echo =             LOCAL-Type NEEDS Rap to Decrypt header                =
if not "%type%"=="[Application]" echo = You cannot Resign to FREE-Type NPDRM without correct Dev-Klic     =
echo =====================================================================
sfk color magenta && if not "%type%"=="[Application]" echo =           Going to try to search for klicense in list             =
sfk color green && echo =-------------------------------------------------------------------=
echo = [FILE NAME = %sprx%] [TYPE = %wwr%]
echo =                                                                   =
echo        Title-ID = [%titleid%]  [FW Version = %fwv%
echo =                                                                   =
if not "%type%"=="[Application]" echo    Content-ID = %contentid%          
echo =                                                                   =
if not "%type%"=="[Application]" echo Trying Found klicense = %klic%
if %klic2%==NONE (goto nl2)
if not "%type%"=="[Application]" echo Trying Found klicense = %klic2%
if %klic3%==NONE (goto nl2)
if not "%type%"=="[Application]" echo Trying Found klicense = %klic3%
:nl2
echo =                                                                   =
echo =====================================================================
if not exist kl.txt pause
echo Sold >kl.txt
if "%type%"=="[Application]" (goto fix1)
if "%Licence%"=="Type 0x00000003" (goto shic)
if "%Licence%"=="Type   [FREE]" (goto shic)

cls
if not exist "%DIR_RAP%"\%contentid%.rap echo       *************************
sfk color magenta && if not exist "%DIR_RAP%"\%contentid%.rap echo       * --- NO Rap Found  --- *
sfk color green && if not exist "%DIR_RAP%"\%contentid%.rap echo       *************************
if not exist "%DIR_RAP%"\%contentid%.rap echo *-----------------------------------*
if not exist "%DIR_RAP%"\%contentid%.rap echo *  Can't Decrypt LOCAL-Type NPDRM   *
if not exist "%DIR_RAP%"\%contentid%.rap echo * Can't Decrypt NETWORK-Type NPDRM  *
if not exist "%DIR_RAP%"\%contentid%.rap echo *           without Rap             *
if not exist "%DIR_RAP%"\%contentid%.rap echo *-----------------------------------*
if not exist "%DIR_RAP%"\%contentid%.rap echo       * Put Rap in Rap Folder *
if not exist "%DIR_RAP%"\%contentid%.rap echo       *-----------------------*
if not exist "%DIR_RAP%"\%contentid%.rap pause
if not exist "%DIR_RAP%"\%contentid%.rap move /Y %DIR_DEST%\%sprx% %DIR_ORIG%\
if not exist "%DIR_RAP%"\%contentid%.rap cls
if not exist "%DIR_RAP%"\%contentid%.rap echo temp>ztemp
if not exist "%DIR_RAP%"\%contentid%.rap call "ESSSE_RESIGNER.bat"

if "%Licence%"=="Type 0x00000001" (goto fix2)
if "%Licence%"=="Type 0x00000002" (goto fix3)
if "%Licence%"=="Type   [NETWORK]" (goto fix2)
if "%Licence%"=="Type   [LOCAL]" (goto fix3)

:shic
cls
if %klic%==NONE echo       ************************
sfk color magenta && if %klic%==NONE echo       *  No dev-Klic Found   *
sfk color green && if %klic%==NONE echo *-----------------------------------*
if %klic%==NONE echo *  Can't Decrypt FREE-Type NPDRM    *
if %klic%==NONE echo *           without Klic            *
if %klic%==NONE echo *-----------------------------------*
if %klic%==NONE echo *   Add Klic to Resign this .sprx   *
if %klic%==NONE echo *************************************
if %klic%==NONE pause
if %klic%==NONE move /Y %DIR_DEST%\%sprx% %DIR_ORIG%\
if %klic%==NONE cls
if %klic%==NONE echo temp>ztemp
if %klic%==NONE call "ESSSE_RESIGNER.bat"

if "%Licence%"=="Type 0x00000003" (goto fix4)
if "%Licence%"=="Type   [FREE]" (goto fix4)

:fix1
if "%type%"=="[Application]" scetool -v -d %DIR_DEST%/%sprx% %DIR_DEST%/%prx%
if exist %DIR_DEST%\%prx% echo klic >kl.txt
if exist %DIR_DEST%\%prx% (goto fixelf)

:fix2
if "%Licence%"=="Type 0x00000001" scetool -v -d %DIR_DEST%/%sprx% %DIR_DEST%/%prx%
if "%Licence%"=="Type   [NETWORK]" scetool -v -d %DIR_DEST%/%sprx% %DIR_DEST%/%prx%
if not exist %DIR_DEST%\%prx% scetool -l 74376384BA498BFF3DBB949F0B6A929D -v -d %DIR_DEST%/%sprx% %DIR_DEST%/%prx%
if not exist %DIR_DEST%\%prx% scetool -v -d %DIR_DEST%/%sprx% %DIR_DEST%/%prx%
if not exist %DIR_DEST%\%prx% cls
if not exist %DIR_DEST%\%prx% echo ***************************
sfk color magenta && if not exist %DIR_DEST%\%prx% echo * Could Not Decrypt .sprx!*
sfk color green && if not exist %DIR_DEST%\%prx% echo ***************************
if not exist %DIR_DEST%\%prx% pause
if not exist %DIR_DEST%\%prx% move /Y %DIR_DEST%\%sprx% %DIR_ORIG%\
if not exist %DIR_DEST%\%prx% cls
if not exist %DIR_DEST%\%prx% echo temp>ztemp
if not exist %DIR_DEST%\%prx% call "ESSSE_RESIGNER.bat"
if exist %DIR_DEST%\%prx% echo klic >kl.txt
if exist %DIR_DEST%\%prx% (goto fixelf)

:fix3
if "%Licence%"=="Type 0x00000002" scetool -v -d %DIR_DEST%/%sprx% %DIR_DEST%/%prx%
if "%Licence%"=="Type   [LOCAL]" scetool -v -d %DIR_DEST%/%sprx% %DIR_DEST%/%prx%
if not exist %DIR_DEST%\%prx% cls
if not exist %DIR_DEST%\%prx% echo ***************************
sfk color magenta && if not exist %DIR_DEST%\%prx% echo * Could Not Decrypt .sprx!*
sfk color green && if not exist %DIR_DEST%\%prx% echo ***************************
if not exist %DIR_DEST%\%prx% pause
if not exist %DIR_DEST%\%prx% move /Y %DIR_DEST%\%sprx% %DIR_ORIG%\
if not exist %DIR_DEST%\%prx% cls
if not exist %DIR_DEST%\%prx% echo temp>ztemp
if not exist %DIR_DEST%\%prx% call "ESSSE_RESIGNER.bat"
if exist %DIR_DEST%\%prx% echo klic >kl.txt
if exist %DIR_DEST%\%prx% (goto fixelf)

:fix4
if not exist %DIR_DEST%\%prx% scetool -l "%klic%" -v -d %DIR_DEST%/%sprx% %DIR_DEST%/%prx%
if exist %DIR_DEST%\%prx% set rrr=%klic%
if exist %DIR_DEST%\%prx% (goto fixelf)
if not exist %DIR_DEST%\%prx% scetool -l "%klic2%" -v -d %DIR_DEST%/%sprx% %DIR_DEST%/%prx%
if exist %DIR_DEST%\%prx% set rrr=%klic2%
if exist %DIR_DEST%\%prx% (goto fixelf)
if not exist %DIR_DEST%\%prx% scetool -l "%klic3%" -v -d %DIR_DEST%/%sprx% %DIR_DEST%/%prx%
if exist %DIR_DEST%\%prx% set rrr=%klic3%
if exist %DIR_DEST%\%prx% (goto fixelf)
if not exist %DIR_DEST%\%prx% scetool -v -d %DIR_DEST%/%sprx% %DIR_DEST%/%prx%
if not exist %DIR_DEST%\%prx% cls
if not exist %DIR_DEST%\%prx% echo ***************************
sfk color magenta && if not exist %DIR_DEST%\%prx% echo * Could Not Decrypt .sprx *
sfk color green && if not exist %DIR_DEST%\%prx% echo ***************************
if not exist %DIR_DEST%\%prx% pause
if not exist %DIR_DEST%\%prx% move /Y %DIR_DEST%\%sprx% %DIR_ORIG%\
if not exist %DIR_DEST%\%prx% cls
if not exist %DIR_DEST%\%prx% echo temp>ztemp
if not exist %DIR_DEST%\%prx% call "ESSSE_RESIGNER.bat"
if exist %DIR_DEST%\%prx% echo klic >kl.txt
if exist %DIR_DEST%\%prx% (goto fixelf)

:fixelf
if exist %DIR_DEST%\%prx% FixELF.exe %DIR_DEST%\%prx%
if "%type%"=="[Application]" (goto disc)
if "%Licence%"=="Type 0x00000001" (goto next)
if "%Licence%"=="Type 0x00000002" (goto next)
if "%Licence%"=="Type 0x00000003" (goto free)
if "%Licence%"=="Type   [FREE]" (goto free)
if "%Licence%"=="Type   [LOCAL]" goto next
if "%Licence%"=="Type   [NETWORK]" goto next

:next
if %klic%==NONE cls
if %klic%==NONE echo *******************************
if %klic%==NONE echo * LOCAL or NETWORK Type .sprx *
if %klic%==NONE echo *-----------------------------*
if %klic%==NONE echo *Without dev-Klic you can only*
if %klic%==NONE echo *  Resign to DISC-Type APP    *
if %klic%==NONE echo *******************************
if %klic%==NONE pause
if %klic%==NONE cls
if %klic%==NONE (goto disc)
goto local

:disc
cls
echo =======================
sfk color magenta && echo ***[DISC TYPE EBOOT]***
sfk color green && echo =======================
echo.
echo   1. Resign to 3.55
echo.
echo   2. Resign to 4.21
echo.
echo =======================
if exist 355.txt (goto 355)
if exist 421.txt (goto 421)
set /p dic= Your Choice (1-2):
if %dic%==1 echo 355 >355.txt
if %dic%==1 (goto 355)
if %dic%==2 echo 421 >421.txt
if %dic%==2 (goto 421)
echo You can only choose 1-2
pause
cls
goto disc

:local
cls
set rrr=%klic%
echo ==============================
sfk color magenta && echo ******[LOCAL TYPE NPDRM]******
echo ==============or==============
echo *****[NETWORK TYPE NPDRM]*****
sfk color green && echo ==============================
echo ------------------------------
sfk color yellow && echo   Resign to FREE TYPE NPDRM
sfk color green && echo ------------------------------
echo.
echo     1. Resign to FREE TYPE
echo            NPDRM 3.55
echo. 
echo     2. Resign to FREE TYPE
echo            NPDRM 4.21
echo.
echo ===============================
sfk color yellow && echo    Resign to DISC TYPE APP
sfk color green && echo ------------------------------- 
echo.  
echo     3. Resign to 3.55
echo.
echo     4. Resign to 4.21
echo.
echo ===============================
if exist 355.txt (goto 355)
if exist 421.txt (goto 421)
if exist np355.txt (goto np355)
if exist np421.txt (goto np421)
set /p dick= Your Choice (1-4):
if %dick%==1 echo np355 >np355.txt
if %dick%==1 (goto getk)
if %dick%==2 echo np421 >np421.txt
if %dick%==2 (goto getk)
if %dick%==3 echo 355 >355.txt
if %dick%==3 (goto 355)
if %dick%==4 echo 421 >421.txt
if %dick%==4 (goto 421)
echo You can only choose 1-4
pause
cls
goto local

:free
cls
echo ==============================
sfk color magenta && echo ******[FREE TYPE NPDRM]*******
sfk color green && echo ==============================
echo ------------------------------
sfk color yellow && echo     Resign FREE TYPE NPDRM
sfk color green && echo ------------------------------
echo.
echo     1. Resign to FREE TYPE
echo            NPDRM 3.55
echo. 
echo     2. Resign to FREE TYPE
echo            NPDRM 4.21
echo.
echo ===============================
sfk color yellow && echo    Resign to DISC TYPE APP
sfk color green && echo ------------------------------- 
echo.
echo     3. Resign to 3.55
echo.
echo     4. Resign to 4.21
echo.
echo ===============================
if exist 355.txt (goto 355)
if exist 421.txt (goto 421)
if exist np355.txt (goto np355)
if exist np421.txt (goto np421)
set /p dik= Your Choice (1-4):
if %dik%==1 echo np355 >np355.txt
if %dik%==1 (goto np355)
if %dik%==2 echo np421 >np421.txt
if %dik%==2 (goto np421)
if %dik%==3 echo 355 >355.txt
if %dik%==3 (goto 355)
if %dik%==4 echo 421 >421.txt
if %dik%==4 (goto 421)
echo You can only choose 1-4
pause
cls
goto free

:getk
if %klic2%==NONE (goto gyu)
if not %klic2%==NONE cls
if not %klic2%==NONE echo *********************************
if not %klic2%==NONE echo *  To Resign to FREE-TYPE NPDRM
if not %klic2%==NONE echo *   you need correct dev-klic
if not %klic2%==NONE echo *--------------------------------
if not %klic2%==NONE echo * Set Dev_Klic to this Enter 1:
if not %klic2%==NONE echo * [%klic%]
if not %klic2%==NONE echo *
if not %klic2%==NONE echo * Set Dev_Klic to this Enter 2:
if not %klic2%==NONE echo * [%klic2%]
if not %klic3%==NONE echo *
if not %klic3%==NONE echo * Set Dev_Klic to this Enter 3:
if not %klic3%==NONE echo * [%klic3%]
if not %klic2%==NONE echo **********************************
if not %klic2%==NONE set /p ylsp= Your Choice:
if %ylsp%==1 set rrr=%klic%
if %ylsp%==1 (goto gyu)
if %ylsp%==2 set rrr=%klic2%
if %ylsp%==2 (goto gyu)
if %ylsp%==3 set rrr=%klic3%
if %ylsp%==3 (goto gyu)
cls
goto getk

:gyu
if exist np355.txt (goto np355)
if exist np421.txt (goto np421)

:355
cls
if "%ELF_TYPE%"=="[EXEC]" scetool --verbose --sce-type=SELF --skip-sections=FALSE --self-add-shdrs=TRUE --compress-data=TRUE --key-revision=0A --self-app-version=0001000000000000 --self-auth-id=1010000001000003 --self-vendor-id=01000002 --self-ctrl-flags=0000000000000000000000000000000000000000000000000000000000000000 --self-cap-flags=00000000000000000000000000000000000000000000003B0000000100040000 --self-type=APP --self-fw-version=0003005500000000 --encrypt %DIR_DEST%/%prx% %DIR_DEST%/%sprx%
if "%ELF_TYPE%"=="[PRX]" scetool --verbose --sce-type=SELF --skip-sections=FALSE --self-add-shdrs=TRUE --compress-data=TRUE --key-revision=0A --self-app-version=0001000000000000 --self-auth-id=1010000001000003 --self-vendor-id=01000002 --self-ctrl-flags=0000000000000000000000000000000000000000000000000000000000000000 --self-cap-flags=00000000000000000000000000000000000000000000003B0000000100040000 --self-type=APP --self-fw-version=0003005500000000 --encrypt %DIR_DEST%/%prx% %DIR_DEST%/%sprx%
cls
goto finishb

:421
cls
if "%ELF_TYPE%"=="[EXEC]" scetool --verbose --sce-type=SELF --skip-sections=FALSE --self-add-shdrs=TRUE --compress-data=TRUE --key-revision=1C --self-app-version=0001000000000000 --self-auth-id=1010000001000003 --self-vendor-id=01000002 --self-ctrl-flags=0000000000000000000000000000000000000000000000000000000000000000 --self-cap-flags=00000000000000000000000000000000000000000000003B0000000100040000 --self-type=APP --self-fw-version=0004002100000000 --encrypt %DIR_DEST%/%prx% %DIR_DEST%/%sprx%
if "%ELF_TYPE%"=="[PRX]" scetool --verbose --sce-type=SELF --skip-sections=FALSE --self-add-shdrs=TRUE --compress-data=TRUE --key-revision=1C --self-app-version=0001000000000000 --self-auth-id=1010000001000003 --self-vendor-id=01000002 --self-ctrl-flags=0000000000000000000000000000000000000000000000000000000000000000 --self-cap-flags=00000000000000000000000000000000000000000000003B0000000100040000 --self-type=APP --self-fw-version=0004002100000000 --encrypt %DIR_DEST%/%prx% %DIR_DEST%/%sprx%
cls
goto finishb

:np355
cls
if "%ELF_TYPE%"=="[EXEC]" scetool --verbose --skip-sections=FALSE --sce-type=SELF --compress-data=TRUE --key-revision=0A --self-app-version=0001000000000000 --self-auth-id=1010000001000003 --self-vendor-id=01000002 --self-ctrl-flags=0000000000000000000000000000000000000000000000000000000000000000 --self-cap-flags=00000000000000000000000000000000000000000000003B0000000100020000 --self-type=NPDRM --self-fw-version=0003005500000000 --np-license-type=FREE --np-app-type=%apptype% --np-klicensee=%rrr% --np-content-id=%contentid% --np-real-fname=%sprx% --encrypt %DIR_DEST%/%prx% %DIR_DEST%/%sprx%
if "%ELF_TYPE%"=="[PRX]" scetool --verbose --skip-sections=FALSE --sce-type=SELF --compress-data=TRUE --key-revision=0A --self-app-version=0001000000000000 --self-auth-id=1010000001000003 --self-vendor-id=01000002 --self-ctrl-flags=0000000000000000000000000000000000000000000000000000000000000000 --self-cap-flags=00000000000000000000000000000000000000000000003B0000000100020000 --self-type=NPDRM --self-fw-version=0003005500000000 --np-license-type=FREE --np-app-type=%apptype% --np-klicensee=%rrr% --np-content-id=%contentid% --np-real-fname=%sprx% --encrypt %DIR_DEST%/%prx% %DIR_DEST%/%sprx%
cls
goto finishb

:np421
cls
if "%ELF_TYPE%"=="[EXEC]" scetool --verbose --skip-sections=FALSE --sce-type=SELF --compress-data=TRUE --key-revision=1C --self-app-version=0001000000000000 --self-auth-id=1010000001000003 --self-vendor-id=01000002 --self-ctrl-flags=0000000000000000000000000000000000000000000000000000000000000000 --self-cap-flags=00000000000000000000000000000000000000000000003B0000000100020000 --self-type=NPDRM --self-fw-version=0004002100000000 --np-license-type=FREE --np-app-type=%apptype% --np-klicensee=%rrr% --np-content-id=%contentid% --np-real-fname=%sprx% --encrypt %DIR_DEST%/%prx% %DIR_DEST%/%sprx%
if "%ELF_TYPE%"=="[PRX]" scetool --verbose --skip-sections=FALSE --sce-type=SELF --compress-data=TRUE --key-revision=1C --self-app-version=0001000000000000 --self-auth-id=1010000001000003 --self-vendor-id=01000002 --self-ctrl-flags=0000000000000000000000000000000000000000000000000000000000000000 --self-cap-flags=00000000000000000000000000000000000000000000003B0000000100020000 --self-type=NPDRM --self-fw-version=0004002100000000 --np-license-type=FREE --np-app-type=%apptype% --np-klicensee=%rrr% --np-content-id=%contentid% --np-real-fname=%sprx% --encrypt %DIR_DEST%/%prx% %DIR_DEST%/%sprx%
cls
goto finishb

:finishb

cls
if exist %DIR_DEST%\*.PRX del %DIR_DEST%\*.PRX