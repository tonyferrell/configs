set _tempvbs=%LocalAppData%\getadmin.vbs

setlocal
@echo off

:: Check for admin permissions
Net Session >nul 2>&1
:: If error flag set, we do not have admin.
If ERRORLEVEL 1 (
   Echo Requesting administrative privileges...
   Goto sub_elevate
) Else ( Goto sub_main )

:sub_elevate
   echo Set objShell = CreateObject^("Shell.Application"^) > %_tempvbs%
   echo objShell.ShellExecute "%~f0", "", "", "runas", 1 >> %_tempvbs%
   cscript "%_tempvbs%" //nologo
   Exit /B

:sub_main
   if exist "%_tempvbs%" ( Del "%_tempvbs%" )

   :: Script should be in the root of the dot-files directory - wherever that is.
   set fileRoot=%~dp0

   pushd %fileRoot%

   if not exist ".vim\bundle\Vundle.vim" (
      echo "Downloading Vundle (vim package manager) into .vim\bundle\Vundle.vim"
      git clone git@github.com:gmarik/Vundle.vim.git .vim\bundle\Vundle.vim
   )

   if not exist ".vim\swap\" (
      mkdir .vim\swap
   )

   if not exist "%USERPROFILE%\.vim" (mklink /D %USERPROFILE%\.vim %fileRoot%.vim)
   if not exist "%USERPROFILE%\.vimrc" (mklink %USERPROFILE%\.vimrc %fileRoot%.vimrc)
   if not exist "%USERPROFILE%\.bashrc" (mklink %USERPROFILE%\.bashrc %fileRoot%.bashrc)
   if not exist "%USERPROFILE%\.bash_profile" (mklink %USERPROFILE%\.bash_profile %fileRoot%.bash_profile)

   echo Continue to install Vundle plugins
   pause
   :: Install Vundle Plugins
   vim +PluginInstall +qall

   echo Install completed
   pause
   popd

endlocal
