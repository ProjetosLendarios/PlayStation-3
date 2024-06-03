

for /F "tokens=*" %%* in ('dir /b %DIR_SRC%\*.edat') do set edat=%%*

scetool.exe -i %DIR_SRC%/EBOOT.BIN >selfinfo.txt
for /f "skip=3 tokens=1,*" %%a in (selfinfo.txt) do if "%%a"=="ContentID" set contentid=%%b
scetool -v -d %DIR_SRC%/EBOOT.BIN %DIR_SRC%/EBOOT.ELF

if not exist %DIR_SRC%\EBOOT.BIN cls
if not exist %DIR_SRC%\EBOOT.BIN echo ========================
sfk color magenta && if not exist %DIR_SRC%\EBOOT.BIN echo *******[WARNING]********
sfk color green && if not exist %DIR_SRC%\EBOOT.BIN echo ========================
if not exist %DIR_SRC%\EBOOT.BIN echo.
if not exist %DIR_SRC%\EBOOT.BIN echo   No EBOOT.BIN found in
if not exist %DIR_SRC%\EBOOT.BIN echo "EDAT_Bruteforce" folder
if not exist %DIR_SRC%\EBOOT.BIN echo.
if not exist %DIR_SRC%\EBOOT.BIN echo ========================
if not exist %DIR_SRC%\EBOOT.BIN echo pause
if not exist %DIR_SRC%\EBOOT.BIN echo cls
if not exist %DIR_SRC%\EBOOT.BIN echo temp>ztemp
if not exist %DIR_SRC%\EBOOT.BIN echo call "ESSSE_RESIGNER.bat"

if not exist %DIR_SRC%\*.edat cls
if not exist %DIR_SRC%\*.edat echo ========================
sfk color magenta && if not exist %DIR_SRC%\*.edat echo *******[WARNING]********
sfk color green && if not exist %DIR_SRC%\*.edat echo ========================
if not exist %DIR_SRC%\*.edat echo.
if not exist %DIR_SRC%\*.edat echo   No EDAT file found in
if not exist %DIR_SRC%\*.edat echo "EDAT_Bruteforce" folder
if not exist %DIR_SRC%\*.edat echo.
if not exist %DIR_SRC%\*.edat echo ========================
if not exist %DIR_SRC%\*.edat echo pause
if not exist %DIR_SRC%\*.edat echo cls
if not exist %DIR_SRC%\*.edat echo temp>ztemp
if not exist %DIR_SRC%\*.edat echo call "ESSSE_RESIGNER.bat"



if not exist %DIR_SRC%\EBOOT.ELF cls
if not exist %DIR_SRC%\EBOOT.ELF echo ==========================
sfk color magenta && if not exist %DIR_SRC%\EBOOT.ELF echo ********[WARNING]*********
sfk color green && if not exist %DIR_SRC%\EBOOT.ELF echo ==========================
if not exist %DIR_SRC%\EBOOT.ELF echo.
if not exist %DIR_SRC%\EBOOT.ELF echo  Rap file needed for LOCAL
if not exist %DIR_SRC%\EBOOT.ELF echo   TYPE! Put rap in "RAPS" 
if not exist %DIR_SRC%\EBOOT.ELF echo           folder!
if not exist %DIR_SRC%\EBOOT.ELF echo.
if not exist %DIR_SRC%\EBOOT.ELF echo ==========================
if not exist %DIR_SRC%\EBOOT.ELF echo pause
if not exist %DIR_SRC%\EBOOT.ELF echo cls
if not exist %DIR_SRC%\EBOOT.ELF echo temp>ztemp
if not exist %DIR_SRC%\EBOOT.ELF echo call "ESSSE_RESIGNER.bat"


:BF
cls
echo ===========================
sfk color magenta && echo ***************************
sfk color green && echo ===========================
sfk color yellow && echo Welcome to EDAT BRUTEFORCE!
sfk color green && echo.
echo Depending on file size this
echo  may take a little while!
echo.
sfk color yellow && echo Which mode would you like?
echo (Binary is most effective)
sfk color green && echo.
echo        1. Binary
echo        2. Text
echo        3. unicode Text
echo ===========================
set /p BFC= Choose (1-3)
if %BFC%==1 set mode=0
if %BFC%==1 (goto BF1)
if %BFC%==2 set mode=1
if %BFC%==2 (goto BF1)
if %BFC%==3 set mode=2
if %BFC%==3 (goto BF1)
echo Only choose 1-3!
pause
cls
goto BF

:BF1
echo.
make_npdata -v -b %DIR_SRC%/%edat% %DIR_SRC%/EBOOT.ELF %mode%


if not exist klic.bin echo.
if not exist klic.bin echo Could Not Find "klicense" try another mode!
if not exist klic.bin pause
if not exist klic.bin cls
if not exist klic.bin echo temp>ztemp
if not exist klic.bin call ESSSE_RESIGNER.bat


if exist klic.bin set offset=0
if exist klic.bin FOR /F "tokens=*" %%i in ('"od -j%OFFSET% -N16 -w16 -t x1 klic.bin | cut -c 8- |sed 's/ //g'"') do SET KEY=%%i
SET String=%key%

CALL :UpCase String

goto ukase

:UpCase
FOR %%i IN ("a=A" "b=B" "c=C" "d=D" "e=E" "f=F" "g=G" "h=H" "i=I" "j=J" "k=K" "l=L" "m=M" "n=N" "o=O" "p=P" "q=Q" "r=R" "s=S" "t=T" "u=U" "v=V" "w=W" "x=X" "y=Y" "z=Z") DO CALL SET "%1=%%%1:%%~i%%"

:ukase
echo.
echo DEV KEY: %String%
if exist klic.bin echo %String% %contentID% >>klicense.txt
if exist klic.bin echo.
if exist klic.bin echo ================================================================
sfk color yellow && if exist klic.bin echo "klicense" added to klicense.txt. Try Resigning Files from Game!
sfk color green && if exist klic.bin echo ================================================================
if exist klic.bin pause
if exist klic.bin del %DIR_SRC%\EBOOT.ELF
if exist klic.bin del %DIR_SRC%\*.edat
if exist klic.bin del %DIR_SRC%\EBOOT.BIN
if exist klic.bin del klic.bin
cls
echo temp>ztemp
call "ESSSE_RESIGNER.bat"