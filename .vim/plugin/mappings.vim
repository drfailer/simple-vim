"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" set leader key
let g:mapleader = "\<Space>"

" Force saving
cmap w!! w !sudo tee %

" Better nav for omnicomplete
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>

" Ib hate escape more than anything else
" inoremap jk <Esc>
inoremap kj <Esc>
inoremap kl <Esc>la

" Easy CAPS
inoremap <c-u> <ESC>viwUea

" navigate threw buffers:
nnoremap <Leader>nb :bnext<CR>
nnoremap <Leader>bp :bprevious<CR>

" navigate threw tabs:
nnoremap <Leader>tn :tabnew<CR>
nnoremap <Leader>nt :tabnext<CR>
nnoremap <Leader>tp :tabprevious<CR>
nnoremap <Leader>tc :tabclose<CR>

" Use control-c instead of escape
nnoremap <C-c> <Esc>

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" moving lines:
nnoremap <up> :move -2<cr>
nnoremap <down> :move +1<cr>

" jump points:
inoremap ,<tab> <Esc>/<++><Enter>"_c4l

" Map replace all :
nnoremap <leader>S :%s//g<Left><Left>
vnoremap <leader>S :s//g<Left><Left>
nnoremap <leader>* :%s/\<<C-r><C-w>\>//g<Left><Left>

" Quickfix list:
nnoremap <leader>qo :copen<CR>
nnoremap <leader>qc :cclose<CR>
nnoremap <C-p> :previous<CR>
nnoremap <C-n> :cnext<CR>

" change dictionary:
map <F6> :setlocal spell! spelllang=fr,cjk<cr>
map <F7> :set spelllang=en,cjk<cr>

" select first correction for the last miss-spelled word:
nnoremap <M-;> <ESC>1z=
nnoremap <left> [s
nnoremap <right> ]s

" Toggle auto comment:
map <leader>/ :setlocal formatoptions-=cro<CR>
map <leader># :setlocal formatoptions=cro<CR>

" explorer:
nnoremap <leader>e :vert split <bar> :Ex<CR>
nnoremap <leader>x :Ex<CR>

" make view:
nnoremap <leader>mkv :mkview<CR>

" terminal mode
tnoremap <C-h> <C-\><C-n>
nnoremap <leader>vt :vertical terminal<CR>

" fugitive
nmap <leader>gj :diffget //3<cr>
nmap <leader>gf :diffget //2<cr>
nmap <leader>gs :G<cr>
nmap <leader>gc :G commit<cr>
nmap <leader>gp :G push<cr>

" FZF
nnoremap <leader>f :Files<cr>
nnoremap <leader>vrc :Files ~/.vim<cr>
nnoremap <leader>fg :Rg<cr>
nnoremap <leader>fb :Buffers<cr>

" Formatting code command
autocmd FileType haskell nnoremap <buffer> <leader>F :%!hindent<cr>
autocmd FileType c nnoremap <buffer> <leader>F :%!clang-format --style=Mozilla<cr>

" Compile command
autocmd FileType haskell nnoremap <buffer> <leader>B :%!runghc %<cr>
autocmd FileType python nnoremap <buffer> <leader>B :%!python3 %<cr>
