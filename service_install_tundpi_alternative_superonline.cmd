@ECHO OFF
PUSHD "%~dp0"
set _arch=x86
IF "%PROCESSOR_ARCHITECTURE%"=="AMD64" (set _arch=x86_64)
IF DEFINED PROCESSOR_ARCHITEW6432 (set _arch=x86_64)

echo DNS zorlamasini kaldiracak hizmeti yuklemek icin:
echo Bu batch dosyasini yonetici olarak calistirmaniz gerekmektedir.
echo Sag Tik - Yonetici Olarak Calistir.
echo Eger yonetici olarak calistirdiysaniz herhangi bir tusa basin.
echo Bu metodu kullaniyorsaniz ayrica Windows ayarlarindan DNS degistirmenize gerek yoktur.
pause
sc stop "TunDPI"
sc delete "TunDPI"
sc create "TunDPI" binPath= "\"%CD%\%_arch%\goodbyedpi.exe\" -5 --dns-addr 77.88.8.8 --dns-port 1253" start= "auto"
sc description "TunDPI" "TunDPI - Discord icin ozel DPI atlatma araci (SuperOnline alternatif)."
sc start "TunDPI"

POPD
