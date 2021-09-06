autocmd FileType C inoremap <buffer> ,io #include<space>\<stdio.h\>
autocmd FileType C inoremap <buffer> ,lb #include<space>\<stdlib.h\>
autocmd FileType C inoremap <buffer> ,ij [i][j]
autocmd FileType C inoremap <buffer> ,main int main(int<space>argc,<space>char<space>**<space>argv)<space>{<cr>return<space>0;<esc>O}
