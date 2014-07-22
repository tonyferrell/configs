" Show line numbers
set nocompatible                    " full vim
filetype off
set encoding=utf8                   " utf8 default encoding
set number                          " Show line numbers
set ruler                           " Show current position

" Use ~/.vim instead of ~/vimfiles on Windows
" Makes it easier to sync settings across machines
if has('win32') || has('win64')
    set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'altercation/vim-colors-solarized'
Plugin 'digitaltoad/vim-jade'
Plugin 'moll/vim-node'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-sleuth'
Plugin 'xoria256.vim'
Plugin 'danro/rename.vim'
Plugin 'tpope/vim-fugitive'
call vundle#end()
filetype plugin indent on

" Tabs to spaces
set expandtab
set tabstop=4
set shiftwidth=4
set sts=4

set list listchars=tab:→\ ,trail:·

inoremap <C-k> <Esc>                " CTRL+K to escape
nnoremap ;; A;<Esc>                 " ;; to add a semicolon to the end of the line

" Move vertically in the window through the horizontal splits...
map <C-J> <C-w>j<C-w>_
map <C-K> <C-w>k<C-w>_

" Move horizontally in the window through the vertical splits...
map <C-H> <C-w>h<C-w>\|
map <C-L> <C-w>l<C-w>\|

map <C-E> <C-w>=

set directory=.,$TEMP

" Configure GUI settings
if has("gui_running")

    set noerrorbells visualbell t_vb=
    autocmd GUIEnter * set visualbell t_vb=

    " Maximize the window
    au GUIEnter * simalt ~x

    " Set the font based on OS
    if has("gui_macvim")
        set guifont=Menlo\ Regular:h14
    elseif has("gui_win32")
        set guifont=Consolas:h14
    endif

    " Dark background
    highlight Normal guibg=#222222 guifg=White
    colorscheme xoria256
else
    " Settings for non-windowed mode
    " ==============================

    colorscheme desert
endif

"call pathogen#infect()              " Init pathogen
syntax on                           " enable syntax highlighting

let NERDTreeShowHidden=1
map <C-n> :NERDTreeToggle<CR>
