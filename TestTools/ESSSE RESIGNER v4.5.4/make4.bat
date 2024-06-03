SETLOCAL ENABLEDELAYEDEXPANSION

move %DIR_SRC%\%1.edat %DIR_DEST%\

for /F "tokens=*" %%* in ('dir /b %DIR_DEST%\*.edat') do set edat=%%*

set eedat=%1.dat
set dat=%1.dat
set dat
set dat=%dat:"=%
set dat

make_npdata -v -d %DIR_DEST%/%edat% %DIR_DEST%/%dat% 8 00000000000000000000000000000000 >edatinfo.txt
find /I "NPD version:" edatinfo.txt >ver.txt
for /f "skip=2 tokens=3" %%i in (ver.txt) do set ver=%%i
find /I "NPD license:" edatinfo.txt >lice.txt
for /f "skip=2 tokens=3" %%k in (lice.txt) do set lice=%%k
find /I "NPD type:" edatinfo.txt >typ.txt
for /f "skip=2 tokens=3" %%m in (typ.txt) do set typ=%%m
if %typ%==0 set tp=00
if %typ%==1 set tp=01
if %typ%==20 set tp=00
if %typ%==21 set tp=01
find /I "NPD content" edatinfo.txt >cont.txt
for /f "skip=2 tokens=4" %%p in (cont.txt) do set cont=%%p
echo %cont% >content.txt
for /f %%q in (content.txt) do set content=%%q
find /I "EDAT flags:" edatinfo.txt >edtflg.txt
for /f "skip=2 tokens=3" %%r in (edtflg.txt) do set edtflg=%%r
set flg=0
if "%edtflg%"=="0x0000003C" set flg=0
if "%edtflg%"=="0x0000000D" set flg=1
if "%lice%"=="1" set lice=01 - Network License -Online Only!
if "%lice%"=="2" set lice=02 - Local License
if "%lice%"=="3" set lice=03 - Free License
if exist "%DIR_RAP%"/"%content%.rap" make_npdata -v -d %DIR_DEST%/%edat% %DIR_DEST%/%dat% 8 00000000000000000000000000000000 "%DIR_RAP%"/"%content%.rap" >edatinfo2.txt
if not exist "%DIR_RAP%"/"%content%.rap" make_npdata -v -d %DIR_DEST%/%edat% %DIR_DEST%/%dat% 8 00000000000000000000000000000000 >edatinfo2.txt
find /I "DECRYPTION KEY:" edatinfo2.txt >deckey.txt
find /I "DEVKLIC:" edatinfo2.txt >devkey.txt
SET deckey=NONE
SET devkey=NONE
for /f "skip=2 tokens=3" %%s in (deckey.txt) do set deckey=%%s
for /f "skip=2 tokens=2" %%t in (devkey.txt) do set devkey=%%t

cls
echo ==========================================================================
sfk color yellow && echo //////////////////////////////// E/D/A/T \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
sfk color green && echo ==========================================================================
echo =                                                                        =
echo =          Will Resign *.EDAT to FREE TYPE klicense used as Key.         =
echo =                                                                        =
echo =    Some EDATS NEED rap file to decrypt Be sure rap is in RAPS folder.  =
echo =                                                                        =
echo =      "klicense" can also be found by Brute-forcing Edat and Eboot!     =
echo ==========================================================================
echo =                                                                        =
echo =    [File Name = %edat% ]
echo =                                                                        =
echo =    [NPD version: 0%ver%]   [NPD license: %lice%]
echo =                                                                        =
echo =    [NPD type: %typ%]
echo =                                                                        =
echo =    [Content-ID = %content%

for /f "tokens=2 delims=-,_" %%r in (content.txt) do set titid=%%r
find /I "%titid%" klicense.txt >results.txt
echo =                                                                        =
SET devklic=NONE
SET devklic2=NONE
SET devklic3=NONE
SET devklic4=NONE
SET devklic5=NONE
SET devklic6=NONE
SET devklic7=NONE
SET devklic8=NONE
SET devklic9=NONE
SET devklica=NONE
SET devklicb=NONE
SET devklicc=NONE
SET devklicd=NONE
SET devklice=NONE
SET devklicf=NONE
SET devklicg=NONE
SET devklich=NONE
SET devklici=NONE
SET "data="
FOR /f %%a IN (results.txt) DO SET "data=!data! %%a
SET "data=%data:~1%"
echo %data% >K2.txt
FOR /f "tokens=2" %%b IN (K2.txt) DO SET devklic=%%b
FOR /f "tokens=3" %%c IN (K2.txt) DO SET devklic2=%%c
FOR /f "tokens=4" %%d IN (K2.txt) DO SET devklic3=%%d
FOR /f "tokens=5" %%e IN (K2.txt) DO SET devklic4=%%e
FOR /f "tokens=6" %%f IN (K2.txt) DO SET devklic5=%%f
FOR /f "tokens=7" %%g IN (K2.txt) DO SET devklic6=%%g
FOR /f "tokens=8" %%h IN (K2.txt) DO SET devklic7=%%h
FOR /f "tokens=9" %%i IN (K2.txt) DO SET devklic8=%%i
FOR /f "tokens=10" %%j IN (K2.txt) DO SET devklic9=%%j
FOR /f "tokens=11" %%k IN (K2.txt) DO SET devklica=%%k
FOR /f "tokens=12" %%l IN (K2.txt) DO SET devklicb=%%l
FOR /f "tokens=13" %%m IN (K2.txt) DO SET devklicc=%%m
FOR /f "tokens=14" %%n IN (K2.txt) DO SET devklicd=%%n
FOR /f "tokens=15" %%o IN (K2.txt) DO SET devklice=%%o
FOR /f "tokens=16" %%p IN (K2.txt) DO SET devklicf=%%p
FOR /f "tokens=17" %%q IN (K2.txt) DO SET devklicg=%%q
FOR /f "tokens=18" %%r IN (K2.txt) DO SET devklich=%%r
FOR /f "tokens=19" %%s IN (K2.txt) DO SET devklici=%%s
if %devklic2%==%devklic% set devklic2=NONE
if %devklic3%==%devklic% set devklic3=NONE
if %devklic4%==%devklic% set devklic4=NONE
if %devklic5%==%devklic% set devklic5=NONE
if %devklic6%==%devklic% set devklic6=NONE
if %devklic7%==%devklic% set devklic7=NONE
if %devklic8%==%devklic% set devklic8=NONE
if %devklic9%==%devklic% set devklic9=NONE
if %devklica%==%devklic% set devklica=NONE
if %devklicb%==%devklic% set devklicb=NONE
if %devklicc%==%devklic% set devklicc=NONE
if %devklicd%==%devklic% set devklicd=NONE
if %devklice%==%devklic% set devklice=NONE
if %devklicf%==%devklic% set devklicf=NONE
if %devklicg%==%devklic% set devklicg=NONE
if %devklich%==%devklic% set devklich=NONE
if %devklici%==%devklic% set devklici=NONE
if %devklic3%==%devklic2% set devklic3=NONE
if %devklic4%==%devklic2% set devklic4=NONE
if %devklic5%==%devklic2% set devklic5=NONE
if %devklic6%==%devklic2% set devklic6=NONE
if %devklic7%==%devklic2% set devklic7=NONE
if %devklic8%==%devklic2% set devklic8=NONE
if %devklic9%==%devklic2% set devklic9=NONE
if %devklica%==%devklic2% set devklica=NONE
if %devklicb%==%devklic2% set devklicb=NONE
if %devklicc%==%devklic2% set devklicc=NONE
if %devklicd%==%devklic2% set devklicd=NONE
if %devklice%==%devklic2% set devklice=NONE
if %devklicf%==%devklic2% set devklicf=NONE
if %devklicg%==%devklic2% set devklicg=NONE
if %devklich%==%devklic2% set devklich=NONE
if %devklici%==%devklic2% set devklici=NONE
if %devklic4%==%devklic3% set devklic4=NONE
if %devklic5%==%devklic3% set devklic5=NONE
if %devklic6%==%devklic3% set devklic6=NONE
if %devklic7%==%devklic3% set devklic7=NONE
if %devklic8%==%devklic3% set devklic8=NONE
if %devklic9%==%devklic3% set devklic9=NONE
if %devklica%==%devklic3% set devklica=NONE
if %devklicb%==%devklic3% set devklicb=NONE
if %devklicc%==%devklic3% set devklicc=NONE
if %devklicd%==%devklic3% set devklicd=NONE
if %devklice%==%devklic3% set devklice=NONE
if %devklicf%==%devklic3% set devklicf=NONE
if %devklicg%==%devklic3% set devklicg=NONE
if %devklich%==%devklic3% set devklich=NONE
if %devklici%==%devklic3% set devklici=NONE
if %devklica%==%devklic4% set devklica=NONE
if %devklicb%==%devklic4% set devklicb=NONE
if %devklicc%==%devklic4% set devklicc=NONE
if %devklicd%==%devklic4% set devklicd=NONE
if %devklice%==%devklic4% set devklice=NONE
if %devklicf%==%devklic4% set devklicf=NONE
if %devklicg%==%devklic4% set devklicg=NONE
if %devklich%==%devklic4% set devklich=NONE
if %devklici%==%devklic4% set devklici=NONE
if %devklic5%==%devklic4% set devklic5=NONE
if %devklic6%==%devklic4% set devklic6=NONE
if %devklic7%==%devklic4% set devklic7=NONE
if %devklic8%==%devklic4% set devklic8=NONE
if %devklic9%==%devklic4% set devklic9=NONE
if %devklica%==%devklic4% set devklica=NONE
if %devklicb%==%devklic4% set devklicb=NONE
if %devklicc%==%devklic4% set devklicc=NONE
if %devklicd%==%devklic4% set devklicd=NONE
if %devklice%==%devklic4% set devklice=NONE
if %devklicf%==%devklic4% set devklicf=NONE
if %devklicg%==%devklic4% set devklicg=NONE
if %devklich%==%devklic4% set devklich=NONE
if %devklici%==%devklic4% set devklici=NONE
if %devklic6%==%devklic5% set devklic6=NONE
if %devklic7%==%devklic5% set devklic7=NONE
if %devklic8%==%devklic5% set devklic8=NONE
if %devklic9%==%devklic5% set devklic9=NONE
if %devklica%==%devklic5% set devklica=NONE
if %devklicb%==%devklic5% set devklicb=NONE
if %devklicc%==%devklic5% set devklicc=NONE
if %devklicd%==%devklic5% set devklicd=NONE
if %devklice%==%devklic5% set devklice=NONE
if %devklicf%==%devklic5% set devklicf=NONE
if %devklicg%==%devklic5% set devklicg=NONE
if %devklich%==%devklic5% set devklich=NONE
if %devklici%==%devklic5% set devklici=NONE
if %devklic7%==%devklic6% set devklic7=NONE
if %devklic8%==%devklic6% set devklic8=NONE
if %devklic9%==%devklic6% set devklic9=NONE
if %devklica%==%devklic6% set devklica=NONE
if %devklicb%==%devklic6% set devklicb=NONE
if %devklicc%==%devklic6% set devklicc=NONE
if %devklicd%==%devklic6% set devklicd=NONE
if %devklice%==%devklic6% set devklice=NONE
if %devklicf%==%devklic6% set devklicf=NONE
if %devklicg%==%devklic6% set devklicg=NONE
if %devklich%==%devklic6% set devklich=NONE
if %devklici%==%devklic6% set devklici=NONE
if %devklic8%==%devklic7% set devklic8=NONE
if %devklic9%==%devklic7% set devklic9=NONE
if %devklica%==%devklic7% set devklica=NONE
if %devklicb%==%devklic7% set devklicb=NONE
if %devklicc%==%devklic7% set devklicc=NONE
if %devklicd%==%devklic7% set devklicd=NONE
if %devklice%==%devklic7% set devklice=NONE
if %devklicf%==%devklic7% set devklicf=NONE
if %devklicg%==%devklic7% set devklicg=NONE
if %devklich%==%devklic7% set devklich=NONE
if %devklici%==%devklic7% set devklici=NONE
if %devklic9%==%devklic8% set devklic9=NONE
if %devklica%==%devklic8% set devklica=NONE
if %devklicb%==%devklic8% set devklicb=NONE
if %devklicc%==%devklic8% set devklicc=NONE
if %devklicd%==%devklic8% set devklicd=NONE
if %devklice%==%devklic8% set devklice=NONE
if %devklicf%==%devklic8% set devklicf=NONE
if %devklicg%==%devklic8% set devklicg=NONE
if %devklich%==%devklic8% set devklich=NONE
if %devklici%==%devklic8% set devklici=NONE
if %devklica%==%devklic9% set devklica=NONE
if %devklicb%==%devklic9% set devklicb=NONE
if %devklicc%==%devklic9% set devklicc=NONE
if %devklicd%==%devklic9% set devklicd=NONE
if %devklice%==%devklic9% set devklice=NONE
if %devklicf%==%devklic9% set devklicf=NONE
if %devklicg%==%devklic9% set devklicg=NONE
if %devklich%==%devklic9% set devklich=NONE
if %devklici%==%devklic9% set devklici=NONE
if %devklicb%==%devklica% set devklicb=NONE
if %devklicc%==%devklica% set devklicc=NONE
if %devklicd%==%devklica% set devklicd=NONE
if %devklice%==%devklica% set devklice=NONE
if %devklicf%==%devklica% set devklicf=NONE
if %devklicg%==%devklica% set devklicg=NONE
if %devklich%==%devklica% set devklich=NONE
if %devklici%==%devklica% set devklici=NONE
if %devklicc%==%devklicb% set devklicc=NONE
if %devklicd%==%devklicb% set devklicd=NONE
if %devklice%==%devklicb% set devklice=NONE
if %devklicf%==%devklicb% set devklicf=NONE
if %devklicg%==%devklicb% set devklicg=NONE
if %devklich%==%devklicb% set devklich=NONE
if %devklici%==%devklicb% set devklici=NONE
if %devklicd%==%devklicc% set devklicd=NONE
if %devklice%==%devklicc% set devklice=NONE
if %devklicf%==%devklicc% set devklicf=NONE
if %devklicg%==%devklicc% set devklicg=NONE
if %devklich%==%devklicc% set devklich=NONE
if %devklici%==%devklicc% set devklici=NONE
if %devklice%==%devklicd% set devklice=NONE
if %devklicf%==%devklicd% set devklicf=NONE
if %devklicg%==%devklicd% set devklicg=NONE
if %devklich%==%devklicd% set devklich=NONE
if %devklici%==%devklicd% set devklici=NONE
if %devklicf%==%devklice% set devklicf=NONE
if %devklicg%==%devklice% set devklicg=NONE
if %devklich%==%devklice% set devklich=NONE
if %devklici%==%devklice% set devklici=NONE
if %devklicg%==%devklicf% set devklicg=NONE
if %devklich%==%devklicf% set devklich=NONE
if %devklici%==%devklicf% set devklici=NONE
if %devklich%==%devklicg% set devklich=NONE
if %devklici%==%devklicg% set devklici=NONE
if %devklici%==%devklich% set devklici=NONE
echo Trying Found klicense = %devklic%
if not %devklic2%==NONE echo Trying Found klicense = %devklic2%
if not %devklic3%==NONE echo Trying Found klicense = %devklic3%
if not %devklic4%==NONE echo Trying Found klicense = %devklic4%
if not %devklic5%==NONE echo Trying Found klicense = %devklic5%
if not %devklic6%==NONE echo Trying Found klicense = %devklic6%
if not %devklic7%==NONE echo Trying Found klicense = %devklic7%
if not %devklic8%==NONE echo Trying Found klicense = %devklic8%
if not %devklic9%==NONE echo Trying Found klicense = %devklic9%
if not %devklica%==NONE echo Trying Found klicense = %devklica%
if not %devklicb%==NONE echo Trying Found klicense = %devklicb%
if not %devklicc%==NONE echo Trying Found klicense = %devklicc%
if not %devklicd%==NONE echo Trying Found klicense = %devklicd%
if not %devklice%==NONE echo Trying Found klicense = %devklice%
if not %devklicf%==NONE echo Trying Found klicense = %devklicf%
if not %devklicg%==NONE echo Trying Found klicense = %devklicg%
if not %devklich%==NONE echo Trying Found klicense = %devklich%
if not %devklici%==NONE echo Trying Found klicense = %devklici%
echo ==========================================================================
if not exist devk.txt pause
echo %devklic% >devk.txt

if not exist %DIR_RAP%\"%content%.rap" (goto nonk)

if not %devklic%==NONE make_npdata -v -d "%DIR_DEST%"/"%edat%" "%DIR_DEST%"/"%dat%" 8 "%devklic%" "%DIR_RAP%"/"%content%.rap"
if exist "%DIR_DEST%"\"%dat%" (goto end)

if not %devklic2%==NONE make_npdata -v -d "%DIR_DEST%"/"%edat%" "%DIR_DEST%"/"%dat%" 8 "%devklic2%" "%DIR_RAP%"/"%content%.rap"
if exist "%DIR_DEST%"\"%dat%" (goto end2)

if not %devklic3%==NONE make_npdata -v -d "%DIR_DEST%"/"%edat%" "%DIR_DEST%"/"%dat%" 8 "%devklic3%" "%DIR_RAP%"/"%content%.rap"
if exist "%DIR_DEST%"\"%dat%" (goto end3)

if not %devklic4%==NONE make_npdata -v -d "%DIR_DEST%"/"%edat%" "%DIR_DEST%"/"%dat%" 8 "%devklic4%" "%DIR_RAP%"/"%content%.rap"
if exist "%DIR_DEST%"\"%dat%" (goto end4)

if not %devklic5%==NONE make_npdata -v -d "%DIR_DEST%"/"%edat%" "%DIR_DEST%"/"%dat%" 8 "%devklic5%" "%DIR_RAP%"/"%content%.rap"
if exist "%DIR_DEST%"\"%dat%" (goto end5)

if not %devklic6%==NONE make_npdata -v -d "%DIR_DEST%"/"%edat%" "%DIR_DEST%"/"%dat%" 8 "%devklic6%" "%DIR_RAP%"/"%content%.rap"
if exist "%DIR_DEST%"\"%dat%" (goto end6)

if not %devklic7%==NONE make_npdata -v -d "%DIR_DEST%"/"%edat%" "%DIR_DEST%"/"%dat%" 8 "%devklic7%" "%DIR_RAP%"/"%content%.rap"
if exist "%DIR_DEST%"\"%dat%" (goto end7)

if not %devklic8%==NONE make_npdata -v -d "%DIR_DEST%"/"%edat%" "%DIR_DEST%"/"%dat%" 8 "%devklic8%" "%DIR_RAP%"/"%content%.rap"
if exist "%DIR_DEST%"\"%dat%" (goto end8)

if not %devklic9%==NONE make_npdata -v -d "%DIR_DEST%"/"%edat%" "%DIR_DEST%"/"%dat%" 8 "%devklic9%" "%DIR_RAP%"/"%content%.rap"
if exist "%DIR_DEST%"\"%dat%" (goto end9)

if not %devklica%==NONE make_npdata -v -d "%DIR_DEST%"/"%edat%" "%DIR_DEST%"/"%dat%" 8 "%devklica%" "%DIR_RAP%"/"%content%.rap"
if exist "%DIR_DEST%"\"%dat%" (goto end10)

if not %devklicb%==NONE make_npdata -v -d "%DIR_DEST%"/"%edat%" "%DIR_DEST%"/"%dat%" 8 "%devklicb%" "%DIR_RAP%"/"%content%.rap"
if exist "%DIR_DEST%"\"%dat%" (goto end11)

if not %devklicc%==NONE make_npdata -v -d "%DIR_DEST%"/"%edat%" "%DIR_DEST%"/"%dat%" 8 "%devklicc%" "%DIR_RAP%"/"%content%.rap"
if exist "%DIR_DEST%"\"%dat%" (goto end12)

if not %devklicd%==NONE make_npdata -v -d "%DIR_DEST%"/"%edat%" "%DIR_DEST%"/"%dat%" 8 "%devklicd%" "%DIR_RAP%"/"%content%.rap"
if exist "%DIR_DEST%"\"%dat%" (goto end13)

if not %devklice%==NONE make_npdata -v -d "%DIR_DEST%"/"%edat%" "%DIR_DEST%"/"%dat%" 8 "%devklice%" "%DIR_RAP%"/"%content%.rap"
if exist "%DIR_DEST%"\"%dat%" (goto end14)

if not %devklicf%==NONE make_npdata -v -d "%DIR_DEST%"/"%edat%" "%DIR_DEST%"/"%dat%" 8 "%devklicf%" "%DIR_RAP%"/"%content%.rap"
if exist "%DIR_DEST%"\"%dat%" (goto end15)

if not %devklicg%==NONE make_npdata -v -d "%DIR_DEST%"/"%edat%" "%DIR_DEST%"/"%dat%" 8 "%devklicg%" "%DIR_RAP%"/"%content%.rap"
if exist "%DIR_DEST%"\"%dat%" (goto end16)

if not %devklich%==NONE make_npdata -v -d "%DIR_DEST%"/"%edat%" "%DIR_DEST%"/"%dat%" 8 "%devklich%" "%DIR_RAP%"/"%content%.rap"
if exist "%DIR_DEST%"\"%dat%" (goto end17)

if not %devklici%==NONE make_npdata -v -d "%DIR_DEST%"/"%edat%" "%DIR_DEST%"/"%dat%" 8 "%devklici%" "%DIR_RAP%"/"%content%.rap"
if exist "%DIR_DEST%"\"%dat%" (goto end18)

:nonk

if not %devklic%==NONE make_npdata -v -d %DIR_DEST%/"%edat%" %DIR_DEST%/"%dat%" 8 %devklic%
if exist "%DIR_DEST%"\"%dat%" (goto end)

if not %devklic2%==NONE make_npdata -v -d %DIR_DEST%/"%edat%" %DIR_DEST%/"%dat%" 8 %devklic2%
if exist "%DIR_DEST%"\"%dat%" (goto end2)

if not %devklic3%==NONE make_npdata -v -d %DIR_DEST%/"%edat%" %DIR_DEST%/"%dat%" 8 %devklic3%
if exist "%DIR_DEST%"\"%dat%" (goto end3)

if not %devklic4%==NONE make_npdata -v -d %DIR_DEST%/"%edat%" %DIR_DEST%/"%dat%" 8 %devklic4%
if exist "%DIR_DEST%"\"%dat%" (goto end4)

if not %devklic5%==NONE make_npdata -v -d %DIR_DEST%/"%edat%" %DIR_DEST%/"%dat%" 8 %devklic5%
if exist "%DIR_DEST%"\"%dat%" (goto end5)

if not %devklic6%==NONE make_npdata -v -d %DIR_DEST%/"%edat%" %DIR_DEST%/"%dat%" 8 %devklic6%
if exist "%DIR_DEST%"\"%dat%" (goto end6)

if not %devklic7%==NONE make_npdata -v -d %DIR_DEST%/"%edat%" %DIR_DEST%/"%dat%" 8 %devklic7%
if exist "%DIR_DEST%"\"%dat%" (goto end7)

if not %devklic8%==NONE make_npdata -v -d %DIR_DEST%/"%edat%" %DIR_DEST%/"%dat%" 8 %devklic8%
if exist "%DIR_DEST%"\"%dat%" (goto end8)

if not %devklic9%==NONE make_npdata -v -d %DIR_DEST%/"%edat%" %DIR_DEST%/"%dat%" 8 %devklic9%
if exist "%DIR_DEST%"\"%dat%" (goto end9)

if not %devklica%==NONE make_npdata -v -d %DIR_DEST%/"%edat%" %DIR_DEST%/"%dat%" 8 %devklica%
if exist "%DIR_DEST%"\"%dat%" (goto end10)

if not %devklicb%==NONE make_npdata -v -d %DIR_DEST%/"%edat%" %DIR_DEST%/"%dat%" 8 %devklicb%
if exist "%DIR_DEST%"\"%dat%" (goto end11)

if not %devklicc%==NONE make_npdata -v -d %DIR_DEST%/"%edat%" %DIR_DEST%/"%dat%" 8 %devklicc%
if exist "%DIR_DEST%"\"%dat%" (goto end12)

if not %devklicd%==NONE make_npdata -v -d %DIR_DEST%/"%edat%" %DIR_DEST%/"%dat%" 8 %devklicd%
if exist "%DIR_DEST%"\"%dat%" (goto end13)

if not %devklice%==NONE make_npdata -v -d %DIR_DEST%/"%edat%" %DIR_DEST%/"%dat%" 8 %devklice%
if exist "%DIR_DEST%"\"%dat%" (goto end14)

if not %devklicf%==NONE make_npdata -v -d %DIR_DEST%/"%edat%" %DIR_DEST%/"%dat%" 8 %devklicf%
if exist "%DIR_DEST%"\"%dat%" (goto end15)

if not %devklicg%==NONE make_npdata -v -d %DIR_DEST%/"%edat%" %DIR_DEST%/"%dat%" 8 %devklicg%
if exist "%DIR_DEST%"\"%dat%" (goto end16)

if not %devklich%==NONE make_npdata -v -d %DIR_DEST%/"%edat%" %DIR_DEST%/"%dat%" 8 %devklich%
if exist "%DIR_DEST%"\"%dat%" (goto end17)

if not %devklici%==NONE make_npdata -v -d %DIR_DEST%/"%edat%" %DIR_DEST%/"%dat%" 8 %devklici%
if exist "%DIR_DEST%"\"%dat%" (goto end18)

cls 
if not exist %DIR_DEST%\"%dat%" echo ==========================
sfk color magenta && if not exist %DIR_DEST%\"%dat%" echo ********[WARNING]*********
sfk color green && if not exist %DIR_DEST%\"%dat%" echo ==========================
if not exist %DIR_DEST%\"%dat%" echo.
if not exist %DIR_DEST%\"%dat%" echo  Could Not Decrypt *.EDAT!
if not exist %DIR_DEST%\"%dat%" echo.
if not exist %DIR_DEST%\"%dat%" echo --------------------------
if not exist %DIR_DEST%\"%dat%" echo     Do you have rap?
if not exist %DIR_DEST%\"%dat%" echo.
if not exist %DIR_DEST%\"%dat%" echo If No Klic ADD it to list!
if not exist %DIR_DEST%\"%dat%" echo.
if not exist %DIR_DEST%\"%dat%" echo ==========================
if not exist %DIR_DEST%\"%dat%" pause
if not exist %DIR_DEST%\"%dat%" move %DIR_DEST%/"%edat%" %DIR_SRC%
if not exist %DIR_DEST%\"%dat%" cls
if not exist %DIR_DEST%\"%dat%" echo temp>ztemp
if not exist %DIR_DEST%\"%dat%" call ESSSE_RESIGNER.bat

:end
if exist %DIR_DEST%\"%dat%" make_npdata -v -e "%DIR_DEST%"/"%dat%" "%DIR_DEST%"/"%edat%" 1 1 3 %flg% 16 3 %tp% %content% 8 %devklic%
goto fin

:end2
if exist %DIR_DEST%\"%dat%" make_npdata -v -e "%DIR_DEST%"/"%dat%" "%DIR_DEST%"/"%edat%" 1 1 3 %flg% 16 3 %tp% %content% 8 %devklic2%
goto fin

:end3
if exist %DIR_DEST%\"%dat%" make_npdata -v -e "%DIR_DEST%"/"%dat%" "%DIR_DEST%"/"%edat%" 1 1 3 %flg% 16 3 %tp% %content% 8 %devklic3%
goto fin

:end4
if exist %DIR_DEST%\"%dat%" make_npdata -v -e "%DIR_DEST%"/"%dat%" "%DIR_DEST%"/"%edat%" 1 1 3 %flg% 16 3 %tp% %content% 8 %devklic4%
goto fin

:end5
if exist %DIR_DEST%\"%dat%" make_npdata -v -e "%DIR_DEST%"/"%dat%" "%DIR_DEST%"/"%edat%" 1 1 3 %flg% 16 3 %tp% %content% 8 %devklic5%
goto fin

:end6
if exist %DIR_DEST%\"%dat%" make_npdata -v -e "%DIR_DEST%"/"%dat%" "%DIR_DEST%"/"%edat%" 1 1 3 %flg% 16 3 %tp% %content% 8 %devklic6%
goto fin

:end7
if exist %DIR_DEST%\"%dat%" make_npdata -v -e "%DIR_DEST%"/"%dat%" "%DIR_DEST%"/"%edat%" 1 1 3 %flg% 16 3 %tp% %content% 8 %devklic7%
goto fin

:end8
if exist %DIR_DEST%\"%dat%" make_npdata -v -e "%DIR_DEST%"/"%dat%" "%DIR_DEST%"/"%edat%" 1 1 3 %flg% 16 3 %tp% %content% 8 %devklic8%
goto fin

:end9
if exist %DIR_DEST%\"%dat%" make_npdata -v -e "%DIR_DEST%"/"%dat%" "%DIR_DEST%"/"%edat%" 1 1 3 %flg% 16 3 %tp% %content% 8 %devklic9%
goto fin

:end10
if exist %DIR_DEST%\"%dat%" make_npdata -v -e "%DIR_DEST%"/"%dat%" "%DIR_DEST%"/"%edat%" 1 1 3 %flg% 16 3 %tp% %content% 8 %devklica%
goto fin

:end11
if exist %DIR_DEST%\"%dat%" make_npdata -v -e "%DIR_DEST%"/"%dat%" "%DIR_DEST%"/"%edat%" 1 1 3 %flg% 16 3 %tp% %content% 8 %devklicb%
goto fin

:end12
if exist %DIR_DEST%\"%dat%" make_npdata -v -e "%DIR_DEST%"/"%dat%" "%DIR_DEST%"/"%edat%" 1 1 3 %flg% 16 3 %tp% %content% 8 %devklicc%
goto fin

:end13
if exist %DIR_DEST%\"%dat%" make_npdata -v -e "%DIR_DEST%"/"%dat%" "%DIR_DEST%"/"%edat%" 1 1 3 %flg% 16 3 %tp% %content% 8 %devklicd%
goto fin

:end14
if exist %DIR_DEST%\"%dat%" make_npdata -v -e "%DIR_DEST%"/"%dat%" "%DIR_DEST%"/"%edat%" 1 1 3 %flg% 16 3 %tp% %content% 8 %devklice%
goto fin

:end15
if exist %DIR_DEST%\"%dat%" make_npdata -v -e "%DIR_DEST%"/"%dat%" "%DIR_DEST%"/"%edat%" 1 1 3 %flg% 16 3 %tp% %content% 8 %devklicf%
goto fin

:end16
if exist %DIR_DEST%\"%dat%" make_npdata -v -e "%DIR_DEST%"/"%dat%" "%DIR_DEST%"/"%edat%" 1 1 3 %flg% 16 3 %tp% %content% 8 %devklicg%
goto fin

:end17
if exist %DIR_DEST%\"%dat%" make_npdata -v -e "%DIR_DEST%"/"%dat%" "%DIR_DEST%"/"%edat%" 1 1 3 %flg% 16 3 %tp% %content% 8 %devklich%
goto fin

:end18
if exist %DIR_DEST%\"%dat%" make_npdata -v -e "%DIR_DEST%"/"%dat%" "%DIR_DEST%"/"%edat%" 1 1 3 %flg% 16 3 %tp% %content% 8 %devklici%

:fin
if not exist devk2.txt pause
echo %devklic% >devk2.txt
if exist edatinfo.txt del edatinfo.txt
if exist %DIR_DEST%\"%dat%" del %DIR_DEST%\"%dat%"