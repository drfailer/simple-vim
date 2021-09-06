"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"        ██╗   ██╗██╗███╗   ███╗      ██████╗ ██╗     ██╗   ██╗ ██████╗       "
"        ██║   ██║██║████╗ ████║      ██╔══██╗██║     ██║   ██║██╔════╝       "
"        ██║   ██║██║██╔████╔██║█████╗██████╔╝██║     ██║   ██║██║  ███╗      "
"        ╚██╗ ██╔╝██║██║╚██╔╝██║╚════╝██╔═══╝ ██║     ██║   ██║██║   ██║      "
"         ╚████╔╝ ██║██║ ╚═╝ ██║      ██║     ███████╗╚██████╔╝╚██████╔╝      "
"          ╚═══╝  ╚═╝╚═╝     ╚═╝      ╚═╝     ╚══════╝ ╚═════╝  ╚═════╝       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" auto-install vim-plug
if empty(glob('~/.config/nvim-plug/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.config/nvim-plug/autoload/plugged')

" Better Syntax Support
Plug 'sheerun/vim-polyglot'
" Auto pairs for '(' '[' '{'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
" Theme
Plug 'gruvbox-community/gruvbox'
" which key
Plug 'liuchengxu/vim-which-key'
" goyo
Plug 'junegunn/goyo.vim'

call plug#end()
