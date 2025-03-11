@ECHO OFF
PUSHD "%~dp0"
set _arch=x86
IF "%PROCESSOR_ARCHITECTURE%"=="AMD64" (set _arch=x86_64)
IF DEFINED PROCESSOR_ARCHITEW6432 (set _arch=x86_64)

echo DNS zorlamasini kaldiracak hizmeti yuklemek icin: (Alternatif Metod 6)
echo Bu batch dosyasini yonetici olarak calistirmaniz gerekmektedir.
echo Sag Tik - Yonetici Olarak Calistir.
echo Eger yonetici olarak calistirdiysaniz herhangi bir tusa basin.
pause
sc stop "TunDPI"
sc delete "TunDPI"
sc create "TunDPI" binPath= "\"%CD%\%_arch%\goodbyedpi.exe\" -9" start= "auto"
sc description "TunDPI" "TunDPI - Discord icin ozel DPI atlatma araci (SuperOnline alternatif 6)."
sc start "TunDPI"

POPD
