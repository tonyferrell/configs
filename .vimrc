set nocompatible                    " full vim

filetype off
set encoding=utf8                   " utf8 default encoding
set number                          " Show line numbers
set lines=60 columns=120            " Inital size

if has('win32') || has('win64')
  " Use ~/.vim instead of ~/vimfiles on Windows.
  " Makes it easier to sync settings across machines.
  set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after

  " Change the location for swap and backup files.
  set directory=$HOME/.vim/swap//
  set backupdir=$HOME/.vim/swap//
else
  " Change the location for swap and backup files.
  set directory=~/.vim/swap//
  set backupdir=~/.vim/swap//
endif

" Vundle plugins.
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'digitaltoad/vim-jade'
Plugin 'moll/vim-node'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-fugitive'
Plugin 'xoria256.vim'
Plugin 'danro/rename.vim'
call vundle#end()
filetype plugin indent on

" Tabs to spaces
set expandtab

set tabstop=4
set sts=4
set shiftwidth=4

" Use ;; to add a semicolon to the end of the line
nnoremap ;; A;<Esc>

" Move vertically in the window through the horizontal splits...
map <C-J> <C-w>j<C-w>_
map <C-K> <C-w>k<C-w>_

" Move horizontally in the window through the vertical splits...
map <C-H> <C-w>h80<C-w>\|
map <C-L> <C-w>l80<C-w>\|

map <C-E> <C-w>=
map <C-8> 80<C-w>\|

" Settings for non-windowed mode
" ==============================
colorscheme desert
