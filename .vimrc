"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vimrc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" auto-install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.vim/autoload/plugged')

" Better Syntax Support
Plug 'sheerun/vim-polyglot'

" Utilities
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'

" Theme
Plug 'tomasr/molokai'
Plug 'itchyny/lightline.vim'

" Which key
" Plug 'liuchengxu/vim-which-key'

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plug 'junegunn/fzf.vim'

call plug#end()

" auto source when writing to init.vm alternatively you can run :source $MYVIMRC
au! BufWritePost $MYVIMRC source %

" removing whitespaces
fun! TrimWhitespaces()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

augroup UTILS
  autocmd!
  autocmd BufWritePre * :call TrimWhitespaces()
augroup END


" folding:
augroup REMEMBER_FOLDS
  autocmd!
  " autocmd BufWritePre * mkview
  autocmd BufWinEnter * silent! loadview
augroup END
set foldmethod=marker

" some bashrc stuff
" export   PS1='\[\e[0;1;95m\]\W \[\e[0;1;94m\]$\[\e[0m\] '
" xset r rate 300 50
" setxkbmap -layout fr -option ctrl:nocaps
