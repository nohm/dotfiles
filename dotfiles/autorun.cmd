@echo off

REM ##############
REM #   NOTICE   #
REM ##############
REM Author; Snack
REM Date; 04/03/2013
REM Split commands:  $T
REM Single argument: $[number]
REM All arguments:   $*

REM ################
REM #   SETTINGS   #
REM ################
REM Setting variables
set _ROOT=C:\Users\Snack\Documents\Apps\Console2
set _SCRIPTS=%_ROOT%\scripts
set _DROPBOX=E:\Dropbox
set _GITHUB=%_DROPBOX%\Github
set _ECLIPSE=%_DROPBOX%\Eclipse
set _PROLOG=%_ECLIPSE%\Prolog-Scribbles\src\
set _RUBY=%_ECLIPSE%\Ruby-Scribbles\
REM Initialize ANSI coloring
ansicon -p
REM Clear the console
cls

REM ###############
REM #   ALIASES   #
REM ###############
REM Git commands, goto dir and mvn install+update
DOSKEY git-dir=cd /D %_GITHUB%\$1\$2 $T dir
DOSKEY mvn-up=cd /D %_GITHUB%\$1\$1 $T %_ROOT%\ansicon -u $T cls $T mvn -Dmaven.test.skip=true install $T mvn eclipse:eclipse -Dwtpversion=1.5 $T %_ROOT%\ansicon -i
REM Directories
DOSKEY open=%SystemRoot%\System32\explorer.exe .
DOSKEY db=cd /D %_DROPBOX%
DOSKEY ecl-dir=cd /D %_ECLIPSE% $T dir
DOSKEY pro-dir=cd /D %_PROLOG% $T dir
DOSKEY ruby-dir=cd /D %_RUBY% $T dir
REM Edit macros
DOSKEY em=%SystemRoot%\System32\notepad.exe %_SCRIPTS%\autorun.cmd
DOSKEY macros=doskey /macros
REM Edit and update hosts
DOSKEY edit-hosts=%SystemRoot%\System32\notepad.exe %SystemRoot%\System32\drivers\etc\hosts
DOSKEY print-hosts=type %SystemRoot%\System32\drivers\etc\hosts
DOSKEY flush=ipconfig /flushdns
REM Putty
DOSKEY putty=%_SCRIPTS%\putty.exe $*
DOSKEY putty-saxion4=%_SCRIPTS%\putty.exe -ssh 178.251.26.83 -l root -pw 9PFiRwh46
REM Custom scripts
DOSKEY cmdfetch=echo off $T cd /D %_SCRIPTS%\cmdfetch $T cls $T cmdfetch.bat $T cd %_ROOT:~0,3% $T echo on
DOSKEY colors=ruby %_SCRIPTS%\colors.rb $*
DOSKEY life=ruby %_SCRIPTS%\life.rb $*
DOSKEY pastie=ruby %_SCRIPTS%\pastie\pastie.rb $*
REM Some common *nix commands
DOSKEY home=cd /D %UserProfile%
DOSKEY cd=cd /D $*
DOSKEY c=cls
DOSKEY clear=cls
DOSKEY cat=type
DOSKEY ls=dir $*
DOSKEY rm=del $*
DOSKEY mv=copy $1 $2 $T del $1
DOSKEY man=help $1
DOSKEY quit=exit
REM Killing tasks
DOSKEY top=tasklist
DOSKEY kill=taskkill /F /IM $1
DOSKEY kill-pid=taskkill /F /FI "PID eq $1"
REM Reboot
DOSKEY reboot=shutdown /r /c "Reboot requested!"