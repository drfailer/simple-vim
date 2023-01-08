" Formatting code command
nnoremap <buffer> <leader>F :%!clang-format --style=Mozilla<cr>

" snippets
" Loops:
inoremap ,if<tab> if<Space>()<Space>{<CR>/*<space>do<space>*/<CR>}<Esc>kk0f)i
inoremap ,while<tab> while<Space>()<Space>{<CR>/*<space>do<space>*/<CR>}<Esc>kk0f)i
inoremap ,for<tab> for<Space>(;<Space>stop;<Space>inc)<Space>{<CR><++><CR>}<++><Esc>kk0f;i
" main:
inoremap ,mn<tab> int<Space>main<Space>(int<Space>,<Space>char**<Space>)<Enter>{<Enter>I;<Enter>return<Space>0;<Enter>}<Esc>?I<Enter>C
" Libs:
inoremap ,io<tab> #include<Space><iostream><Enter>
inoremap ,str<tab> #include<Space><string><Enter>
inoremap ,icl<tab> #include<Space><><Enter><++><Esc>k0/<<Enter>a
inoremap ,ics<tab> #include<Space>""<Enter><++><Esc>k0/"<Enter>a
" Structures and unions:
inoremap ,struct<tab> struct<Space>{<CR><++><CR>};<Esc>kk0f{i
inoremap ,class<tab> class<Space>{<CR><++><CR>};<Esc>kk0f{i
inoremap ,uni<tab> union<Space>{<CR><++><CR>};<Esc>kk0f{i
" printf and scanf:
inoremap ,coe<tab> std::cout<Space><<<Space>""<Space><<<Space>std::endl;<Esc>F"i
inoremap ,co<tab> std::cout<Space><<<Space>;<Left>
inoremap ,sf<tab> std::cin<Space>>><Space>;<Left>
" stdlib function :
inoremap ,x<tab> exit(0);
