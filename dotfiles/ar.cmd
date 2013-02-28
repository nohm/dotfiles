@echo off

ansicon -p
cls

DOSKEY zt4=E: $t cls $t cd Dropbox\GitHub\zt4\zt4
DOSKEY zt4-up=E: $t cd Dropbox\GitHub\zt4\zt4 $t ansicon -u $t cls $t mvn install $t mvn eclipse:eclipse -Dwtpversion=1.5 $t ansicon -i

DOSKEY em=%SystemRoot%\System32\notepad.exe %APPS%\Console2\scripts\ar.cmd
DOSKEY cmdfetch=echo off $t C: $t cd %APPS%\CMDFetch $t cls $t cmdfetch.bat $t cd C:\ $t echo on
DOSKEY macros=doskey /macros
DOSKEY colors=ruby %APPS%\Console2\scripts\colors.rb $*
DOSKEY conway=ruby %APPS%\Console2\scripts\life.rb $*
DOSKEY db=E: $t cls $t cd Dropbox
DOSKEY home=C: $t cls $t cd %UserProfile%
DOSKEY c=cls
DOSKEY clear=cls
DOSKEY ls=dir $*
DOSKEY rm=del $*
DOSKEY mv=copy $1 $2 $t del $1