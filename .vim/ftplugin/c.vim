" Formatting code command
nnoremap <buffer> <leader>F :%!clang-format --style=Mozilla<cr>

" snippets{{{
" loops:
" inoremap ,if<tab> if<Space>()<Space>{<CR>/*<space>do<space>*/<CR>}<Esc>kk0f)i
" inoremap ,while<tab> while<Space>()<Space>{<CR>/*<space>do<space>*/<CR>}<Esc>kk0f)i
" inoremap ,for<tab> for<Space>(;<Space>stop;<Space>inc)<Space>{<CR><++><CR>}<++><Esc>kk0f;i
" " main:
" " inoremap ,mn<tab> int<Space>main<Space>(int<Space>argc,<Space>char**<Space>argv)<Enter>{<Enter>I;<Enter>return<Space>0;<Enter>}<Esc>?I<Enter>C
" " libs:
" " inoremap ,io<tab> #include<Space><stdio.h><Enter>
" " inoremap ,std<tab> #include<Space><stdlib.h><Enter>
" " inoremap ,str<tab> #include<Space><string.h><Enter>
" inoremap ,icl<tab> #include<Space><><Enter><++><Esc>k0/<<Enter>a
" inoremap ,ics<tab> #include<Space>""<Enter><++><Esc>k0/"<Enter>a
" " Structures and unions:
" inoremap ,struct<tab> struct<Space>{<CR><++><CR>};<Esc>kk0f{i
" inoremap ,uni<tab> union<Space>{<CR><++><CR>};<Esc>kk0f{i
" " printf and scanf:
" inoremap ,pf<tab> printf("\n");<Esc>0f"a
" inoremap ,sf<tab> scanf("");<Esc>0f"a
" " stdlib function :
" inoremap ,x<tab> exit(0);}}}
