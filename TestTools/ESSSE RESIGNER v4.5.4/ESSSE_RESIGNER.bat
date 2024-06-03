@echo off
Title E/S/S/S/E Resigner v4.5.4
color 0A
if exist zoff goto menu2
if exist ztemp goto menu2
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
sfk color green && echo                oooooooooooo      88  .oooooo..o      88  .oooooo..o      88  .oooooo..o      88 oooooooooooo
sfk color green && echo                `888'     `8     .8' d8P'    `Y8     .8' d8P'    `Y8     .8' d8P'    `Y8     .8' `888'     `8
sfk color yellow && echo                 888            .8'  Y88bo.         .8'  Y88bo.         .8'  Y88bo.         .8'   888        
sfk color yellow && echo                 888oooo8      .8'    `"Y8888o.    .8'    `"Y8888o.    .8'    `"Y8888o.    .8'    888oooo8   
sfk color magenta && echo                 888    "     .8'         `"Y88b  .8'         `"Y88b  .8'         `"Y88b  .8'     888    "   
sfk color magenta && echo                 888       o .8'     oo     .d8P .8'     oo     .d8P .8'     oo     .d8P .8'      888       o
sfk color magenta && echo                o888ooooood8 88      8""88888P'  88      8""88888P'  88      8""88888P'  88      o888ooooood8
ping 127.0.0.1 -n 2 > nul
echo.
sfk color yellow && echo                                                   (PRONOUNCED "EASY")
echo.
ping 127.0.0.1 -n 2 > nul
sfk color green && echo                                                      Version 4.5.4

:menu

ping 127.0.0.1 -n 2 > nul
:menu2
if exist temp RD /S /Q temp
if exist dex.txt del dex.txt
if exist npdex.txt del npdex.txt
if exist ztemp del ztemp
if exist chk.txt del chk.txt
if exist kli.txt del kli.txt
if exist kl.txt del kl.txt
if exist fw.txt del fw.txt
if exist lic.txt del lic.txt
if exist cont.txt del cont.txt
if exist lice.txt del lice.txt
if exist typ.txt del typ.txt
if exist klic.bin del klic.bin
if exist ver.txt del ver.txt
if exist cid.txt del cid.txt
if exist titled.txt del titled.txt
if exist tid.txt del tid.txt
if exist results.txt del results.txt
if exist selfinfo.txt del selfinfo.txt
if exist update.txt del update.txt
if exist devk.txt del devk.txt
if exist k2.txt del k2.txt
if exist devk2.txt del devk2.txt
if exist title.txt del title.txt
if exist package.conf del package.conf
if exist exec.txt del exec.txt
if exist prx.txt del prx.txt
if exist NKF.txt del NKF.txt
if exist klic2.txt del klic2.txt
if exist klic3.txt del klic3.txt
if exist 355.txt del 355.txt
if exist 421.txt del 421.txt
if exist np355.txt del np355.txt
if exist np421.txt del np421.txt
if exist content.txt del content.txt
if exist edatinfo.txt del edatinfo.txt
if exist edatinfo2.txt del edatinfo2.txt
if exist deckey.txt del deckey.txt
if exist devkey.txt del devkey.txt
if exist edtflg.txt del edtflg.txt
cls
echo ===============================================================================
sfk color yellow && echo *++++++++++++++++++++++++++++++++++E+S+S+S+E+v4+++++++++++++++++++++++++++++++*
sfk color green && echo ===============================================================================
echo ============    ----------------------------------------------     ============
echo ===========     ODE and CFW EBOOT/SELF/SPRX/SDAT/EDAT Resigner      ===========
echo ==========      ----------------------------------------------       ==========
echo =========                                                             =========
echo ========      A. Resign EBOOT           G. ADD a klicense to list      ========
echo =======                                                                 =======
echo ======        B. Resign SELF Files      H. Edit PARAM.SFO                ======
echo =====                                                                     =====
echo =====         C. Resign SPRX Files      I. Make c00 license Edat          =====
echo =====                                                                     =====
echo =====         D. Resign SDAT Files      J. Convert RAPS to RIFS           =====
echo ======                                                                   ======
echo =======       E. Resign EDAT Files      K. About E/S/S/S/E Resigner     =======
echo ========                                                               ========
echo =========     F. Bruteforce EDAT        L. EXIT                       =========
echo ==========                                                           ==========
echo ===============================================================================
sfk color yellow && echo **     Resign your EBOOT/SELF/SPRX/SDAT/EDAT files for use in ODE or CFW     **
sfk color green && echo *******************************************************************************
echo ===============================================================================
echo.
set "choice="
2>nul >nul choice /c:yn /t 0 /d y
if errorlevel 1 if not errorlevel 2 set "choice=choice /cs"
if not defined choice (
  2>nul >nul choice /c:yn /t:y,1
  if errorlevel 1 if not errorlevel 2 set "choice=choice /s"
)
if not defined choice goto ERROR

CHOICE /C abcdefghijkl /N /M "Select a Letter (A-L):"

if errorlevel 12 goto exit
if errorlevel 11 goto ABOUT
if errorlevel 10 goto rifs
if errorlevel 9 goto c00
if errorlevel 8 goto SFO
if errorlevel 7 goto KLICE
if errorlevel 6 goto BFEDAT
if errorlevel 5 goto EDAT
if errorlevel 4 goto SDAT
if errorlevel 3 goto SPRX
if errorlevel 2 goto SELF
if errorlevel 1 goto EBOOT
pause
cls
goto menu

:ERROR

set /p xp2= Your Choice (A-L):
if %xp2%==A goto EBOOT
if %xp2%==B goto SELF
if %xp2%==C goto SPRX
if %xp2%==D goto SDAT
if %xp2%==E goto EDAT
if %xp2%==F goto BFEDAT
if %xp2%==G goto KLICE
if %xp2%==H goto SFO
if %xp2%==I goto c00
if %xp2%==J goto rifs
if %xp2%==K goto ABOUT
if %xp2%==L goto exit
if %xp2%==a goto EBOOT
if %xp2%==b goto SELF
if %xp2%==c goto SPRX
if %xp2%==d goto SDAT
if %xp2%==e goto EDAT
if %xp2%==f goto BFEDAT
if %xp2%==g goto KLICE
if %xp2%==h goto SFO
if %xp2%==i goto c00
if %xp2%==j goto rifs
if %xp2%==k goto ABOUT
if %xp2%==l goto exit
echo You can only choose A-L
pause
cls
goto menu2


:EBOOT

set DIR_RAP=RAPS
echo.
sfk color yellow && if not exist EBOOT.BIN echo Make sure EBOOT.BIN is in this folder...
sfk color green && echo.
if not exist EBOOT.BIN pause
cls
if exist EBOOT.ELF echo.
if exist EBOOT.ELF echo ====================================
sfk color yellow && if exist EBOOT.ELF echo Unknown "EBOOT.ELF" found in folder!
sfk color green && if exist EBOOT.ELF echo ====================================

if exist EBOOT.ELF pause
if exist EBOOT.ELF (goto menu2)
if not exist EBOOT.BIN echo.
if not exist EBOOT.BIN echo ===============================
sfk color magenta && if not exist EBOOT.BIN echo   *********WARNING!*********
sfk color green && if not exist EBOOT.BIN echo ===============================
sfk color yellow && if not exist EBOOT.BIN echo No "EBOOT.BIN" found in folder!
sfk color green && if not exist EBOOT.BIN echo ===============================
if not exist EBOOT.BIN pause
if not exist EBOOT.BIN (goto menu2)

scetool.exe -i EBOOT.BIN >selfinfo.txt
for /f "skip=3 tokens=1,*" %%a in (selfinfo.txt) do if "%%a"=="ContentID" set contentid=%%b
echo %contentid% >cid.txt
for /f "tokens=2 delims=-,_" %%c in (cid.txt) do set titleid=%%c
for /f "skip=3 tokens=1,*" %%d in (selfinfo.txt) do if "%%d"=="Licence" set Licence=%%e
for /f "skip=3 tokens=1,*" %%f in (selfinfo.txt) do if "%%f"=="SELF-Type" set type=%%g
for /f "skip=3 tokens=1,*" %%h in (selfinfo.txt) do if "%%h"=="App" set app=%%i
for /f "skip=3 tokens=1,*" %%j in (selfinfo.txt) do if "%%j"=="FW" set FW=%%k
for /f "skip=3 tokens=1,*" %%p in (selfinfo.txt) do if "%%p"=="Key" set Key=%%q
echo %FW% >fw.txt
for /f "tokens=3" %%l in (fw.txt) do set fwv=%%l
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


if "%Licence%"=="Type 0x00000001" echo ****************************************
if "%Licence%"=="Type 0x00000001" cls
if "%Licence%"=="Type 0x00000001" echo ****************************************
sfk color red && if "%Licence%"=="Type 0x00000001" echo ***************[WARNING]****************
sfk color green && if "%Licence%"=="Type 0x00000001" echo *                                      *
if "%Licence%"=="Type 0x00000001" echo *  This is a NETWORK TYPE NPDRM EBOOT  *
if "%Licence%"=="Type 0x00000001" echo * Game Needs Online Connection to Run! *
if "%Licence%"=="Type 0x00000001" echo *   Place rap file in "RAPS" folder    *
if "%Licence%"=="Type 0x00000001" echo *                                      *
if "%Licence%"=="Type 0x00000001" echo *************[Content-ID]***************
if "%Licence%"=="Type 0x00000001" echo *                                      *
if "%Licence%"=="Type 0x00000001" echo * %contentid% *
if "%Licence%"=="Type 0x00000001" echo *                                      *
if "%Licence%"=="Type 0x00000001" echo ***************[Title-ID]***************
if "%Licence%"=="Type 0x00000001" echo *                                      *
if "%Licence%"=="Type 0x00000001" echo *              [%titleid%]             *
if "%Licence%"=="Type 0x00000001" echo *                                      *
if "%Licence%"=="Type 0x00000001" echo ***************[Firmware]***************
if "%Licence%"=="Type 0x00000001" echo *                                      *
if "%Licence%"=="Type 0x00000001" echo *          FW Version %fwv%          *
if "%Licence%"=="Type 0x00000001" echo *                                      *
if "%Licence%"=="Type 0x00000001" echo ****************************************
if "%Licence%"=="Type 0x00000001" pause
if "%Licence%"=="Type 0x00000001" (goto cde)
if not "%Licence%"=="Type 0x00000001" (goto gbg)

if "%Licence%"=="Type   [NETWORK]" echo ****************************************
if "%Licence%"=="Type   [NETWORK]" cls
if "%Licence%"=="Type   [NETWORK]" echo ****************************************
sfk color red && if "%Licence%"=="Type   [NETWORK]" echo ***************[WARNING]****************
sfk color green && if "%Licence%"=="Type   [NETWORK]" echo *                                      *
if "%Licence%"=="Type   [NETWORK]" echo *  This is a NETWORK TYPE NPDRM EBOOT  *
if "%Licence%"=="Type   [NETWORK]" echo * Game Needs Online Connection to Run! *
if "%Licence%"=="Type   [NETWORK]" echo *   Place rap file in "RAPS" folder    *
if "%Licence%"=="Type   [NETWORK]" echo *                                      *
if "%Licence%"=="Type   [NETWORK]" echo *************[Content-ID]***************
if "%Licence%"=="Type   [NETWORK]" echo *                                      *
if "%Licence%"=="Type   [NETWORK]" echo * %contentid% *
if "%Licence%"=="Type   [NETWORK]" echo *                                      *
if "%Licence%"=="Type   [NETWORK]" echo ***************[Title-ID]***************
if "%Licence%"=="Type   [NETWORK]" echo *                                      *
if "%Licence%"=="Type   [NETWORK]" echo *              [%titleid%]             *
if "%Licence%"=="Type   [NETWORK]" echo *                                      *
if "%Licence%"=="Type   [NETWORK]" echo ***************[Firmware]***************
if "%Licence%"=="Type   [NETWORK]" echo *                                      *
if "%Licence%"=="Type   [NETWORK]" echo *          FW Version %fwv%          *
if "%Licence%"=="Type   [NETWORK]" echo *                                      *
if "%Licence%"=="Type   [NETWORK]" echo ****************************************
if "%Licence%"=="Type   [NETWORK]" pause
if "%Licence%"=="Type   [NETWORK]" (goto cde)
if not "%Licence%"=="Type   [NETWORK]" (goto gbg)


:gbg
if "%Licence%"=="Type 0x00000002" echo ****************************************
if "%Licence%"=="Type 0x00000002" cls
if "%Licence%"=="Type 0x00000002" echo ****************************************
sfk color red && if "%Licence%"=="Type 0x00000002" echo ***************[WARNING]****************
sfk color green && if "%Licence%"=="Type 0x00000002" echo *                                      *
if "%Licence%"=="Type 0x00000002" echo * This is a LOCAL TYPE NPDRM EBOOT.BIN *
if "%Licence%"=="Type 0x00000002" echo *   Place rap file in "RAPS" folder    *
if "%Licence%"=="Type 0x00000002" echo *                                      *
if "%Licence%"=="Type 0x00000002" echo *************[Content-ID]***************
if "%Licence%"=="Type 0x00000002" echo *                                      *
if "%Licence%"=="Type 0x00000002" echo * %contentid% *
if "%Licence%"=="Type 0x00000002" echo *                                      *
if "%Licence%"=="Type 0x00000002" echo ***************[Title-ID]***************
if "%Licence%"=="Type 0x00000002" echo *                                      *
if "%Licence%"=="Type 0x00000002" echo *              [%titleid%]             *
if "%Licence%"=="Type 0x00000002" echo *                                      *
if "%Licence%"=="Type 0x00000002" echo ***************[Firmware]***************
if "%Licence%"=="Type 0x00000002" echo *                                      *
if "%Licence%"=="Type 0x00000002" echo *          FW Version %fwv%          *
if "%Licence%"=="Type 0x00000002" echo *                                      *
if "%Licence%"=="Type 0x00000002" echo ****************************************
if "%Licence%"=="Type 0x00000002" pause
if "%Licence%"=="Type 0x00000002" (goto cde)
if not "%Licence%"=="Type 0x00000002" (goto yhr)


if "%Licence%"=="Type   [LOCAL]" echo ****************************************
if "%Licence%"=="Type   [LOCAL]" cls
if "%Licence%"=="Type   [LOCAL]" echo ****************************************
sfk color red && if "%Licence%"=="Type   [LOCAL]" echo ***************[WARNING]****************
sfk color green && if "%Licence%"=="Type   [LOCAL]" echo *                                      *
if "%Licence%"=="Type   [LOCAL]" echo * This is a LOCAL TYPE NPDRM EBOOT.BIN *
if "%Licence%"=="Type   [LOCAL]" echo *   Place rap file in "RAPS" folder    *
if "%Licence%"=="Type   [LOCAL]" echo *                                      *
if "%Licence%"=="Type   [LOCAL]" echo *************[Content-ID]***************
if "%Licence%"=="Type   [LOCAL]" echo *                                      *
if "%Licence%"=="Type   [LOCAL]" echo * %contentid% *
if "%Licence%"=="Type   [LOCAL]" echo *                                      *
if "%Licence%"=="Type   [LOCAL]" echo ***************[Title-ID]***************
if "%Licence%"=="Type   [LOCAL]" echo *                                      *
if "%Licence%"=="Type   [LOCAL]" echo *              [%titleid%]             *
if "%Licence%"=="Type   [LOCAL]" echo *                                      *
if "%Licence%"=="Type   [LOCAL]" echo ***************[Firmware]***************
if "%Licence%"=="Type   [LOCAL]" echo *                                      *
if "%Licence%"=="Type   [LOCAL]" echo *          FW Version %fwv%          *
if "%Licence%"=="Type   [LOCAL]" echo *                                      *
if "%Licence%"=="Type   [LOCAL]" echo ****************************************
if "%Licence%"=="Type   [LOCAL]" pause
if "%Licence%"=="Type   [LOCAL]" (goto cde)
if not "%Licence%"=="Type   [LOCAL]" (goto yhr)


:cde
if not exist "%DIR_RAP%"\"%contentid%.rap" echo =======================
if not exist "%DIR_RAP%"\"%contentid%.rap" cls
if not exist "%DIR_RAP%"\"%contentid%.rap" echo =======================
sfk color red && if not exist "%DIR_RAP%"\"%contentid%.rap" echo *******[WARNING]*******
sfk color green && if not exist "%DIR_RAP%"\"%contentid%.rap" echo =======================
if not exist "%DIR_RAP%"\"%contentid%.rap" echo. 
if not exist "%DIR_RAP%"\"%contentid%.rap" echo   No or Wrong rap in
if not exist "%DIR_RAP%"\"%contentid%.rap" echo   RAPS folder  Can't 
if not exist "%DIR_RAP%"\"%contentid%.rap" echo   Decrypt this Eboot 
if not exist "%DIR_RAP%"\"%contentid%.rap" echo.  
if not exist "%DIR_RAP%"\"%contentid%.rap" echo =======================
if not exist "%DIR_RAP%"\"%contentid%.rap" pause
if not exist "%DIR_RAP%"\"%contentid%.rap" cls
if not exist "%DIR_RAP%"\"%contentid%.rap" goto menu2


:yhr
if "%Licence%"=="Type 0x00000003" echo ****************************************
if "%Licence%"=="Type 0x00000003" cls
if "%Licence%"=="Type 0x00000003" echo ****************************************
sfk color red && if "%Licence%"=="Type 0x00000003" echo **************[WARNING]*****************
sfk color green && if "%Licence%"=="Type 0x00000003" echo *                                      *
if "%Licence%"=="Type 0x00000003" echo * This is a FREE TYPE NPDRM EBOOT.BIN  *
if "%Licence%"=="Type 0x00000003" echo * other files in pkg may need klicense *
if "%Licence%"=="Type 0x00000003" echo * (i.e SELF, SPRX)                     *
if "%Licence%"=="Type 0x00000003" echo *                                      *
if "%Licence%"=="Type 0x00000003" echo *************[Content-ID]***************
if "%Licence%"=="Type 0x00000003" echo *                                      *
if "%Licence%"=="Type 0x00000003" echo * %contentid% *
if "%Licence%"=="Type 0x00000003" echo *                                      *
if "%Licence%"=="Type 0x00000003" echo ***************[Title-ID]***************
if "%Licence%"=="Type 0x00000003" echo *                                      *
if "%Licence%"=="Type 0x00000003" echo *              [%titleid%]             *
if "%Licence%"=="Type 0x00000003" echo *                                      *
if "%Licence%"=="Type 0x00000003" echo ***************[Firmware]***************
if "%Licence%"=="Type 0x00000003" echo *                                      *
if "%Licence%"=="Type 0x00000003" echo *          FW Version %fwv%          *
if "%Licence%"=="Type 0x00000003" echo *                                      *
if "%Licence%"=="Type 0x00000003" echo ****************************************
if "%Licence%"=="Type 0x00000003" pause

if "%Licence%"=="Type   [FREE]" echo ****************************************
if "%Licence%"=="Type   [FREE]" cls
if "%Licence%"=="Type   [FREE]" echo ****************************************
sfk color red && if "%Licence%"=="Type   [FREE]" echo **************[WARNING]*****************
sfk color green && if "%Licence%"=="Type   [FREE]" echo *                                      *
if "%Licence%"=="Type   [FREE]" echo * This is a FREE TYPE NPDRM EBOOT.BIN  *
if "%Licence%"=="Type   [FREE]" echo * other files in pkg may need klicense *
if "%Licence%"=="Type   [FREE]" echo * (i.e SELF, SPRX)                     *
if "%Licence%"=="Type   [FREE]" echo *                                      *
if "%Licence%"=="Type   [FREE]" echo *************[Content-ID]***************
if "%Licence%"=="Type   [FREE]" echo *                                      *
if "%Licence%"=="Type   [FREE]" echo * %contentid% *
if "%Licence%"=="Type   [FREE]" echo *                                      *
if "%Licence%"=="Type   [FREE]" echo ***************[Title-ID]***************
if "%Licence%"=="Type   [FREE]" echo *                                      *
if "%Licence%"=="Type   [FREE]" echo *              [%titleid%]             *
if "%Licence%"=="Type   [FREE]" echo *                                      *
if "%Licence%"=="Type   [FREE]" echo ***************[Firmware]***************
if "%Licence%"=="Type   [FREE]" echo *                                      *
if "%Licence%"=="Type   [FREE]" echo *          FW Version %fwv%          *
if "%Licence%"=="Type   [FREE]" echo *                                      *
if "%Licence%"=="Type   [FREE]" echo ****************************************
if "%Licence%"=="Type   [FREE]" pause

if not "%Key%"=="Revision    [DEBUG]" (goto scetool1)

:dwd
if "%Key%"=="Revision    [DEBUG]" cls
if "%Key%"=="Revision    [DEBUG]" echo ****************************************
sfk color red && if "%Key%"=="Revision    [DEBUG]" echo ***************[WARNING]****************
sfk color green && if "%Key%"=="Revision    [DEBUG]" echo *                                      *
if "%Key%"=="Revision    [DEBUG]" echo *     This is a DEBUG EBOOT.BIN        *
if "%Key%"=="Revision    [DEBUG]" echo *                                      *
if "%Key%"=="Revision    [DEBUG]" echo *    Do you want to Decrypt FSELF      *
if "%Key%"=="Revision    [DEBUG]" echo *                                      *
if "%Key%"=="Revision    [DEBUG]" echo *              1. YES                  *    
if "%Key%"=="Revision    [DEBUG]" echo *              2. NO                   *
if "%Key%"=="Revision    [DEBUG]" echo *                                      *
if "%Key%"=="Revision    [DEBUG]" echo ****************************************
if "%Key%"=="Revision    [DEBUG]" set /p DG= Your Choice (1-2):
if "%Key%"=="Revision    [DEBUG]" if %DG%==1 (goto debug)
if "%Key%"=="Revision    [DEBUG]" if %DG%==2 (goto menu2)
if "%Key%"=="Revision    [DEBUG]" echo You can only choose 1-2
if "%Key%"=="Revision    [DEBUG]" pause
if "%Key%"=="Revision    [DEBUG]" cls
if "%Key%"=="Revision    [DEBUG]" goto dwd

:scetool1
scetool -v -d "EBOOT.BIN" "EBOOT.ELF"
if not exist "EBOOT.ELF" scetool.exe -l 74376384BA498BFF3DBB949F0B6A929D -v -d "EBOOT.BIN" "EBOOT.ELF"
if not exist "EBOOT.ELF" scetool.exe -l B8498B3492E822F7D2390862568B03C7 -v -d "EBOOT.BIN" "EBOOT.ELF"
if not exist "EBOOT.ELF" scetool.exe -v -r -d "EBOOT.BIN" "EBOOT.ELF"
if not exist "EBOOT.ELF" pause
if not exist "EBOOT.ELF" echo.
if not exist "EBOOT.ELF" echo *****************************
sfk color yellow && if not exist "EBOOT.ELF" echo * Cannot Decrypt EBOOT.BIN  *
sfk color green && if not exist "EBOOT.ELF" echo *****************************
if not exist "EBOOT.ELF" pause
if not exist "EBOOT.ELF" cls
if not exist "EBOOT.ELF" goto menu2
if exist EBOOT.ELF FixELF.exe "EBOOT.ELF"
if exist EBOOT.ELF rename EBOOT.BIN EBOOT.BIN.ORIG

if "%type%"=="[Application]" (goto disc)
if "%Licence%"=="Type 0x00000001" (goto network)
if "%Licence%"=="Type 0x00000002" (goto local)
if "%Licence%"=="Type 0x00000003" (goto free)
if "%Licence%"=="Type   [FREE]" (goto free)
if "%Licence%"=="Type   [LOCAL]" (goto local)
if "%Licence%"=="Type   [NETWORK]" (goto network)

:disc
cls
echo =======================
sfk color yellow && echo   FW Version %fwv% 
sfk color green && echo =======================
sfk color yellow && echo ***[DISC TYPE EBOOT]***
sfk color green && echo =======================
echo.
echo   1. Resign to 3.55 (ODE)
echo.
echo   2. Resign to 3.55
echo.
echo   3. Resign to 4.21
echo.
echo   4. Resign to DEX (NON-DRM)
echo.
echo   5. Resign to DEX (NPDRM)
echo =======================

set /p sic= Your Choice (1-5):
if %sic%==1 (goto 355)
if %sic%==2 (goto 355cfw)
if %sic%==3 (goto 421)
if %sic%==4 (goto DEX)
if %sic%==5 (goto npDEX)
echo You can only choose 1-5
pause
cls
goto disc

:network
cls
echo               ==============================
sfk color yellow && echo               *****[NETWORK TYPE NPDRM]*****
sfk color green && echo =============================================================
echo ------------------------------ ------------------------------
sfk color yellow && echo   Resign to FREE TYPE NPDRM         Resign to DEX NPDRM 
sfk color green && echo ------------------------------ ------------------------------
echo.
echo     1. Resign to FREE TYPE        6. Resign to DEX NPDRM
echo            NPDRM 3.55
echo. 
echo     2. Resign to FREE TYPE
echo            NPDRM 4.21
echo.
echo =============================== =============================
sfk color yellow && echo    Resign to DISC TYPE APP         Resign to DEX Disc Type 
sfk color green && echo ------------------------------- -----------------------------
echo.  
echo     3. Resign to 3.55 (ODE)       7. Resign to DEX NON-DRM
echo.
echo     4. Resign to 3.55
echo.
echo     5. Resign to 4.21
echo.
echo =============================================================

set /p nick= Your Choice (1-7):
if %nick%==1 (goto np355)
if %nick%==2 (goto np421)
if %nick%==3 (goto 355)
if %nick%==4 (goto 355cfw)
if %nick%==5 (goto 421)
if %nick%==6 (goto npDEX)
if %nick%==7 (goto DEX)
echo You can only choose 1-7
pause
cls
goto network

:local
cls
echo               ==============================
sfk color yellow && echo               ******[LOCAL TYPE NPDRM]******
sfk color green && echo =============================================================
echo ------------------------------ ------------------------------
sfk color yellow && echo   Resign to FREE TYPE NPDRM         Resign to DEX NPDRM 
sfk color green && echo ------------------------------ ------------------------------
echo.
echo     1. Resign to FREE TYPE        6. Resign to DEX NPDRM
echo            NPDRM 3.55
echo. 
echo     2. Resign to FREE TYPE
echo            NPDRM 4.21
echo.
echo =============================== =============================
sfk color yellow && echo    Resign to DISC TYPE APP         Resign to DEX Disc Type 
sfk color green && echo ------------------------------- -----------------------------
echo.  
echo     3. Resign to 3.55 (ODE)       7. Resign to DEX NON-DRM
echo.
echo     4. Resign to 3.55
echo.
echo     5. Resign to 4.21
echo.
echo =============================================================

set /p sick= Your Choice (1-7):
if %sick%==1 (goto np355)
if %sick%==2 (goto np421)
if %sick%==3 (goto 355)
if %sick%==4 (goto 355cfw)
if %sick%==5 (goto 421)
if %sick%==6 (goto npDEX)
if %sick%==7 (goto DEX)
echo You can only choose 1-7
pause
cls
goto local

:free
cls
echo                ==============================
sfk color yellow && echo                ******[FREE TYPE NPDRM]*******
sfk color green && echo ===========================================================
echo ------------------------------ ----------------------------
sfk color yellow && echo     Resign FREE TYPE NPDRM         Resign to DEX NPDRM 
sfk color green && echo ------------------------------ ----------------------------
echo.
echo     1. Resign to FREE TYPE       6. Resign to DEX NPDRM
echo            NPDRM 3.55
echo. 
echo     2. Resign to FREE TYPE
echo            NPDRM 4.21
echo.
echo =============================== ===========================
sfk color yellow && echo    Resign to DISC TYPE APP        Resign to DEX DISC TYPE 
sfk color green && echo ------------------------------- ---------------------------
echo.
echo     3. Resign to 3.55 (ODE)      7. Resign to DEX NON-DRM
echo.
echo     4. Resign to 3.55
echo.
echo     5. Resign to 4.21
echo.
echo ===========================================================

set /p sik= Your Choice (1-7):
if %sik%==1 (goto np355)
if %sik%==2 (goto np421)
if %sik%==3 (goto 355)
if %sik%==4 (goto 355cfw)
if %sik%==5 (goto 421)
if %sik%==6 (goto npDEX)
if %sik%==7 (goto DEX)
echo You can only choose 1-7
pause
cls
goto free

:dedebug
cls
echo ==========================
sfk color yellow && echo    Resign DEBUG EBOOT!
sfk color green && echo ==========================
echo.
echo   1. Resign to DEX NPDRM
echo.
echo   2. Resign to DEX NON-DRM
echo.
echo ===========================
set /p dexr= Your Choice (1-2):
if %dexr%==1 (goto npDEX)
if %dexr%==2 (goto DEX)
echo You can only choose 1-2
pause
cls
goto dedebug

if not exist EBOOT.ELF cls
if not exist EBOOT.ELF echo ====================================
sfk color red && if not exist EBOOT.ELF echo *************[WARNING]**************
sfk color green && if not exist EBOOT.ELF echo ====================================
if not exist EBOOT.ELF echo.
if not exist EBOOT.ELF echo Could not Decrypt EBOOT.BIN  No Rap 
if not exist EBOOT.ELF echo.
if not exist EBOOT.ELF echo ====================================
if not exist EBOOT.ELF pause
if not exist EBOOT.ELF cls
if not exist EBOOT.ELF goto menu2

:debug
cls
if not exist EBOOT.ELF unfself EBOOT.BIN EBOOT.ELF
if not exist EBOOT.ELF unself EBOOT.BIN EBOOT.ELF
if not exist EBOOT.ELF echo ================================
sfk color yellow && if not exist EBOOT.ELF echo  Can't Decrypt this DEBUG EBOOT
sfk color green && if not exist EBOOT.ELF echo ================================
if not exist EBOOT.ELF echo pause
if not exist EBOOT.ELF echo cls
if not exist EBOOT.ELF echo goto menu2
:debugd
if exist EBOOT.ELF echo ===================================
sfk color yellow && if exist EBOOT.ELF echo     DEBUG EBOOT.BIN Decrypted!
sfk color green && if exist EBOOT.ELF echo ===================================
if exist EBOOT.ELF echo.
if exist EBOOT.ELF echo     Do you want to Resign it
if exist EBOOT.ELF echo.
if exist EBOOT.ELF echo              1. YES
if exist EBOOT.ELF echo              2. NO
if exist EBOOT.ELF echo.
if exist EBOOT.ELF echo ------------------------------------
if exist EBOOT.ELF set /p drs= Choose 1 or 2 :
if exist EBOOT.ELF if %drs%==1 (goto dedebug)
if exist EBOOT.ELF if %drs%==2 (goto menu2)
if exist EBOOT.ELF echo You can only choose 1-2
if exist EBOOT.ELF pause
if exist EBOOT.ELF cls
if exist EBOOT.ELF goto debugd

:355
cls
echo ============================
sfk color yellow && echo Compress Eboot   1.YES  2.NO
sfk color green && echo ============================
set /p comp= Choose 1 or 2 :
if %comp%==1 set ce=TRUE
if %comp%==2 set ce=FALSE
cls
if "%ELF_TYPE%"=="[EXEC]" scetool --verbose --sce-type=SELF --skip-sections=FALSE --self-add-shdrs=TRUE --compress-data=%ce% --key-revision=0A --self-app-version=0001000000000000 --self-auth-id=1010000001000003 --self-vendor-id=01000002 --self-ctrl-flags=0000000000000000000000000000000000000000000000000000000000000000 --self-cap-flags=00000000000000000000000000000000000000000000003B0000000100040000 --self-type=APP --self-fw-version=0003005500000000 --encrypt EBOOT.ELF EBOOT.BIN
if "%ELF_TYPE%"=="[PRX]" scetool --verbose --sce-type=SELF --skip-sections=FALSE --self-add-shdrs=TRUE --compress-data=FALSE --key-revision=0A --self-app-version=0001000000000000 --self-auth-id=1010000001000003 --self-vendor-id=01000002 --self-ctrl-flags=0000000000000000000000000000000000000000000000000000000000000000 --self-cap-flags=00000000000000000000000000000000000000000000003B0000000100040000 --self-type=APP --self-fw-version=0003005500000000 --encrypt EBOOT.ELF EBOOT.BIN
goto finish

:355cfw
cls
echo ============================
sfk color yellow && echo Compress Eboot   1.YES  2.NO
sfk color green && echo ============================
set /p comp= Choose 1 or 2 :
if %comp%==1 set ce=TRUE
if %comp%==2 set ce=FALSE
cls
if "%ELF_TYPE%"=="[EXEC]" scetool --verbose --sce-type=SELF --skip-sections=FALSE --compress-data=%ce% --self-add-shdrs=TRUE --key-revision=0A --self-auth-id=1010000001000003 --self-vendor-id=01000002 --self-ctrl-flags=0000000000000000000000000000000000000000000000000000000000000000 --self-cap-flags=00000000000000000000000000000000000000000000003B0000000100040000 --self-app-version=0001000000000000 --self-type=APP --self-fw-version=0003005500000000 --encrypt EBOOT.ELF EBOOT.BIN
if "%ELF_TYPE%"=="[PRX]" scetool --verbose --sce-type=SELF --skip-sections=FALSE --self-add-shdrs=TRUE --compress-data=FALSE --key-revision=0A --self-app-version=0001000000000000 --self-auth-id=1010000001000003 --self-vendor-id=01000002 --self-ctrl-flags=0000000000000000000000000000000000000000000000000000000000000000 --self-cap-flags=00000000000000000000000000000000000000000000003B0000000100040000 --self-type=APP --self-fw-version=0003005500000000 --encrypt EBOOT.ELF EBOOT.BIN
goto finish

:DEX
cls
echo ============================
sfk color yellow && echo Compress Eboot   1.YES  2.NO
sfk color green && echo ============================
set /p comp= Choose 1 or 2 :
if %comp%==1 set ce=-c
if %comp%==2 set ce=-u
cls
make_fself %ce% EBOOT.ELF EBOOT.BIN
goto finish

:421
cls
echo ============================
sfk color yellow && echo Compress Eboot   1.YES  2.NO
sfk color green && echo ============================
set /p comp= Choose 1 or 2 :
if %comp%==1 set ce=TRUE
if %comp%==2 set ce=FALSE
cls
if "%ELF_TYPE%"=="[EXEC]" scetool --verbose --sce-type=SELF --skip-sections=FALSE --compress-data=%ce% --self-add-shdrs=TRUE --key-revision=1C --self-auth-id=1010000001000003 --self-vendor-id=01000002 --self-ctrl-flags=0000000000000000000000000000000000000000000000000000000000000000 --self-cap-flags=00000000000000000000000000000000000000000000003B0000000100040000 --self-app-version=0001000000000000 --self-type=APP --self-fw-version=0004002100000000 --encrypt EBOOT.ELF EBOOT.BIN
if "%ELF_TYPE%"=="[PRX]" scetool --verbose --sce-type=SELF --skip-sections=FALSE --self-add-shdrs=TRUE --compress-data=FALSE --key-revision=1C --self-app-version=0001000000000000 --self-auth-id=1010000001000003 --self-vendor-id=01000002 --self-ctrl-flags=0000000000000000000000000000000000000000000000000000000000000000 --self-cap-flags=00000000000000000000000000000000000000000000003B0000000100040000 --self-type=APP --self-fw-version=0004002100000000 --encrypt EBOOT.ELF EBOOT.BIN
goto finish

:np355
cls
echo ============================
sfk color yellow && echo Compress Eboot   1.YES  2.NO
sfk color green && echo ============================
set /p comp= Choose 1 or 2 :
if %comp%==1 set ce=TRUE
if %comp%==2 set ce=FALSE
cls
if "%ELF_TYPE%"=="[EXEC]" scetool --verbose --skip-sections=FALSE --sce-type=SELF --compress-data=%ce% --key-revision=0A --self-app-version=0001000000000000 --self-auth-id=1010000001000003 --self-vendor-id=01000002 --self-ctrl-flags=0000000000000000000000000000000000000000000000000000000000000000 --self-cap-flags=00000000000000000000000000000000000000000000003B0000000100020000 --self-type=NPDRM --self-fw-version=0003005500000000 --np-license-type=FREE --np-app-type=%apptype% --np-content-id=%contentid% --np-real-fname=EBOOT.BIN --encrypt EBOOT.ELF EBOOT.BIN
if "%ELF_TYPE%"=="[PRX]" scetool --verbose --skip-sections=FALSE --sce-type=SELF --compress-data=FALSE --key-revision=0A --self-app-version=0001000000000000 --self-auth-id=1010000001000003 --self-vendor-id=01000002 --self-ctrl-flags=0000000000000000000000000000000000000000000000000000000000000000 --self-cap-flags=00000000000000000000000000000000000000000000003B0000000100020000 --self-type=NPDRM --self-fw-version=0003005500000000 --np-license-type=FREE --np-app-type=%apptype% --np-content-id=%contentid% --np-real-fname=EBOOT.BIN --encrypt EBOOT.ELF EBOOT.BIN
goto finish

:npDEX
cls
echo ============================
sfk color yellow && echo Compress Eboot   1.YES  2.NO
sfk color green && echo ============================
set /p comp= Choose 1 or 2 :
if %comp%==1 set ce=-c
if %comp%==2 set ce=-u
cls
make_fself_npdrm %ce% EBOOT.ELF EBOOT.BIN
goto finish

:np421
cls
echo ============================
sfk color yellow && echo Compress Eboot   1.YES  2.NO
sfk color green && echo ============================
set /p comp= Choose 1 or 2 :
if %comp%==1 set ce=TRUE
if %comp%==2 set ce=FALSE
cls
if "%ELF_TYPE%"=="[EXEC]" scetool --verbose --skip-sections=FALSE --sce-type=SELF --compress-data=%ce% --key-revision=1C --self-app-version=0001000000000000 --self-auth-id=1010000001000003 --self-vendor-id=01000002 --self-ctrl-flags=0000000000000000000000000000000000000000000000000000000000000000 --self-cap-flags=00000000000000000000000000000000000000000000003B0000000100020000 --self-type=NPDRM --self-fw-version=0004002100000000 --np-license-type=FREE --np-app-type=%apptype% --np-content-id=%contentid% --np-real-fname=EBOOT.BIN --encrypt EBOOT.ELF EBOOT.BIN
if "%ELF_TYPE%"=="[PRX]" scetool --verbose --skip-sections=FALSE --sce-type=SELF --compress-data=FALSE --key-revision=1C --self-app-version=0001000000000000 --self-auth-id=1010000001000003 --self-vendor-id=01000002 --self-ctrl-flags=0000000000000000000000000000000000000000000000000000000000000000 --self-cap-flags=00000000000000000000000000000000000000000000003B0000000100020000 --self-type=NPDRM --self-fw-version=0004002100000000 --np-license-type=FREE --np-app-type=%apptype% --np-content-id=%contentid% --np-real-fname=EBOOT.BIN --encrypt EBOOT.ELF EBOOT.BIN
goto finish

:finish

if exist EBOOT.ELF del EBOOT.ELF
if exist EBOOT.BIN echo.
if exist EBOOT.BIN echo =====================
sfk color yellow && if exist EBOOT.BIN echo Auto-resign finished
sfk color green && if exist EBOOT.BIN echo =====================
sfk color yellow && if not exist EBOOT.BIN echo Can't Resign this Eboot
sfk color green 
pause
cls
goto menu2

:KLICE
cls
echo =======================================================================
sfk color yellow && echo *******************ONLY ENTER VALID KLICENSES***************************
echo *******DELETE NON-WORKING ONES FROM BOTTOM OF KLICENSE.TXT*************
sfk color green && echo =======================================================================
echo.
sfk color magenta && echo                Title-ID Example - [NPUB000000]
echo.
echo              Content-ID Example - JP9000-NPJA60003_00-0000000000000000
echo.
set /p ID= ENTER "TITLE-ID" or "CONTENT-ID" :
echo.
echo                Klicense Example - 00000000000000000000000000000000
echo.
set /p eklic= PLEASE  ENTER  "klicense"  HERE  :
sfk color green && echo=========================================================================
echo.
echo %eklic% %ID% >>klicense.txt
echo.
echo NEW "klicense" added to List
pause
cls
goto menu2

:SELF

SET DIR_SRC=SELF_Files
SET DIR_DEST=Resigned_SELFS
SET DIR_ORIG=ORIGINAL_FILES
SET DIR_RAP=RAPS

echo.
sfk color yellow && if not exist %DIR_SRC%\*.self echo Make sure SELF files are in "SELF_FILES" folder
sfk color green && echo.
if not exist %DIR_SRC%\*.self pause
cls


del /F /Q %DIR_DEST%\*.*
if exist 355.txt del 355.txt
if exist 421.txt del 421.txt
if exist np355.txt del np355.txt
if exist np421.txt del np421.txt
if exist %DIR_SRC%\*.self xcopy %DIR_SRC%\*.self %DIR_ORIG%\ /Y /Q
if not exist %DIR_SRC%\*.self echo.
if not exist %DIR_SRC%\*.self echo ********************************************
sfk color yellow && if not exist %DIR_SRC%\*.self echo No *.SELF file found in "SELF_Files" folder!
sfk color green && if not exist %DIR_SRC%\*.self echo ********************************************
if not exist %DIR_SRC%\*.self pause
if not exist %DIR_SRC%\*.self cls
if not exist %DIR_SRC%\*.self goto menu2
for /f "delims=|" %%f in ('dir /b %DIR_SRC%') do call make1.bat "%%~nf"

if exist %DIR_DEST%\*.SELF cls
if exist %DIR_DEST%\*.SELF echo **********************
if exist %DIR_DEST%\*.SELF echo ======================
sfk color yellow && if exist %DIR_DEST%\*.SELF echo *.SELF Files Resigned.
sfk color green && if exist %DIR_DEST%\*.SELF echo ======================
if exist %DIR_DEST%\*.SELF echo **********************

pause
if exist kli.txt del kli.txt
if exist tid.txt del tid.txt
if exist results.txt del results.txt
if exist dex.txt del dex.txt
if exist npdex.txt del npdex.txt
cls
ENDLOCAL
goto menu2


:SPRX

SET DIR_SRC=SPRX_Files
SET DIR_DEST=Resigned_SPRX
SET DIR_ORIG=ORIGINAL_FILES
SET DIR_RAP=RAPS

echo.
sfk color yellow && if not exist %DIR_SRC%\*.sprx echo Make sure SPRX files are in "SPRX_FILES" folder
sfk color green && echo.
if not exist %DIR_SRC%\*.sprx pause
cls


del /F /Q %DIR_DEST%\*.*
if exist 355.txt del 355.txt
if exist 421.txt del 421.txt
if exist np355.txt del np355.txt
if exist np421.txt del np421.txt
if exist %DIR_SRC%\*.sprx xcopy %DIR_SRC%\*.sprx %DIR_ORIG%\ /Y /Q
if not exist %DIR_SRC%\*.sprx echo.
if not exist %DIR_SRC%\*.sprx echo ********************************************
sfk color yellow && if not exist %DIR_SRC%\*.sprx echo No *.SPRX file found in "SPRX_Files" folder!
sfk color green && if not exist %DIR_SRC%\*.sprx echo ********************************************
if not exist %DIR_SRC%\*.sprx pause
if not exist %DIR_SRC%\*.sprx cls
if not exist %DIR_SRC%\*.sprx goto menu2
for /f "delims=|" %%f in ('dir /b %DIR_SRC%') do call make2.bat "%%~nf"

if exist %DIR_DEST%\*.SPRX cls
if exist %DIR_DEST%\*.SPRX echo **********************
if exist %DIR_DEST%\*.SPRX echo ======================
sfk color yellow && if exist %DIR_DEST%\*.SPRX echo *.SPRX Files Resigned.
sfk color green && if exist %DIR_DEST%\*.SPRX echo ======================
if exist %DIR_DEST%\*.SPRX echo **********************

pause
if exist kl.txt del kl.txt
if exist tid.txt del tid.txt
if exist results.txt del results.txt
cls
ENDLOCAL
goto menu2

:SDAT

SET DIR_SRC=SDAT_Files
SET DIR_DEST=Resigned_SDAT
SET DIR_ORIG=ORIGINAL_FILES

echo.
sfk color yellow && if not exist %DIR_SRC%\*.SDAT echo Make sure SDAT files are in "SDAT_FILES" folder
sfk color green && echo.
if not exist %DIR_SRC%\*.SDAT pause
cls
if not exist %DIR_SRC%\*.SDAT goto menu2
SET DIR_SRC=SDAT_Files
SET DIR_DEST=Resigned_SDAT
SET DIR_ORIG=ORIGINAL_FILES

del /F /Q %DIR_DEST%\*.*

xcopy %DIR_SRC%\*.SDAT %DIR_ORIG%\ /Y /Q
for /f "delims=|" %%f in ('dir /b %DIR_SRC%') do call make3.bat "%%~nf"

if exist %DIR_DEST%\*.SDAT echo ======================
sfk color yellow && if exist %DIR_DEST%\*.SDAT echo *.SDAT Files Resigned.
sfk color green && if exist %DIR_DEST%\*.SDAT echo ======================
if not exist %DIR_DEST%\*.SDAT echo ========================
sfk color yellow && if not exist %DIR_DEST%\*.SDAT echo Could not Decrypt files
sfk color green && if not exist %DIR_DEST%\*.SDAT echo ========================
pause
cls
ENDLOCAL
goto menu2

:EDAT

SET DIR_SRC=EDAT_Files
SET DIR_DEST=Resigned_EDAT
SET DIR_RAP=RAPS
SET DIR_ORIG=ORIGINAL_FILES

echo.
sfk color yellow && if not exist %DIR_SRC%\*.EDAT echo Make sure EDAT files are in "EDAT_FILES" folder
sfk color green && echo.
if not exist %DIR_SRC%\*.EDAT pause
cls
if not exist %DIR_SRC%\*.EDAT goto menu2

del /F /Q %DIR_DEST%\*.*

xcopy %DIR_SRC%\*.EDAT %DIR_ORIG%\ /Y /Q
for /f "delims=|" %%f in ('dir /b %DIR_SRC%') do call make4.bat "%%~nf"

if exist %DIR_DEST%\*.EDAT cls
if exist %DIR_DEST%\*.EDAT echo ======================
sfk color yellow && if exist %DIR_DEST%\*.EDAT echo *.EDAT Files Resigned.
sfk color green && if exist %DIR_DEST%\*.EDAT echo ======================
pause
cls
ENDLOCAL
goto menu2



:SFO

echo.
sfk color yellow && if not exist PARAM.SFO echo Make sure PARAM.SFO is in this folder...
sfk color green && echo.
if not exist PARAM.SFO pause
cls

if exist PARAM.SFO cls
if exist PARAM.SFO echo =======================
sfk color yellow && if exist PARAM.SFO echo    PARAM.SFO will be 
if exist PARAM.SFO echo  displayed for editing
sfk color green && if exist PARAM.SFO echo -----------------------
sfk color yellow && if exist PARAM.SFO echo Be sure to Set Catagory
if exist PARAM.SFO echo to: 
if exist PARAM.SFO echo     DG Disc Game
if exist PARAM.SFO echo     HG Harddrive Game
if exist PARAM.SFO echo     GD Game Data
sfk color green && if exist PARAM.SFO echo -----------------------
sfk color yellow && if exist PARAM.SFO echo Also Set PS3_System to
if exist PARAM.SFO echo FW below yours: 
if exist PARAM.SFO echo                 4.20
if exist PARAM.SFO echo                 3.55
if exist PARAM.SFO echo                 3.40
sfk color green && if exist PARAM.SFO echo =======================
sfk color yellow && if exist PARAM.SFO echo  Be sure to save file
sfk color green && if exist PARAM.SFO echo =======================
if exist PARAM.SFO pause

if exist PARAM.SFO Start /w PARAM_SFO_Editor.exe PARAM.SFO

if not exist PARAM.SFO cls
if not exist PARAM.SFO echo =========================
sfk color red && if not exist PARAM.SFO echo ********[WARNING]********
sfk color green && if not exist PARAM.SFO echo =========================
if not exist PARAM.SFO echo.
sfk color yellow && if not exist PARAM.SFO echo Could not find PARAM.SFO
sfk color green && if not exist PARAM.SFO echo.
if not exist PARAM.SFO echo =========================
if not exist PARAM.SFO pause
cls
goto menu2


:rifs
SETLOCAL
cls
echo.
echo =========================================
sfk color yellow && echo  Converts Raps to Rifs and puts into Pkg
sfk color green && echo =========================================
sfk color yellow && echo.
echo   1. Replace act,dat and idps files in
echo      data folder with yours. Will not work 
echo      with temp ones currently in folder.
echo.
echo   2. Put Raps in RAPS folder.
echo.
echo   3. Will convert Raps to Rifs and put them
echo      in a Pkg file in PKG folder. Pkg will 
echo      install Rifs in your /exdata folder.
echo.
sfk color green && echo ===========================================
sfk color yellow && echo  ^*Rifs will only work with YOUR act.dat 
echo    and idps in /data folder!
sfk color green && echo ===========================================
echo.
pause >nul
if exist rif.txt del rif.txt
if exist rifs RD /S /Q rifs
if not exist RAPS/*.rap echo.
if not exist RAPS/*.rap echo =======================
sfk color yellow && if not exist RAPS/*.rap echo No Raps in RAPS folder.
sfk color green && if not exist RAPS/*.rap echo =======================
if not exist RAPS/*.rap echo.
if not exist RAPS/*.rap pause
if not exist RAPS/*.rap goto menu2
if not exist data/act.dat echo.
if not exist data/act.dat echo ==========================
sfk color yellow && if not exist data/act.dat echo No act.dat in data folder.
sfk color green && if not exist data/act.dat echo ==========================
if not exist data/act.dat echo.
if not exist data/act.dat pause
if not exist data/act.dat goto menu2
if not exist data/idps echo.
if not exist data/idps echo =======================
sfk color yellow && if not exist data/idps echo No IDPS in data folder.
sfk color green && if not exist data/idps echo =======================
if not exist data/idps echo.
if not exist data/idps pause
if not exist data/idps goto menu2

FC /B data\act.dat .ps3\zrr.dat
if %errorlevel%==0 cls
if %errorlevel%==0 echo.
if %errorlevel%==0 echo =========================
sfk color yellow && if %errorlevel%==0 echo You must replace act.dat
if %errorlevel%==0 echo and idps in \data folder  
if %errorlevel%==0 echo with your PS3 act.dat and
if %errorlevel%==0 echo idps files!
sfk color green && if %errorlevel%==0 echo =========================
if %errorlevel%==0 pause
if %errorlevel%==0 cls
if %errorlevel%==0 goto menu2

FC /B data\idps .ps3\zxx
if %errorlevel%==0 cls
if %errorlevel%==0 echo.
if %errorlevel%==0 echo =========================
sfk color yellow && if %errorlevel%==0 echo You must replace act.dat
if %errorlevel%==0 echo and idps in \data folder  
if %errorlevel%==0 echo with your PS3 act.dat and
if %errorlevel%==0 echo idps files!
sfk color green && if %errorlevel%==0 echo =========================
if %errorlevel%==0 pause
if %errorlevel%==0 cls
if %errorlevel%==0 goto menu2

R2R.exe -s RAPS

SET DIR_SRC=rifs

for /f "delims=|" %%f in ('dir /b %DIR_SRC%') do goto nex

:nex
for /F "tokens=*" %%* in ('dir /b rifs\*.rif') do set rif=%%*
echo %rif%>>rif.txt
for /f "tokens=1 delims=." %%G IN (rif.txt) DO set nrif=%%G

if not exist pkg MD PKG
SET DIR_FIN=PKG

make_package_license -c %nrif% rifs %DIR_FIN%\%nrif%.pkg  
if exist rif.txt del rif.txt
if exist rifs RD /S /Q rifs
color 0a
cls
echo.
echo ============================
sfk color yellow && echo ****************************
sfk color green && echo ============================
sfk color yellow && echo    Pkg is in PKG folder!
sfk color green && echo ============================
sfk color yellow && echo If Pkg was made without your
echo  act.dat and idps. Then it 
echo  will not work on your PS3!
sfk color green && echo =============================					
pause
cls
ENDLOCAL
goto menu2

:c00
cls
set choic=0
echo ==========================
sfk color yellow && echo **************************
sfk color green && echo ==========================
sfk color yellow && echo Would you like c00 Licence
echo Edat in pkg Installer or
echo just Edat file
echo --------------------------
echo   1. c00 Licence Edat Pkg
echo      Installer
echo.
echo   2. Just Edat File
sfk color green && echo ==========================

set /p choic= Select (1-2)
if %choic%==0 goto c00
if %choic%==1 (goto pkge)
if %choic%==2 (goto edatf)
echo Only choose 1 or 2!
pause
cls
goto c00

:pkge
cls
set contid=0
echo ==========================================================================
sfk color yellow && echo =********** Install c00 Edat Licence Pkg on CFW PS3 only ****************=
sfk color green && echo ==========================================================================
echo *                                                                        *
echo *      Example Content-ID :JP9000-NPJA60003_00-0000000000000000          *
echo *                                                                        *
set /p contid= * PASTE "CONTENT-ID" HERE :
echo *                                                                        *
echo ==========================================================================
echo.
if %contid%==0 goto pkge
make_c00_edat "%contid%.edat" %contid% 3
move *.edat Demo_c00_Edat\
echo.
make_package_license -c %contid% Demo_c00_Edat Demo_c00_Edat\%contid%.pkg
del Demo_c00_Edat\"%contid%.edat"

echo ========================================================
sfk color yellow && echo Edat Licence Installer Pkg is in "Demo_c00_Edat" folder
sfk color green && echo ========================================================
pause
cls
goto menu2


:edatf
cls
set contid=0
echo ==========================================================================
sfk color yellow && echo =*************** Put c00 Edat Licence in /exdata folder *****************=
sfk color green && echo ==========================================================================
echo *                                                                        *
echo *      Example Content-ID :JP9000-NPJA60003_00-0000000000000000          *
echo *                                                                        *
set /p contid= * PASTE "CONTENT-ID" HERE :
echo *                                                                        *
echo ==========================================================================
if %contid%==0 goto edatf
make_c00_edat "%contid%.edat" %contid% 3
move *.edat Demo_c00_Edat\
echo.
echo =======================================
sfk color yellow && echo Edat Licence in "Demo_c00_Edat" folder
sfk color green && echo =======================================
pause
cls
goto menu2

:BFEDAT

set DIR_SRC=EDAT_Bruteforce
set DIR_DEST=EDAT_Files
set DIR_ORIG=ORIGINAL_FILES
set DIR_RAP=RAPS

echo.
sfk color yellow && if not exist %DIR_SRC%\*.BIN echo Make sure Games EBOOT.BIN file is in "EDAT_Bruteforce" folder!
echo.
if not exist %DIR_SRC%\*.EDAT echo Make sure Games *.EDAT file is in "EDAT_Bruteforce" folder!
sfk color green && echo.
if not exist %DIR_SRC%\*.BIN goto nbf 
if not exist %DIR_SRC%\*.EDAT  goto nbf
cls

del /F /Q %DIR_DEST%\*.*
xcopy %DIR_SRC%\*.BIN %DIR_ORIG%\ /Y /Q
xcopy %DIR_SRC%\*.EDAT %DIR_ORIG%\ /Y /Q
for /f "delims=|" %%f in ('dir /b %DIR_SRC%') do call make4a.bat "%%~nf"

cls
ENDLOCAL
goto menu2

:nbf
pause
cls
goto menu2



:ABOUT
cls
set tut=0
echo ===============================================================================
sfk color magenta && if not exist zoff echo =////////////    To turn OFF Logo at start of program Press 5    \\\\\\\\\\\\\=
if exist zoff echo =////////////    To turn ON Logo at start of program Press 9    \\\\\\\\\\\\\=
sfk color green && echo ===============================================================================
sfk color yellow && echo =\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\E/S/S/S/E/v4//////////////////////////////////=
sfk color green && echo ===============================================================================
echo =====                                                                     =====
echo =====            THANKS to all for your help making a easier              =====
echo =====           tool to resign files to work with ODE and CFW             =====
echo =====                                                                     =====
echo ===============================================================================
echo =====                                                                     =====
echo =====     Joonie86 - For finding this program and all his help            =====
echo =====   Aldostools - For FixELF, Klics and other tools he made available  =====
echo =====    nickodimm - For adding batch conversion to the pot               =====
echo =====    bigjokker - Created a GUI,SDAT/EDAT Resigning, NPDRM Decrypting  =====
echo =====        Hykem - For his great SDAT/EDAT tool make_npdata.exe         =====
echo ===== Slimshady451 - For make_c00_edat tool                               =====
echo =====        Pink1 - For R2R.exe                                          =====
echo ===== CaptainCPS-X, Aldostools, Rudi Rastelli - For make_package_license  =====
echo =====                                                                     =====
echo ===============================================================================
sfk color yellow && echo ///////   Resigning PSN GAME and PSN UPDATE files need rap to Decrypt   \\\\\\\
sfk color green && echo ===============================================================================
sfk color yellow && echo \\\\\\\\\\ Resigning DISC UPDATE and DEMO NPDRM files need klicense  //////////
sfk color green && echo ===============================================================================
sfk color yellow && echo =++++++++++++++ Resigns all SDK versions to 3.40 don't press 7 +++++++++++++++=
sfk color green && echo ===============================================================================

set "choice="
2>nul >nul choice /c:yn /t 0 /d y
if errorlevel 1 if not errorlevel 2 set "choice=choice /cs"
if not defined choice (
  2>nul >nul choice /c:yn /t:y,1
  if errorlevel 1 if not errorlevel 2 set "choice=choice /s"
)
if not defined choice goto ERROR2
choice /C 1579 /N /M "Press 1 to exit:" 

if errorlevel 4 del zoff
if errorlevel 3 goto menu3
if errorlevel 2 echo Logo OFF>zoff
if errorlevel 1 goto menu2

cls
goto menu2

:ERROR2
set /p tut= Press 1 to exit:
if %tut%==0 goto ABOUT
if %tut%==5 echo Logo OFF>zoff
if %tut%==5 cls
if %tut%==5 goto menu2
if %tut%==1 cls
if %tut%==1 goto menu2
if %tut%==9 del zoff
if %tut%==9 cls
if %tut%==9 goto menu2
if %tut%==7 cls
if %tut%==7 goto menu3
echo Remember Press 1 to exit!
pause
cls
goto ABOUT


:exit
exit






































































































































































































:menu3

@echo off
color 0a
Setlocal

:new
cls
set guess=0
RD /S /Q temp
set /a cardA=%random%%%6+1
:cardb
set /a cardB=%random%%%6+1
IF %cardA%==%cardB% goto cardb
:cardc
set /a cardC=%random%%%6+1
IF %cardA%==%cardC% goto cardc
IF %cardB%==%cardC% goto cardc
:cardd
set /a cardD=%random%%%6+1
IF %cardA%==%cardD% goto cardd
IF %cardB%==%cardD% goto cardd
IF %cardC%==%cardD% goto cardd
:carde
set /a cardE=%random%%%6+1
IF %cardA%==%cardE% goto carde
IF %cardB%==%cardE% goto carde
IF %cardC%==%cardE% goto carde
IF %cardD%==%cardE% goto carde
:cardf
set /a cardF=%random%%%6+1
IF %cardA%==%cardF% goto cardf
IF %cardB%==%cardF% goto cardf
IF %cardC%==%cardF% goto cardf
IF %cardD%==%cardF% goto cardf
IF %cardE%==%cardF% goto cardf

if %cardA%==1 set cardaa=ZEBRA
if %cardA%==2 set cardaa=APPLE
if %cardA%==3 set cardaa=GREEN
if %cardA%==4 set cardaa=PIZZA
if %cardA%==5 set cardaa=SUGAR
if %cardA%==6 set cardaa=STONE

if %cardB%==1 set cardbb=ZEBRA
if %cardB%==2 set cardbb=APPLE
if %cardB%==3 set cardbb=GREEN
if %cardB%==4 set cardbb=PIZZA
if %cardB%==5 set cardbb=SUGAR
if %cardB%==6 set cardbb=STONE

if %cardC%==1 set cardcc=ZEBRA
if %cardC%==2 set cardcc=APPLE
if %cardC%==3 set cardcc=GREEN
if %cardC%==4 set cardcc=PIZZA
if %cardC%==5 set cardcc=SUGAR
if %cardC%==6 set cardcc=STONE

if %cardD%==1 set carddd=ZEBRA
if %cardD%==2 set carddd=APPLE
if %cardD%==3 set carddd=GREEN
if %cardD%==4 set carddd=PIZZA
if %cardD%==5 set carddd=SUGAR
if %cardD%==6 set carddd=STONE

if %cardE%==1 set cardee=ZEBRA
if %cardE%==2 set cardee=APPLE
if %cardE%==3 set cardee=GREEN
if %cardE%==4 set cardee=PIZZA
if %cardE%==5 set cardee=SUGAR
if %cardE%==6 set cardee=STONE

if %cardF%==1 set cardff=ZEBRA
if %cardF%==2 set cardff=APPLE
if %cardF%==3 set cardff=GREEN
if %cardF%==4 set cardff=PIZZA
if %cardF%==5 set cardff=SUGAR
if %cardF%==6 set cardff=STONE

set /a p1=%random%%%12+1
:p2
set /a p2=%random%%%12+1
if %p1%==%p2% goto p2 
:p3
set /a p3=%random%%%12+1
if %p1%==%p3% goto p3
if %p2%==%p3% goto p3
:p4
set /a p4=%random%%%12+1
if %p1%==%p4% goto p4
if %p2%==%p4% goto p4
if %p3%==%p4% goto p4
:p5
set /a p5=%random%%%12+1
if %p1%==%p5% goto p5
if %p2%==%p5% goto p5
if %p3%==%p5% goto p5
if %p4%==%p5% goto p5
:p6
set /a p6=%random%%%12+1
if %p1%==%p6% goto p6
if %p2%==%p6% goto p6
if %p3%==%p6% goto p6
if %p4%==%p6% goto p6
if %p5%==%p6% goto p6
:p7
set /a p7=%random%%%12+1
if %p1%==%p7% goto p7
if %p2%==%p7% goto p7
if %p3%==%p7% goto p7
if %p4%==%p7% goto p7
if %p5%==%p7% goto p7
if %p6%==%p7% goto p7
:p8
set /a p8=%random%%%12+1
if %p1%==%p8% goto p8
if %p2%==%p8% goto p8
if %p3%==%p8% goto p8
if %p4%==%p8% goto p8
if %p5%==%p8% goto p8
if %p6%==%p8% goto p8
if %p7%==%p8% goto p8
:p9
set /a p9=%random%%%12+1
if %p1%==%p9% goto p9
if %p2%==%p9% goto p9
if %p3%==%p9% goto p9
if %p4%==%p9% goto p9
if %p5%==%p9% goto p9
if %p6%==%p9% goto p9
if %p7%==%p9% goto p9
if %p8%==%p9% goto p9
:p10
set /a p10=%random%%%12+1
if %p1%==%p10% goto p10
if %p2%==%p10% goto p10
if %p3%==%p10% goto p10
if %p4%==%p10% goto p10
if %p5%==%p10% goto p10
if %p6%==%p10% goto p10
if %p7%==%p10% goto p10
if %p8%==%p10% goto p10
if %p9%==%p10% goto p10
:p11
set /a p11=%random%%%12+1
if %p1%==%p11% goto p11
if %p2%==%p11% goto p11
if %p3%==%p11% goto p11
if %p4%==%p11% goto p11
if %p5%==%p11% goto p11
if %p6%==%p11% goto p11
if %p7%==%p11% goto p11
if %p8%==%p11% goto p11
if %p9%==%p11% goto p11
if %p10%==%p11% goto p11
:p12
set /a p12=%random%%%12+1
if %p1%==%p12% goto p12
if %p2%==%p12% goto p12
if %p3%==%p12% goto p12
if %p4%==%p12% goto p12
if %p5%==%p12% goto p12
if %p6%==%p12% goto p12
if %p7%==%p12% goto p12
if %p8%==%p12% goto p12
if %p9%==%p12% goto p12
if %p10%==%p12% goto p12
if %p11%==%p12% goto p12

if %p1%==1 set ca=%cardaa%
if %p1%==2 set cb=%cardaa%
if %p1%==3 set cc=%cardaa%
if %p1%==4 set cd=%cardaa%
if %p1%==5 set ce=%cardaa%
if %p1%==6 set cf=%cardaa%
if %p1%==7 set cg=%cardaa%
if %p1%==8 set ch=%cardaa%
if %p1%==9 set ci=%cardaa%
if %p1%==10 set cj=%cardaa%
if %p1%==11 set ck=%cardaa%
if %p1%==12 set cl=%cardaa%

if %p2%==1 set ca=%cardaa%
if %p2%==2 set cb=%cardaa%
if %p2%==3 set cc=%cardaa%
if %p2%==4 set cd=%cardaa%
if %p2%==5 set ce=%cardaa%
if %p2%==6 set cf=%cardaa%
if %p2%==7 set cg=%cardaa%
if %p2%==8 set ch=%cardaa%
if %p2%==9 set ci=%cardaa%
if %p2%==10 set cj=%cardaa%
if %p2%==11 set ck=%cardaa%
if %p2%==12 set cl=%cardaa%

if %p3%==1 set ca=%cardbb%
if %p3%==2 set cb=%cardbb%
if %p3%==3 set cc=%cardbb%
if %p3%==4 set cd=%cardbb%
if %p3%==5 set ce=%cardbb%
if %p3%==6 set cf=%cardbb%
if %p3%==7 set cg=%cardbb%
if %p3%==8 set ch=%cardbb%
if %p3%==9 set ci=%cardbb%
if %p3%==10 set cj=%cardbb%
if %p3%==11 set ck=%cardbb%
if %p3%==12 set cl=%cardbb%

if %p4%==1 set ca=%cardbb%
if %p4%==2 set cb=%cardbb%
if %p4%==3 set cc=%cardbb%
if %p4%==4 set cd=%cardbb%
if %p4%==5 set ce=%cardbb%
if %p4%==6 set cf=%cardbb%
if %p4%==7 set cg=%cardbb%
if %p4%==8 set ch=%cardbb%
if %p4%==9 set ci=%cardbb%
if %p4%==10 set cj=%cardbb%
if %p4%==11 set ck=%cardbb%
if %p4%==12 set cl=%cardbb%

if %p5%==1 set ca=%cardcc%
if %p5%==2 set cb=%cardcc%
if %p5%==3 set cc=%cardcc%
if %p5%==4 set cd=%cardcc%
if %p5%==5 set ce=%cardcc%
if %p5%==6 set cf=%cardcc%
if %p5%==7 set cg=%cardcc%
if %p5%==8 set ch=%cardcc%
if %p5%==9 set ci=%cardcc%
if %p5%==10 set cj=%cardcc%
if %p5%==11 set ck=%cardcc%
if %p5%==12 set cl=%cardcc%

if %p6%==1 set ca=%cardcc%
if %p6%==2 set cb=%cardcc%
if %p6%==3 set cc=%cardcc%
if %p6%==4 set cd=%cardcc%
if %p6%==5 set ce=%cardcc%
if %p6%==6 set cf=%cardcc%
if %p6%==7 set cg=%cardcc%
if %p6%==8 set ch=%cardcc%
if %p6%==9 set ci=%cardcc%
if %p6%==10 set cj=%cardcc%
if %p6%==11 set ck=%cardcc%
if %p6%==12 set cl=%cardcc%

if %p7%==1 set ca=%carddd%
if %p7%==2 set cb=%carddd%
if %p7%==3 set cc=%carddd%
if %p7%==4 set cd=%carddd%
if %p7%==5 set ce=%carddd%
if %p7%==6 set cf=%carddd%
if %p7%==7 set cg=%carddd%
if %p7%==8 set ch=%carddd%
if %p7%==9 set ci=%carddd%
if %p7%==10 set cj=%carddd%
if %p7%==11 set ck=%carddd%
if %p7%==12 set cl=%carddd%

if %p8%==1 set ca=%carddd%
if %p8%==2 set cb=%carddd%
if %p8%==3 set cc=%carddd%
if %p8%==4 set cd=%carddd%
if %p8%==5 set ce=%carddd%
if %p8%==6 set cf=%carddd%
if %p8%==7 set cg=%carddd%
if %p8%==8 set ch=%carddd%
if %p8%==9 set ci=%carddd%
if %p8%==10 set cj=%carddd%
if %p8%==11 set ck=%carddd%
if %p8%==12 set cl=%carddd%

if %p9%==1 set ca=%cardee%
if %p9%==2 set cb=%cardee%
if %p9%==3 set cc=%cardee%
if %p9%==4 set cd=%cardee%
if %p9%==5 set ce=%cardee%
if %p9%==6 set cf=%cardee%
if %p9%==7 set cg=%cardee%
if %p9%==8 set ch=%cardee%
if %p9%==9 set ci=%cardee%
if %p9%==10 set cj=%cardee%
if %p9%==11 set ck=%cardee%
if %p9%==12 set cl=%cardee%

if %p10%==1 set ca=%cardee%
if %p10%==2 set cb=%cardee%
if %p10%==3 set cc=%cardee%
if %p10%==4 set cd=%cardee%
if %p10%==5 set ce=%cardee%
if %p10%==6 set cf=%cardee%
if %p10%==7 set cg=%cardee%
if %p10%==8 set ch=%cardee%
if %p10%==9 set ci=%cardee%
if %p10%==10 set cj=%cardee%
if %p10%==11 set ck=%cardee%
if %p10%==12 set cl=%cardee%

if %p11%==1 set ca=%cardff%
if %p11%==2 set cb=%cardff%
if %p11%==3 set cc=%cardff%
if %p11%==4 set cd=%cardff%
if %p11%==5 set ce=%cardff%
if %p11%==6 set cf=%cardff%
if %p11%==7 set cg=%cardff%
if %p11%==8 set ch=%cardff%
if %p11%==9 set ci=%cardff%
if %p11%==10 set cj=%cardff%
if %p11%==11 set ck=%cardff%
if %p11%==12 set cl=%cardff%

if %p12%==1 set ca=%cardff%
if %p12%==2 set cb=%cardff%
if %p12%==3 set cc=%cardff%
if %p12%==4 set cd=%cardff%
if %p12%==5 set ce=%cardff%
if %p12%==6 set cf=%cardff%
if %p12%==7 set cg=%cardff%
if %p12%==8 set ch=%cardff%
if %p12%==9 set ci=%cardff%
if %p12%==10 set cj=%cardff%
if %p12%==11 set ck=%cardff%
if %p12%==12 set cl=%cardff%
MD temp

set cca=CARDS
set ccb=CARDS
set ccc=CARDS
set ccd=CARDS
set cce=CARDS
set ccf=CARDS
set ccg=CARDS
set cch=CARDS
set cci=CARDS
set ccj=CARDS
set cck=CARDS
set ccl=CARDS

:cho
 
	
cls
echo                    MEMORY CARD GAME!
echo                                                         (PRESS "Q" to Quit)
echo    Pick a Card Letter to flip it and Match two Cards!
echo.
echo    ........      ........      ........      ........ 
echo   :        :    :        :    :        :    :        :
echo   :        :    :        :    :        :    :        :
sfk color yellow &&echo     %cca%         %ccb%         %ccc%         %ccd%   
sfk color green &&echo   :        :    :        :    :        :    :        :
echo   :        :    :        :    :        :    :        :
echo    ........ A    ........ B    ........ C    ........ D 
echo.                                            
echo    ........      ........      ........      ........ 
echo   :        :    :        :    :        :    :        :
echo   :        :    :        :    :        :    :        :
sfk color yellow &&echo     %cce%         %ccf%         %ccg%         %cch%    
sfk color green &&echo   :        :    :        :    :        :    :        :
echo   :        :    :        :    :        :    :        :
echo    ........ E    ........ F    ........ G    ........ H 
echo.                                            
echo    ........      ........      ........      ........ 
echo   :        :    :        :    :        :    :        :
echo   :        :    :        :    :        :    :        :
sfk color yellow &&echo     %cci%         %ccj%         %cck%         %ccl%   
sfk color green &&echo   :        :    :        :    :        :    :        :
echo   :        :    :        :    :        :    :        :
echo    ........ I    ........ J    ........ K    ........ L 
echo                              ^[Wrong Guess ^= %guess% ^]




if exist temp\pt FIND /i "ZEBRA APPLE GREEN SUGAR PIZZA STONE"  temp\*.txt >temp\fd.txt
if exist temp\pt goto che
:ghk




if exist temp\po echo picktwo>temp\pt
::if exist temp\po goto chos
echo pickone>temp\po


:choose2

CHOICE /c:abcdefghijklq /n /m "Pick a Card (A-L):"

if errorlevel 13 RD /S /Q temp
if errorlevel 13 goto menu2
if errorlevel 12 goto 12
if errorlevel 11 goto 11
if errorlevel 10 goto 10
if errorlevel 9 goto 9
if errorlevel 8 goto 8
if errorlevel 7 goto 7
if errorlevel 6 goto 6
if errorlevel 5 goto 5
if errorlevel 4 goto 4
if errorlevel 3 goto 3
if errorlevel 2 goto 2
if errorlevel 1 goto 1
:12

if exist temp\cl.txt goto choose
echo %cl%>temp\cl.txt
FOR /F %%G IN (temp\cl.txt) DO set ccl=%%G

goto cho


:11

if exist temp\ck.txt goto choose
echo %ck%>temp\ck.txt
FOR /F %%H IN (temp\ck.txt) DO set cck=%%H

goto cho

:10

if exist temp\cj.txt goto choose
echo %cj%>temp\cj.txt
FOR /F %%I IN (temp\cj.txt) DO set ccj=%%I

goto cho

:9

if exist temp\ci.txt goto choose
echo %ci%>temp\ci.txt
FOR /F %%J IN (temp\ci.txt) DO set cci=%%J

goto cho

:8

if exist temp\ch.txt goto choose
echo %ch%>temp\ch.txt
FOR /F %%K IN (temp\ch.txt) DO set cch=%%K

goto cho

:7

if exist temp\cg.txt goto choose
echo %cg%>temp\cg.txt
FOR /F %%L IN (temp\cg.txt) DO set ccg=%%L

goto cho

:6

if exist temp\cf.txt goto choose
echo %cf%>temp\cf.txt
FOR /F %%M IN (temp\cf.txt) DO set ccf=%%M

goto cho

:5

if exist temp\ce.txt goto choose
echo %ce%>temp\ce.txt
FOR /F %%N IN (temp\ce.txt) DO set cce=%%N

goto cho

:4

if exist temp\cd.txt goto choose
echo %cd%>temp\cd.txt
FOR /F %%O IN (temp\cd.txt) DO set ccd=%%O

goto cho

:3

if exist temp\cc.txt goto choose
echo %cc%>temp\cc.txt
FOR /F %%P IN (temp\cc.txt) DO set ccc=%%P

goto cho

:2

if exist temp\cb.txt goto choose
echo %cb%>temp\cb.txt
FOR /F %%Q IN (temp\cb.txt) DO set ccb=%%Q

goto cho

:1

if exist temp\ca.txt goto choose
echo %ca%>temp\ca.txt
FOR /F %%R IN (temp\ca.txt) DO set cca=%%R

goto cho



:chos2

set /a "guess=%guess%+1"

if %kl%==%ca% set cca=CARDS
if %kl%==%cb% set ccb=CARDS
if %kl%==%cc% set ccc=CARDS
if %kl%==%cd% set ccd=CARDS
if %kl%==%ce% set cce=CARDS
if %kl%==%cf% set ccf=CARDS
if %kl%==%cg% set ccg=CARDS
if %kl%==%ch% set cch=CARDS
if %kl%==%ci% set cci=CARDS
if %kl%==%cj% set ccj=CARDS
if %kl%==%ck% set cck=CARDS
if %kl%==%cl% set ccl=CARDS

if %kp%==%ca% set cca=CARDS
if %kp%==%cb% set ccb=CARDS
if %kp%==%cc% set ccc=CARDS
if %kp%==%cd% set ccd=CARDS
if %kp%==%ce% set cce=CARDS
if %kp%==%cf% set ccf=CARDS
if %kp%==%cg% set ccg=CARDS
if %kp%==%ch% set cch=CARDS
if %kp%==%ci% set cci=CARDS
if %kp%==%cj% set ccj=CARDS
if %kp%==%ck% set cck=CARDS
if %kp%==%cl% set ccl=CARDS


:pass

del /Q temp\po
del /Q temp\pt
del /Q temp\ca.txt
del /Q temp\cb.txt
del /Q temp\cc.txt
del /Q temp\cd.txt
del /Q temp\ce.txt
del /Q temp\cf.txt
del /Q temp\cg.txt
del /Q temp\ch.txt
del /Q temp\ci.txt
del /Q temp\cj.txt
del /Q temp\ck.txt
del /Q temp\cl.txt
del /Q temp\fd.txt

goto cho
 





:che
if not exist temp\ca.txt goto n1
FIND "TEMP\CA.TXT" temp\fd.txt
if %errorlevel%==0 set kl=%ca%
if %errorlevel%==0 del temp\ca.txt
if %errorlevel%==0 goto yyu
:n1
if not exist temp\cb.txt goto n2
FIND "TEMP\CB.TXT" temp\fd.txt
if %errorlevel%==0 set kl=%cb%
if %errorlevel%==0 del temp\cb.txt
if %errorlevel%==0 goto yyu
:n2
if not exist temp\cc.txt goto n3
FIND "TEMP\CC.TXT" temp\fd.txt
if %errorlevel%==0 set kl=%cc%
if %errorlevel%==0 del temp\cc.txt
if %errorlevel%==0 goto yyu
:n3
if not exist temp\cd.txt goto n4
FIND "TEMP\CD.TXT" temp\fd.txt
if %errorlevel%==0 set kl=%cd%
if %errorlevel%==0 del temp\cd.txt
if %errorlevel%==0 goto yyu
:n4
if not exist temp\ce.txt goto n5
FIND "TEMP\CE.TXT" temp\fd.txt
if %errorlevel%==0 set kl=%ce% 
if %errorlevel%==0 del temp\ce.txt
if %errorlevel%==0 goto yyu
:n5
if not exist temp\cf.txt goto n6
FIND "TEMP\CF.TXT" temp\fd.txt
if %errorlevel%==0 set kl=%cf%
if %errorlevel%==0 del temp\cf.txt
if %errorlevel%==0 goto yyu
:n6
if not exist temp\cg.txt goto n7
FIND "TEMP\CG.TXT" temp\fd.txt
if %errorlevel%==0 set kl=%cg%
if %errorlevel%==0 del temp\cg.txt
if %errorlevel%==0 goto yyu
:n7
if not exist temp\ch.txt goto n8
FIND "TEMP\CH.TXT" temp\fd.txt
if %errorlevel%==0 set kl=%ch%
if %errorlevel%==0 del temp\ch.txt
if %errorlevel%==0 goto yyu
:n8
if not exist temp\ci.txt goto n9
FIND "TEMP\CI.TXT" temp\fd.txt
if %errorlevel%==0 set kl=%ci%
if %errorlevel%==0 del temp\ci.txt
if %errorlevel%==0 goto yyu
:n9
if not exist temp\cj.txt goto n10
FIND "TEMP\CJ.TXT" temp\fd.txt
if %errorlevel%==0 set kl=%cj%
if %errorlevel%==0 del temp\cj.txt
if %errorlevel%==0 goto yyu
:n10
if not exist temp\ck.txt goto n11
FIND "TEMP\CK.TXT" temp\fd.txt
if %errorlevel%==0 set kl=%ck%
if %errorlevel%==0 del temp\ck.txt
if %errorlevel%==0 goto yyu
:n11
FIND "TEMP\CL.TXT" temp\fd.txt
if %errorlevel%==0 set kl=%cl%
if %errorlevel%==0 del temp\cl.txt
:yyu
DEL /Q temp\fb.txt
FIND /i "ZEBRA APPLE GREEN SUGAR PIZZA STONE"  temp\*.txt >temp\fd.txt
if not exist temp\ca.txt goto m1
FIND "TEMP\CA.TXT" temp\fd.txt
if %errorlevel%==0 set kp=%ca%
if %errorlevel%==0 goto ghk2
:m1
if not exist temp\cb.txt goto m2
FIND "TEMP\CB.TXT" temp\fd.txt
if %errorlevel%==0 set kp=%cb%
if %errorlevel%==0 goto ghk2
:m2
if not exist temp\cc.txt goto m3
FIND "TEMP\CC.TXT" temp\fd.txt
if %errorlevel%==0 set kp=%cc% 
 if %errorlevel%==0 goto ghk2
:m3
 if not exist temp\cd.txt goto m4
FIND "TEMP\CD.TXT" temp\fd.txt
if %errorlevel%==0 set kp=%cd%
if %errorlevel%==0 goto ghk2
:m4
if not exist temp\ce.txt goto m5
FIND "TEMP\CE.TXT" temp\fd.txt
if %errorlevel%==0 set kp=%ce%
if %errorlevel%==0 goto ghk2
:m5
if not exist temp\cf.txt goto m6
FIND "TEMP\CF.TXT" temp\fd.txt
if %errorlevel%==0 set kp=%cf% 
if %errorlevel%==0 goto ghk2
:m6
if not exist temp\cg.txt goto m7
FIND "TEMP\CG.TXT" temp\fd.txt
if %errorlevel%==0 set kp=%cg%
if %errorlevel%==0 goto ghk2
:m7
if not exist temp\ch.txt goto m8
FIND "TEMP\CH.TXT" temp\fd.txt
if %errorlevel%==0 set kp=%ch%
if %errorlevel%==0 goto ghk2
:m8
if not exist temp\ci.txt goto m9
FIND "TEMP\CI.TXT" temp\fd.txt
if %errorlevel%==0 set kp=%ci%
if %errorlevel%==0 goto ghk2
:m9
if not exist temp\cj.txt goto m10
FIND "TEMP\CJ.TXT" temp\fd.txt
if %errorlevel%==0 set kp=%cj%
if %errorlevel%==0 goto ghk2
:m10
if not exist temp\ck.txt goto m11
FIND "TEMP\CK.TXT" temp\fd.txt
if %errorlevel%==0 set kp=%ck%
if %errorlevel%==0 goto ghk2
:m11
FIND "TEMP\CL.TXT" temp\fd.txt
if %errorlevel%==0 set kp=%cl%
:ghk2
cls
echo                    MEMORY CARD GAME!              
echo                                                         (PRESS "Q" to Quit)
echo    Pick a Card Letter to flip it and Match two Cards!
echo.
echo    ........      ........      ........      ........ 
echo   :        :    :        :    :        :    :        :
echo   :        :    :        :    :        :    :        :
sfk color yellow &&echo     %cca%         %ccb%         %ccc%         %ccd%   
sfk color green &&echo   :        :    :        :    :        :    :        :
echo   :        :    :        :    :        :    :        :
echo    ........ A    ........ B    ........ C    ........ D 
echo.                                            
echo    ........      ........      ........      ........ 
echo   :        :    :        :    :        :    :        :
echo   :        :    :        :    :        :    :        :
sfk color yellow &&echo     %cce%         %ccf%         %ccg%         %cch%    
sfk color green &&echo   :        :    :        :    :        :    :        :
echo   :        :    :        :    :        :    :        :
echo    ........ E    ........ F    ........ G    ........ H 
echo.                                            
echo    ........      ........      ........      ........ 
echo   :        :    :        :    :        :    :        :
echo   :        :    :        :    :        :    :        :
sfk color yellow &&echo     %cci%         %ccj%         %cck%         %ccl%   
sfk color green &&echo   :        :    :        :    :        :    :        :
echo   :        :    :        :    :        :    :        :
echo    ........ I    ........ J    ........ K    ........ L 
echo                              ^[Wrong Guess ^= %guess% ^]
if not %kl%==%kp% ping 127.0.0.1 -n 5 > nul
if not %kl%==%kp% goto chos2
set /a "won=%won%+1"
if %won%==6 goto winner
del /Q temp\po
del /Q temp\pt
del /Q temp\ca.txt
del /Q temp\cb.txt
del /Q temp\cc.txt
del /Q temp\cd.txt
del /Q temp\ce.txt
del /Q temp\cf.txt
del /Q temp\cg.txt
del /Q temp\ch.txt
del /Q temp\ci.txt
del /Q temp\cj.txt
del /Q temp\ck.txt
del /Q temp\cl.txt
del /Q temp\fd.txt

goto cho


:winner
set won=0
sfk color yellow &&echo *******************************************************************************
  sfk color green &&echo *******************************************************************************
sfk color magenta &&echo *******************************************************************************
 sfk color yellow &&echo *******************************************************************************
  sfk color green &&echo *******************************************************************************
sfk color magenta &&echo *******************************************************************************
sfk color yellow &&echo *******************************************************************************
  sfk color green &&echo *******************************************************************************
sfk color magenta &&echo *******************************************************************************
 sfk color yellow &&echo *******************************************************************************
  sfk color green &&echo *******************************************************************************
sfk color magenta &&echo *******************************************************************************
sfk color yellow &&echo *******************************************************************************
  sfk color green &&echo *******************************************************************************
sfk color magenta &&echo *******************************************************************************
 sfk color yellow &&echo *******************************************************************************
  sfk color green &&echo *******************************************************************************
sfk color magenta &&echo *******************************************************************************
sfk color yellow &&echo *******************************************************************************
  sfk color green &&echo *******************************************************************************
sfk color magenta &&echo *******************************************************************************
 sfk color yellow &&echo *******************************************************************************
  sfk color green &&echo *******************************************************************************
sfk color magenta &&echo *******************************************************************************
 sfk color yellow &&echo *******************************************************************************
  sfk color green &&echo *******************************************************************************
sfk color magenta &&echo *******************************************************************************
 sfk color yellow &&echo *******************************************************************************
  sfk color green &&echo *******************************************************************************
sfk color magenta &&echo *******************************************************************************
  sfk color green &&echo.
                    echo           Congradulations you Won with only %guess% Wrong Guesses!
                    echo.
                    echo                     Try to do it with less guesses!
echo.
 sfk color yellow &&echo *******************************************************************************
  sfk color green &&echo *******************************************************************************
sfk color magenta &&echo *******************************************************************************
 sfk color yellow &&echo *******************************************************************************
  sfk color green &&echo *******************************************************************************
sfk color magenta &&echo *******************************************************************************
sfk color green &&echo *******************************************************************************
set /p tux= Enter 1 to exit or 2 to replay:
if %tux%==1 goto menu2
cls
RD /S /Q temp
goto new

:choose

cls
echo                    MEMORY CARD GAME!
echo                                                         (PRESS "Q" to Quit)
echo    Pick a Card Letter to flip it and Match two Cards!
echo.
echo    ........      ........      ........      ........ 
echo   :        :    :        :    :        :    :        :
echo   :        :    :        :    :        :    :        :
sfk color yellow &&echo     %cca%         %ccb%         %ccc%         %ccd%   
sfk color green &&echo   :        :    :        :    :        :    :        :
echo   :        :    :        :    :        :    :        :
echo    ........ A    ........ B    ........ C    ........ D 
echo.                                            
echo    ........      ........      ........      ........ 
echo   :        :    :        :    :        :    :        :
echo   :        :    :        :    :        :    :        :
sfk color yellow &&echo     %cce%         %ccf%         %ccg%         %cch%    
sfk color green &&echo   :        :    :        :    :        :    :        :
echo   :        :    :        :    :        :    :        :
echo    ........ E    ........ F    ........ G    ........ H 
echo.                                            
echo    ........      ........      ........      ........ 
echo   :        :    :        :    :        :    :        :
echo   :        :    :        :    :        :    :        :
sfk color yellow &&echo     %cci%         %ccj%         %cck%         %ccl%   
sfk color green &&echo   :        :    :        :    :        :    :        :
echo   :        :    :        :    :        :    :        :
echo    ........ I    ........ J    ........ K    ........ L 
echo                              ^[Wrong Guess ^= %guess% ^]
goto choose2














