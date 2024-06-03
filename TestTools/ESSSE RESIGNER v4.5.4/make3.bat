
del /F /Q %DIR_DEST%\temp.*

move %DIR_SRC%\%1.sdat %DIR_DEST%\

for /F "tokens=*" %%* in ('dir /b %DIR_DEST%\*.sdat') do set sdat=%%*

set ssdat=%1.dat
set dat=%1.dat
set dat
set dat=%dat:"=%
set dat

if exist %DIR_DEST%\%sdat% make_npdata -v -d %DIR_DEST%\%sdat% %DIR_DEST%\%dat% 0


if exist %DIR_DEST%\%dat% make_npdata -v -e %DIR_DEST%\%dat% %DIR_DEST%\%sdat% 0 1 3 1 16

del %DIR_DEST%\%dat%
cls