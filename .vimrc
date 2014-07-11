" Show line numbers
set nocompatible                    " full vim
set encoding=utf8                   " utf8 default encoding
set number                          " Show line numbers
set ruler                           " Show current position

" Tabs to spaces
set expandtab
set tabstop=4
set shiftwidth=4
set sts=4

set backspace=indent,eol,start      " Allow backspace at the start of insert mode
set autoindent                      " Auto indent lines

inoremap <C-k> <Esc>                " CTRL+K to escape
nnoremap ;; A;<Esc>                 " ;; to add a semicolon to the end of the line

" Use ~/.vim instead of ~/vimfiles on Windows
" Makes it easier to sync settings across machines
if has('win32') || has('win64')
    set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif

set directory=.,$TEMP

" Configure GUI settings
if has("gui_running")
    " Settings for windowed mode
    " ==========================

    " Maximize the window
    au GUIEnter * simalt ~x

    " Set the font based on OS
    if has("gui_macvim")
        set guifont=Menlo\ Regular:h14
    elseif has("gui_win32")
        set guifont=Consolas:h14
    endif

    " Dark background
    :highlight Normal guibg=gray22 guifg=White
else
    " Settings for non-windowed mode
    " ==============================

endif

call pathogen#infect()              " Init pathogen
syntax on                           " enable syntax highlighting

map <C-n> :NERDTreeToggle<CR>

" $VIMRUNTIME/rgb.txt
