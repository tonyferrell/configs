set _tempvbs=%LocalAppData%\getadmin.vbs

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

   pushd %USERPROFILE%\dot-files

   if not exist ".vim\bundle\Vundle.vim" ( git clone git@github.com:gmarik/Vundle.vim.git .vim\bundle\Vundle.vim )

   if not exist "%USERPROFILE%\.vim" ( mklink /D %USERPROFILE%\.vim %USERPROFILE%\dot-files\.vim )

   if not exist "%USERPROFILE%\.vimrc" (mklink %USERPROFILE%\.vimrc %USERPROFILE%\dot-files\.vimrc )
   if not exist "%USERPROFILE%\.bashrc" (mklink %USERPROFILE%\.bashrc %USERPROFILE%\dot-files\.bashrc)
   if not exist "%USERPROFILE%\.bash_profile" (mklink %USERPROFILE%\.bash_profile %USERPROFILE%\dot-files\.bash_profile)
   if not exist "%USERPROFILE%\.azure-completion.sh" (mklink %USERPROFILE%\.azure-completion.sh %USERPROFILE%\dot-files\.azure-completion.sh)

   pause

   vim +PluginInstall +qall

   pause
