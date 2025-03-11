@ECHO OFF
TITLE TunDPI v0.2.3rc3: Пассивный DPI блокировщик и утилита активного обхода DPI
ECHO TunDPI v0.2.3rc3: Пассивный DPI блокировщик и утилита активного обхода DPI
ECHO https://github.com/ValdikSS/GoodbyeDPI
ECHO https://github.com/cagritaskn/GoodbyeDPI-Turkey
ECHO https://github.com/US1BZA/TunDPI
ECHO.
ECHO Запуск TunDPI с параметрами для обхода DPI в России...
ECHO.

PUSHD "%~dp0"
set _arch=x86
IF "%PROCESSOR_ARCHITECTURE%"=="AMD64" (set _arch=x86_64)
IF DEFINED PROCESSOR_ARCHITEW6432 (set _arch=x86_64)
PUSHD "%_arch%"

goodbyedpi.exe -5 --set-ttl 5 --dns-addr 77.88.8.8 --dns-port 1253 --dnsv6-addr 2a02:6b8::feed:0ff --dnsv6-port 1253

POPD
POPD
