SETLOCAL ENABLEDELAYEDEXPANSION

move %DIR_SRC%\%1.self %DIR_DEST%\

for /F "tokens=*" %%* in ('dir /b %DIR_DEST%\*.self') do set self=%%*

set eelf=%1.elf
set elf=%1.elf
set elf
set elf=%elf:"=%
set elf

cls
scetool -i %DIR_DEST%/%self% >selfinfo.txt
for /f "skip=3 tokens=1,*" %%i in (selfinfo.txt) do if "%%i"=="ContentID" set contentid=%%j
echo %contentid% >cid.txt
for /f "tokens=2 delims=-,_" %%k in (cid.txt) do set titleid=%%k
find /I "%titleid%" klicense.txt >results.txt
for /f "skip=3 tokens=1,*" %%o in (selfinfo.txt) do if "%%o"=="Licence" set Licence=%%p
for /f "skip=3 tokens=1,*" %%m in (selfinfo.txt) do if "%%m"=="SELF-Type" set type=%%n
for /f "skip=3 tokens=1,*" %%s in (selfinfo.txt) do if "%%s"=="App" set app=%%t
for /f "skip=3 tokens=1,*" %%w in (selfinfo.txt) do if "%%w"=="FW" set FW=%%x
for /f "skip=3 tokens=1,*" %%y in (selfinfo.txt) do if "%%y"=="Key" set Key=%%z
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

if %klic2%==%klic% set klic2=NONE
if %klic3%==%klic% set klic3=NONE
if %klic2%==%klic3% set klic3=NONE

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
if "%Key%"=="Revision    [DEBUG]" echo =                    This is a DEBUG Self file                      =
echo =====================================================================
sfk color magenta && if not "%type%"=="[Application]" echo =           Going to try to search for klicense in list             =
sfk color green && echo =-------------------------------------------------------------------=
echo = [FILE NAME = %self%] [TYPE = %wwr%]
echo =                                                                   =
echo       Title-ID = [%titleid%]  [FW Version = %fwv%                         
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
if "%Key%"=="Revision    [DEBUG]" goto dwd

cls
if not exist "%DIR_RAP%"\%contentid%.rap echo       *************************
sfk color yellow && if not exist "%DIR_RAP%"\%contentid%.rap echo       * --- NO Rap Found  --- *
sfk color green && if not exist "%DIR_RAP%"\%contentid%.rap echo       *************************
if not exist "%DIR_RAP%"\%contentid%.rap echo *-----------------------------------*
if not exist "%DIR_RAP%"\%contentid%.rap echo *  Can't Decrypt LOCAL-Type NPDRM   *
if not exist "%DIR_RAP%"\%contentid%.rap echo * Can't Decrypt NETWORK-Type NPDRM  *
if not exist "%DIR_RAP%"\%contentid%.rap echo *           without Rap             *
if not exist "%DIR_RAP%"\%contentid%.rap echo *-----------------------------------*
if not exist "%DIR_RAP%"\%contentid%.rap echo       * Put Rap in Rap Folder *
if not exist "%DIR_RAP%"\%contentid%.rap echo       *-----------------------*
if not exist "%DIR_RAP%"\%contentid%.rap pause
if not exist "%DIR_RAP%"\%contentid%.rap move /Y %DIR_DEST%\%self% %DIR_ORIG%\
if not exist "%DIR_RAP%"\%contentid%.rap cls
if not exist "%DIR_RAP%"\%contentid%.rap echo temp>ztemp
if not exist "%DIR_RAP%"\%contentid%.rap call "ESSSE_RESIGNER.bat"

if "%Licence%"=="Type 0x00000001" goto fix2
if "%Licence%"=="Type 0x00000002" goto fix3
if "%Licence%"=="Type   [NETWORK]" (goto fix2)
if "%Licence%"=="Type   [LOCAL]" (goto fix3)

:shic
cls
if %klic%==NONE echo       ************************
sfk color yellow && if %klic%==NONE echo       *  No dev-Klic Found   *
sfk color green && if %klic%==NONE echo *-----------------------------------*
if %klic%==NONE echo *  Can't Decrypt FREE-Type NPDRM    *
if %klic%==NONE echo *           without Klic            *
if %klic%==NONE echo *-----------------------------------*
if %klic%==NONE echo *   Add Klic to Resign this .self   *
if %klic%==NONE echo *************************************
if %klic%==NONE pause
if %klic%==NONE move /Y %DIR_DEST%\%self% %DIR_ORIG%\
if %klic%==NONE cls
if %klic%==NONE echo temp>ztemp
if %klic%==NONE call "ESSSE_RESIGNER.bat"

if "%Licence%"=="Type 0x00000003" goto fix4
if "%Licence%"=="Type   [FREE]" (goto fix4)

:fix1
if "%type%"=="[Application]" scetool -v -d %DIR_DEST%/%self% %DIR_DEST%/%elf%
if exist %DIR_DEST%\%elf% echo klic >kl.txt
if exist %DIR_DEST%\%elf% goto fixelf

:fix2
if "%Licence%"=="Type 0x00000001" scetool -v -d %DIR_DEST%/%self% %DIR_DEST%/%elf%
if "%Licence%"=="Type   [NETWORK]" scetool -v -d %DIR_DEST%/%self% %DIR_DEST%/%elf%
if not exist %DIR_DEST%\%elf% scetool -l 74376384BA498BFF3DBB949F0B6A929D -v -d %DIR_DEST%/%self% %DIR_DEST%/%elf%
if not exist %DIR_DEST%\%elf% scetool -v -r -d %DIR_DEST%/%self% %DIR_DEST%/%elf%
if not exist %DIR_DEST%\%elf% cls
if not exist %DIR_DEST%\%elf% echo ***************************
sfk color magenta && if not exist %DIR_DEST%\%elf% echo * Could Not Decrypt .self *
sfk color green && if not exist %DIR_DEST%\%elf% echo ***************************
if not exist %DIR_DEST%\%elf% pause
if not exist %DIR_DEST%\%elf% move /Y %DIR_DEST%\%self% %DIR_ORIG%\
if not exist %DIR_DEST%\%elf% cls
if not exist %DIR_DEST%\%elf% echo temp>ztemp
if not exist %DIR_DEST%\%elf% call "ESSSE_RESIGNER.bat"
if exist %DIR_DEST%\%elf% echo klic >kl.txt
if exist %DIR_DEST%\%elf% (goto fixelf)

:fix3
if "%Licence%"=="Type 0x00000002" scetool -v -d %DIR_DEST%/%self% %DIR_DEST%/%elf%
if "%Licence%"=="Type   [LOCAL]" scetool -v -d %DIR_DEST%/%self% %DIR_DEST%/%elf%
if not exist %DIR_DEST%\%elf% cls
if not exist %DIR_DEST%\%elf% echo ***************************
sfk color magenta && if not exist %DIR_DEST%\%elf% echo * Could Not Decrypt .self *
sfk color green && if not exist %DIR_DEST%\%elf% echo ***************************
if not exist %DIR_DEST%\%elf% pause
if not exist %DIR_DEST%\%elf% move /Y %DIR_DEST%\%self% %DIR_ORIG%\
if not exist %DIR_DEST%\%elf% cls
if not exist %DIR_DEST%\%elf% echo temp>ztemp
if not exist %DIR_DEST%\%elf% call "ESSSE_RESIGNER.bat"
if exist %DIR_DEST%\%elf% echo klic >kl.txt
if exist %DIR_DEST%\%elf% (goto fixelf)

:fix4
if not exist %DIR_DEST%\%elf% scetool -l "%klic%" -v -d %DIR_DEST%/%self% %DIR_DEST%/%elf%
if exist %DIR_DEST%\%elf% set dev=%klic%
if exist %DIR_DEST%\%elf% (goto fixelf)
if not exist %DIR_DEST%\%elf% scetool -l "%klic2%" -v -d %DIR_DEST%/%self% %DIR_DEST%/%elf%
if exist %DIR_DEST%\%elf% set dev=%klic2%
if exist %DIR_DEST%\%elf% (goto fixelf)
if not exist %DIR_DEST%\%elf% scetool -l "%klic3%" -v -d %DIR_DEST%/%self% %DIR_DEST%/%elf%
if exist %DIR_DEST%\%elf% set dev=%klic3%
if exist %DIR_DEST%\%elf% (goto fixelf)
if not exist %DIR_DEST%\%elf% scetool -v -d %DIR_DEST%/%self% %DIR_DEST%/%elf%
if not exist %DIR_DEST%\%elf% cls
if not exist %DIR_DEST%\%elf% echo ***************************
sfk color magenta && if not exist %DIR_DEST%\%elf% echo * Could Not Decrypt .self *
sfk color green && if not exist %DIR_DEST%\%elf% echo ***************************
if not exist %DIR_DEST%\%elf% pause
if not exist %DIR_DEST%\%elf% move /Y %DIR_DEST%\%self% %DIR_ORIG%\
if not exist %DIR_DEST%\%elf% cls
if not exist %DIR_DEST%\%elf% echo temp>ztemp
if not exist %DIR_DEST%\%elf% call "ESSSE_RESIGNER.bat"
if exist %DIR_DEST%\%elf% echo klic >kl.txt
if exist %DIR_DEST%\%elf% (goto fixelf)

:dwd
if "%Key%"=="Revision    [DEBUG]" cls
if "%Key%"=="Revision    [DEBUG]" echo ****************************************
sfk color red && if "%Key%"=="Revision    [DEBUG]" echo ***************[WARNING]****************
sfk color green && if "%Key%"=="Revision    [DEBUG]" echo *                                      *
if "%Key%"=="Revision    [DEBUG]" echo *     This is a DEBUG SELF file        *
if "%Key%"=="Revision    [DEBUG]" echo *                                      *
if "%Key%"=="Revision    [DEBUG]" echo *    Do you want to Decrypt FSELF      *
if "%Key%"=="Revision    [DEBUG]" echo *                                      *
if "%Key%"=="Revision    [DEBUG]" echo *              1. YES                  *    
if "%Key%"=="Revision    [DEBUG]" echo *              2. NO                   *
if "%Key%"=="Revision    [DEBUG]" echo *                                      *
if "%Key%"=="Revision    [DEBUG]" echo ****************************************
if "%Key%"=="Revision    [DEBUG]" set /p DG= Your Choice (1-2):
if "%Key%"=="Revision    [DEBUG]" if %DG%==1 (goto debug)
if "%Key%"=="Revision    [DEBUG]" if %DG%==2 call "ESSSE_RESIGNER.bat"
if "%Key%"=="Revision    [DEBUG]" echo You can only choose 1-2
if "%Key%"=="Revision    [DEBUG]" pause
if "%Key%"=="Revision    [DEBUG]" cls
if "%Key%"=="Revision    [DEBUG]" goto dwd

:debug
if "%Key%"=="Revision    [DEBUG]" unfself %DIR_DEST%/%self% %DIR_DEST%/%elf%
if "%Key%"=="Revision    [DEBUG]" unself %DIR_DEST%/%self% %DIR_DEST%/%elf%
if exist %DIR_DEST%\%elf% cls
if exist %DIR_DEST%\%elf% echo ***************************
sfk color magenta && if exist %DIR_DEST%\%elf% echo *  DEBUG SELF Decypted  *
sfk color green && if exist %DIR_DEST%\%elf% echo ***************************
if exist %DIR_DEST%\%elf% pause
if exist %DIR_DEST%\%elf% goto fixelf
if not exist %DIR_DEST%\%elf% cls
if not exist %DIR_DEST%\%elf% echo ***************************
sfk color magenta && if not exist %DIR_DEST%\%elf% echo * Could Not Decrypt .self *
sfk color green && if not exist %DIR_DEST%\%elf% echo ***************************
if not exist %DIR_DEST%\%elf% pause
if not exist %DIR_DEST%\%elf% move /Y %DIR_DEST%\%self% %DIR_ORIG%\
if not exist %DIR_DEST%\%elf% cls
if not exist %DIR_DEST%\%elf% call "ESSSE_RESIGNER.bat"
if exist %DIR_DEST%\%elf% echo klic >kl.txt

:fixelf
if exist %DIR_DEST%\%elf% FixELF.exe %DIR_DEST%\%elf%
if "%Key%"=="Revision    [DEBUG]" goto endw
if "%type%"=="[Application]" (goto disc)
if "%Licence%"=="Type 0x00000001" goto next
if "%Licence%"=="Type 0x00000002" goto next
if "%Licence%"=="Type 0x00000003" goto free
if "%Licence%"=="Type   [FREE]" (goto free)
if "%Licence%"=="Type   [LOCAL]" goto next
if "%Licence%"=="Type   [NETWORK]" goto next

:next
if %klic%==NONE cls
if %klic%==NONE echo *******************************
if %klic%==NONE echo * LOCAL or NETWORK Type .self *
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
echo   3. Resign to DEX
echo.
echo =======================
if exist 355.txt (goto 355)
if exist 421.txt (goto 421)
if exist dex.txt (goto dex)
set /p dic= Your Choice (1-3):
if %dic%==1 echo 355 >355.txt
if %dic%==1 (goto 355)
if %dic%==2 echo 421 >421.txt
if %dic%==2 (goto 421)
if %dic%==3 echo dex >dex.txt
if %dic%==3 (goto dex)
echo You can only choose 1-3
pause
cls
goto disc

:local
cls
set dev=%klic%
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
echo     3. Resign to NPDRM DEX
echo.
echo ===============================
sfk color yellow && echo    Resign to DISC TYPE APP
sfk color green && echo ------------------------------- 
echo.  
echo     4. Resign to 3.55
echo.
echo     5. Resign to 4.21
echo.
echo     6. Resign to DEX
echo.
echo ===============================
if exist 355.txt (goto 355)
if exist 421.txt (goto 421)
if exist np355.txt (goto np355)
if exist np421.txt (goto np421)
if exist dex.txt (goto dex)
if exist npdex.txt (goto npdex)
set /p dick= Your Choice (1-6):
if %dick%==1 echo np355 >np355.txt
if %dick%==1 (goto getk)
if %dick%==2 echo np421 >np421.txt
if %dick%==2 (goto getk)
if %dick%==3 echo npdex >npdex.txt
if %dick%==3 (goto npdex)
if %dick%==4 echo 355 >355.txt
if %dick%==4 (goto 355)
if %dick%==5 echo 421 >421.txt
if %dick%==5 (goto 421)
if %dick%==6 echo dex >dex.txt
if %dick%==6 (goto dex)
echo You can only choose 1-6
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
echo     3. Resign to NPDRM DEX
echo.
echo ===============================
sfk color yellow && echo    Resign to DISC TYPE APP
sfk color green && echo ------------------------------- 
echo.
echo     4. Resign to 3.55
echo.
echo     5. Resign to 4.21
echo.
echo     6. Resign to DEX
echo.
echo ===============================
if exist 355.txt (goto 355)
if exist 421.txt (goto 421)
if exist np355.txt (goto np355)
if exist np421.txt (goto np421)
if exist dex.txt (goto dex)
if exist npdex.txt (goto npdex)
set /p dik= Your Choice (1-6):
if %dik%==1 echo np355 >np355.txt
if %dik%==1 (goto np355)
if %dik%==2 echo np421 >np421.txt
if %dik%==2 (goto np421)
if %dik%==3 echo npdex >npdex.txt
if %dik%==3 (goto npdex)
if %dik%==4 echo 355 >355.txt
if %dik%==4 (goto 355)
if %dik%==5 echo 421 >421.txt
if %dik%==5 (goto 421)
if %dik%==6 echo dex >dex.txt
if %dik%==6 (goto dex)
echo You can only choose 1-6
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
if %ylsp%==1 set dev=%klic%
if %ylsp%==1 (goto gyu)
if %ylsp%==2 set dev=%klic2%
if %ylsp%==2 (goto gyu)
if %ylsp%==3 set dev=%klic3%
if %ylsp%==3 (goto gyu)
cls
goto getk

:gyu
if exist np355.txt (goto np355)
if exist np421.txt (goto np421)


:355
cls
if "%ELF_TYPE%"=="[EXEC]" scetool --verbose --sce-type=SELF --skip-sections=FALSE --self-add-shdrs=TRUE --compress-data=TRUE --key-revision=0A --self-app-version=0001000000000000 --self-auth-id=1010000001000003 --self-vendor-id=01000002 --self-ctrl-flags=0000000000000000000000000000000000000000000000000000000000000000 --self-cap-flags=00000000000000000000000000000000000000000000003B0000000100040000 --self-type=APP --self-fw-version=0003005500000000 --encrypt %DIR_DEST%/%elf% %DIR_DEST%/%self%
if "%ELF_TYPE%"=="[PRX]" scetool --verbose --sce-type=SELF --skip-sections=FALSE --self-add-shdrs=TRUE --compress-data=FALSE --key-revision=0A --self-app-version=0001000000000000 --self-auth-id=1010000001000003 --self-vendor-id=01000002 --self-ctrl-flags=0000000000000000000000000000000000000000000000000000000000000000 --self-cap-flags=00000000000000000000000000000000000000000000003B0000000100040000 --self-type=APP --self-fw-version=0003005500000000 --encrypt %DIR_DEST%/%elf% %DIR_DEST%/%self%
cls
goto finisha

:421
cls
if "%ELF_TYPE%"=="[EXEC]" scetool --verbose --sce-type=SELF --skip-sections=FALSE --self-add-shdrs=TRUE --compress-data=TRUE --key-revision=1C --self-app-version=0001000000000000 --self-auth-id=1010000001000003 --self-vendor-id=01000002 --self-ctrl-flags=0000000000000000000000000000000000000000000000000000000000000000 --self-cap-flags=00000000000000000000000000000000000000000000003B0000000100040000 --self-type=APP --self-fw-version=0004002100000000 --encrypt %DIR_DEST%/%elf% %DIR_DEST%/%self%
if "%ELF_TYPE%"=="[PRX]" scetool --verbose --sce-type=SELF --skip-sections=FALSE --self-add-shdrs=TRUE --compress-data=TRUE --key-revision=1C --self-app-version=0001000000000000 --self-auth-id=1010000001000003 --self-vendor-id=01000002 --self-ctrl-flags=0000000000000000000000000000000000000000000000000000000000000000 --self-cap-flags=00000000000000000000000000000000000000000000003B0000000100040000 --self-type=APP --self-fw-version=0004002100000000 --encrypt %DIR_DEST%/%elf% %DIR_DEST%/%self%
cls
goto finisha

:dex
make_fself -c %DIR_DEST%/%elf% %DIR_DEST%/%self%
cls
goto finisha

:np355
cls
if "%ELF_TYPE%"=="[EXEC]" scetool --verbose --skip-sections=FALSE --sce-type=SELF --compress-data=TRUE --key-revision=0A --self-app-version=0001000000000000 --self-auth-id=1010000001000003 --self-vendor-id=01000002 --self-ctrl-flags=0000000000000000000000000000000000000000000000000000000000000000 --self-cap-flags=00000000000000000000000000000000000000000000003B0000000100020000 --self-type=NPDRM --self-fw-version=0003005500000000 --np-license-type=FREE --np-app-type=%apptype% --np-klicensee=%dev% --np-content-id=%contentid% --np-real-fname=%self% --encrypt %DIR_DEST%/%elf% %DIR_DEST%/%self%
if "%ELF_TYPE%"=="[PRX]" scetool --verbose --skip-sections=FALSE --sce-type=SELF --compress-data=TRUE --key-revision=0A --self-app-version=0001000000000000 --self-auth-id=1010000001000003 --self-vendor-id=01000002 --self-ctrl-flags=0000000000000000000000000000000000000000000000000000000000000000 --self-cap-flags=00000000000000000000000000000000000000000000003B0000000100020000 --self-type=NPDRM --self-fw-version=0003005500000000 --np-license-type=FREE --np-app-type=%apptype% --np-klicensee=%dev% --np-content-id=%contentid% --np-real-fname=%self% --encrypt %DIR_DEST%/%elf% %DIR_DEST%/%self%
cls
goto finisha

:np421
cls
if "%ELF_TYPE%"=="[EXEC]" scetool --verbose --skip-sections=FALSE --sce-type=SELF --compress-data=TRUE --key-revision=1C --self-app-version=0001000000000000 --self-auth-id=1010000001000003 --self-vendor-id=01000002 --self-ctrl-flags=0000000000000000000000000000000000000000000000000000000000000000 --self-cap-flags=00000000000000000000000000000000000000000000003B0000000100020000 --self-type=NPDRM --self-fw-version=0004002100000000 --np-license-type=FREE --np-app-type=%apptype% --np-klicensee=%dev% --np-content-id=%contentid% --np-real-fname=%self% --encrypt %DIR_DEST%/%elf% %DIR_DEST%/%self%
if "%ELF_TYPE%"=="[PRX]" scetool --verbose --skip-sections=FALSE --sce-type=SELF --compress-data=TRUE --key-revision=1C --self-app-version=0001000000000000 --self-auth-id=1010000001000003 --self-vendor-id=01000002 --self-ctrl-flags=0000000000000000000000000000000000000000000000000000000000000000 --self-cap-flags=00000000000000000000000000000000000000000000003B0000000100020000 --self-type=NPDRM --self-fw-version=0004002100000000 --np-license-type=FREE --np-app-type=%apptype% --np-klicensee=%dev% --np-content-id=%contentid% --np-real-fname=%self% --encrypt %DIR_DEST%/%elf% %DIR_DEST%/%self%
cls
goto finisha

:npdex
make_fself_npdrm -c %DIR_DEST%/%elf% %DIR_DEST%/%self%
cls goto finisha

:finisha

if exist %DIR_DEST%\*.ELF del %DIR_DEST%\*.ELF

:endw