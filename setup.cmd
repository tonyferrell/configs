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

   mklink /D %USERPROFILE%\.vim %USERPROFILE%\dot-files\.vim

   mklink %USERPROFILE%\.vimrc %USERPROFILE%\dot-files\.vimrc

   git submodule update --install

   vim +PluginInstall +qall
