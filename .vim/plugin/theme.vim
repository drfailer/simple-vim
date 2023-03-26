"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" theme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" tmux fix
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" colorscheme
set termguicolors
let g:gruvbox_italicize_strings=1
let g:gruvbox_italic=1
let g:gruvbox_improved_warnings=1
let g:gruvbox_contrast_dark="soft"
colorscheme gruvbox
set bg=dark

set laststatus=2
set noshowmode
let g:lightline = {
        \ 'colorscheme': 'gruvbox',
        \}
