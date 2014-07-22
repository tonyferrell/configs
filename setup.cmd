echo run elevated

mklink /D %USERPROFILE%\.vim %USERPROFILE%\dot-files\.vim

mklink %USERPROFILE%\.vimrc %USERPROFILE%\dot-files\.vimrc

git submodule update --install

vim +PluginInstall +qall
