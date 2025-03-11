@ECHO OFF
PUSHD "%~dp0"
set _arch=x86
IF "%PROCESSOR_ARCHITECTURE%"=="AMD64" (set _arch=x86_64)
IF DEFINED PROCESSOR_ARCHITEW6432 (set _arch=x86_64)

echo Для установки службы, которая снимет принудительный DNS:
echo Этот пакетный файл необходимо запускать от имени администратора.
echo Правый клик - Запустить от имени администратора.
echo Если вы запустили от имени администратора, нажмите любую клавишу.
echo При использовании этого метода вам может потребоваться изменить DNS в настройках Windows.
pause
sc stop "TunDPI"
sc delete "TunDPI"
sc create "TunDPI" binPath= "\"%CD%\%_arch%\goodbyedpi.exe\" -1" start= "auto"
sc description "TunDPI" "TunDPI - Специальный инструмент обхода DPI для Discord (альтернатива 2 SuperOnline)."
sc start "TunDPI"

POPD
