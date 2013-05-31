@echo off
title gauto

:: Variables
for %%A in (.) do set name=%%~nA
set log_command=git log --pretty=format:user:%%aN%%n%%ct --reverse --raw --encoding=UTF-8 --no-renames
set gource_resolution=1280x720
set gource_ppm_name=output.ppm
set gource_video_name="gource-%name%-%TIME:~0,2%.%TIME:~3,2%.%TIME:~6,2%-%DATE:~7,2%.%DATE:~4,2%.%DATE:~-4%.mkv"
set gource_opts=-%gource_resolution% --multi-sampling -s 90 --highlight-all-users --hide-filenames --seconds-per-day 5 --title %name% --key --elasticity 0.05 --bloom-multiplier 0.9 --bloom-intensity 0.6 --user-scale 0.5 --max-user-speed 100 --user-friction .2
set gource_create_opts=--disable-progress --stop-at-end --output-framerate 30 --output-ppm-stream gource\\%gource_ppm_name%
set ffmpeg_opts=-y -f image2pipe -vcodec ppm  -i gource\\%gource_ppm_name% -vcodec libvpx -b 3000K -r 25 -threads 4

:: Command line interpreter
if "%1"=="view" goto View
if "%1"=="create" goto Create
if "%1"=="convert" goto Convert
if "%1"=="clean" goto Clean
if "%1"=="help" goto Help

:: Menu for automated usage
echo.
echo ...............................................
echo Gource automation script; (c) Ohm 2013
echo Use 'gauto help' for command line options
echo Enter the number you want to execute.
echo ...............................................
echo.
echo 1 - View a gource
echo 2 - Create a gource .ppm
echo 3 - Convert a gource .ppm to .mkv
echo 4 - Clean the gource folder
echo 5 - View help
echo 6 - Exit
echo.
set /P C=Enter your choice then press [enter]: 
if %C%==1 goto View
if %C%==2 goto Create
if %C%==3 goto Convert
if %C%==4 goto Clean
if %C%==5 goto Help
goto End

:: Handles unknown commands
:Help
echo.
echo ...............................................
echo (c) Ohm 2013
echo Gource automation script for viewing, creating and converting of gource videos
echo For use with git unless the log_command variable is modified for your needs
echo Run this in your project root (.git is in here)
echo ...............................................
echo.
echo Usage: gauto [command]
echo   view    : view the gource directly
echo   create  : create a .ppm of the gource
echo   convert : convert the .ppm to .mkv
echo   clean   : clean the gource directory (deletes the huge .ppm and the log)
echo   help    : show this obviously
echo Requirements (in PATH):
echo   gource
echo   ffmpeg (for converting)
goto End

:: Shows the gource directly to the user
:View
if not exist gource (
	echo Making directory...
	mkdir gource
)
echo Initializing logfile...
%log_command% > gource\\.log
echo Showing gource...
gource %gource_opts% gource\\.log
goto End

:: Creates a gource video, slow and huge files
:Create
if not exist gource (
	echo Making directory...
	mkdir gource
)
echo Initializing logfile...
%log_command% > gource\\.log
echo Generating gource ppm...
gource %gource_opts% %gource_create_opts% gource\\.log
goto End

:: Converts ppm to .mkv
:Convert
echo Converting to .mkv...
ffmpeg %ffmpeg_opts% gource\\%gource_video_name%
goto End

:: Cleans the directory
:Clean
echo Cleaning...
if exist gource (
	cd gource
	if exist output.ppm (
		echo Deleting .ppm
		del output.ppm
	)
	if exist .log (
		echo Deleting .log
		del .log
	)
	cd ..
)
goto End

:: Nothing happens here
:End