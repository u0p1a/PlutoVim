"" colortheme
colorscheme codedark

"" easy-motion
let g:EasyMotion_leader_key = '<Leader>'

"" coc.nvim
let g:coc_global_extensions = ['coc-json', 'coc-vimlsp']
" 使用tab键选择补全项
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" 使用回车选中项
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" 使用<ctrl-space>调出补全
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
" 错误导航
nmap <silent> <Leader>- <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>=> <Plug>(coc-diagnostic-next)
" 函数导航
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" 显示文档
nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
" 自动高亮相同选中
autocmd CursorHold * silent call CocActionAsync('highlight')
" 格式化代码
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
command! -nargs=0 Prettier :CocCommand prettier.formatFile
noremap <Leader>f :Prettier<CR>
