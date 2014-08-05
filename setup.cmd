@setlocal enabledelayedexpansion enableextensions
@echo off

set _tempvbs=%LocalAppData%\getadmin.vbs
set swapDir=".vim\swap"

:: Check for admin permissions
Net Session >nul 2>&1

:: If error flag set, we do not have admin.
if ERRORLEVEL 1 (
  echo Requesting administrative privileges and restarting...
  goto rerun_script_elevated
)

:: Script should be in the root of the dot-files directory - wherever that is.
call :directory_name_from_path fileRoot %0

pushd %fileRoot%

if not exist %swapDir% (
  mkdir %swapDir%
)

if not exist ".vim\bundle\Vundle.vim" (
  echo "Cloning Vundle into .vim/bundle/Vundle.vim"
  git clone git@github.com:gmarik/Vundle.vim.git .vim\bundle\Vundle.vim
)

call :link_if_missing ".vimrc" %USERPROFILE% %fileRoot%
call :link_if_missing ".bash_profile" %USERPROFILE% %fileRoot%
call :link_if_missing ".bashrc" %USERPROFILE% %fileRoot%
call :link_if_missing ".vim" %USERPROFILE% %fileRoot%

echo Linking finished. Press any key to install Vundle plugins
@pause

:: Install Vundle Plugins
vim +PluginInstall +qall

pause

popd

@goto :eof

:: Function Declarations - commented because cmd is cryptic, and I hope they can be reused.

:: Create an elevated command prompt using the script host and run this script.
:rerun_script_elevated (
  echo Set objShell = CreateObject^("Shell.Application"^) > %_tempvbs%
  echo objShell.ShellExecute "%~f0", "", "", "runas", 1 >> %_tempvbs%
  cscript "%_tempvbs%" //nologo

  ::if exist "%_tempvbs%" ( del "%_tempvbs%" )
  exit /B
)

:: Given a path, extract the directory.
:: Example usage:
::    call :directory_name_from_path  result "C:\Directory1\Dir2\myfile.txt"
::    echo %result%  ::Echos C:\Directory1\Dir2\
:directory_name_from_path <resultVar> <pathVar>
(
   set "%~1=%~dp2"
   exit /b
)

:: Gets the output of a command, and stores it in a variable named <resultVar>
:: Example usage:
::    call :get_command_output result "where git"
::    echo %result%  ::Echos the location of your git command.
:get_command_output <resultVar> <command>
(
   FOR /F "delims=" %%i IN ('%~2') DO @set "%~1=%%i"
   exit /b
)

:link_if_missing <file> <linkInto> <linkFrom>
(
  set! destination="%~2\%~1"
  set! source="%~3%~1"
  if not exist !destination! (
    if exist "!source!\*" (
      mklink /D !destination! !source!
      exit /b
    ) else (
      if exist "!source!" (
        mklink !destination! !source!
        exit /b
      )
    )

    echo "Unable to link !source!. File does not exist."
    exit /b
   )
)

:eof
@endlocal
