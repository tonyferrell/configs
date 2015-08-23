set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Set the font based on OS
if has("gui_win32")
    set guifont=Consolas:h13
endif

" Dark background
highlight Normal guibg=#222222 guifg=White
colorscheme xoria256

" Show trailing spaces
set list listchars=tab:→\ ,trail:·

function! ToggleGUICruft()
  if &guioptions=='r'
    exec('set guioptions=imTrL')
  else
    exec('set guioptions=r')
  endif
endfunction

map <F11> <Esc>:call ToggleGUICruft()<cr>

" by default, hide gui menus
set guioptions=r
