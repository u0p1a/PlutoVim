""""""""""""""""""""
" 说明: Vim 通用配置
" 原则：<leader> 前缀用于当前文件范围, <space>前缀用于视图范围
""""""""""""""""""""

""""""""""""""""""""
" 基础功能
""""""""""""""""""""
" 退出插入模式
inoremap jj <Esc>

""""""""""""""""""""
" 文件功能
""""""""""""""""""""
" 新建文件
nnoremap <C-n> :enew<cr>
 " 保存本文件
nnoremap <leader>w :w<cr>
nnoremap <C-s> :w<cr>
inoremap <C-s> <esc>:w<cr>
" 保存全部文件
nnoremap <space>w :wa<cr>
vnoremap <space>w <esc>:wa<cr>
" 强制保存本文件 (sudo)
cmap w!! w !sudo tee % > /dev/null <cr>
" 另存为新文件
nnoremap '<C-S-s>' :saveas <C-r>=fnamemodify('.',':p')<cr>
" 退出本文件
nnoremap <leader>q :q<cr>
vnoremap <leader>q :q<cr>
nnoremap <leader>Q :q!<cr>
vnoremap <leader>Q :q!<cr>
" 退出全部文件
nnoremap <space>q :qa<cr>
nnoremap <space>Q :wa<cr>:q<cr>


""" 窗口功能 """
" 窗口焦点切换
nnoremap <C-j> <C-w>j
vnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
vnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
vnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
vnoremap <C-l> <C-w>l
" 垂直分屏 
nnoremap <space>pv :vsplit<cr>
nnoremap <space>p\ :vsplit<cr>
" 水平分屏 
nnoremap <space>ph :split<cr>
nnoremap <space>p- :split<cr>
" 关闭当前分屏
nnoremap <space>pc <C-w>c
nnoremap <space>px <C-w>c
" 关闭其他分屏
nnoremap <space>po <C-w>o
nnoremap <space>pX <C-w>o
" 重置分屏尺寸
nnoremap <space>p= <C-w>=
" 调整分屏尺寸
nnoremap <M-u> <C-w>+
nnoremap <M-i> <C-w>-
nnoremap <M-y> <C-w><
nnoremap <M-o> <C-w>>
vnoremap <M-u> <C-w>+
vnoremap <M-i> <C-w>-
vnoremap <M-y> <C-w><
vnoremap <M-o> <C-w>>
nnoremap <space>pi :resize -3<cr>
nnoremap <space>pu :resize +3<cr>
nnoremap <space>py :vertical resize -3<cr>
nnoremap <space>po :vertical resize +3<cr>

""" 标签功能 """
noremap <C-Tab> <C-W>w 
inoremap <C-Tab> <C-O><C-W>w 
cnoremap <C-Tab> <C-C><C-W>w 
onoremap <C-Tab> <C-C><C-W>w 

""" 浏览功能 """
" 普通模式光标移动
nnoremap j gj
nnoremap k gk
nnoremap H ^
nnoremap L $
" nnoremap <C-a> I
" nnoremap <C-e> A
" 可视模式光标移动
vnoremap j gj
vnoremap k gk
vnoremap H ^
vnoremap L $
" 可视模式光标移动
vnoremap j gj
vnoremap k gk
" 插入模式光标移动
inoremap <C-h> <left>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-l> <right>
inoremap <c-a> <esc>I
inoremap <c-e> <esc>A
" 命令模式光标跳转
cnoremap <C-h> <left>
cnoremap <C-j> <down>
cnoremap <C-k> <up>
cnoremap <C-l> <right>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>


""" 编辑功能 """
" 撤销功能
noremap <C-z> u
noremap <C-S-z> <C-r>
nnoremap U <C-r>
" 复制功能
vmap y ygv<Esc>
nnoremap Y y$
xnoremap p pgvy
nnoremap <C-c> yy
vnoremap <C-c> "+y
noremap <D-s>  :w<CR>
noremap <D-c>  y
noremap <D-v>  hp
" 粘贴功能
nnoremap <C-v> p
cnoremap <C-v> <C-R>+
nnoremap P :put =@+<cr>
" 删除功能
vnoremap <BS> d
"" 剪切功能
" 整行剪切
nnoremap x "_x
nnoremap X "_X
nnoremap <leader>X X
nnoremap <leader>x x
nnoremap <C-x> dd
inoremap <C-x> <Esc>ddi
" 整行移动
" nnoremap J :m .+1<cr>==
" nnoremap K :m .-1<cr>==
vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv
noremap <c-s-up> ddkP 
noremap <c-s-down> ddp
" 添加新行
nnoremap <C-cr> o
vnoremap <C-cr> o
inoremap <C-cr> <esc>o

"" 全选功能
nnoremap <C-A> gggH<C-O>G
inoremap <C-A> <esc>gggH<C-O>G

"" 标记功能
nnoremap ' `
nnoremap ` '

"" 搜索功能
" 取消高亮
nnoremap <silent> <bs> :nohlsearch<cr>
nnoremap <silent> <esc> :nohlsearch<cr>

"" 缩进功能
" Tab 缩进 
" nnoremap <tab> V>
" nnoremap <s-tab> V<
" vnoremap <tab> >gv
" vnoremap <s-tab> <gv
" > < 缩进
nnoremap < <gv
nnoremap > >gv
vnoremap < <gv
vnoremap > >gv

"" 折叠功能
nnoremap z0 :set foldlevel=0<cr>
nnoremap z1 :set foldlevel=1<cr>
nnoremap z2 :set foldlevel=2<cr>
nnoremap z3 :set foldlevel=3<cr>
nnoremap z4 :set foldlevel=4<cr>
nnoremap z5 :set foldlevel=5<cr>

" 行尾添加分号
nnoremap <leader>; $a;<esc> 

"" 终端功能
" 终端普通模式
tnoremap <esc> <c-\><c-n>
tnoremap jj <c-\><c-n>
" 调整分屏
noremap <M-u> <C-\><C-n><C-w>+
noremap <M-i> <C-\><C-n><C-w>-
" 切换焦点
tnoremap <C-h> <C-\><C-n><C-W>h
tnoremap <C-j> <C-\><C-n><C-W>j
tnoremap <C-k> <C-\><C-n><C-W>k
"  tnoremap <C-l> <C-\><C-n><C-W>l

" 历史记录
cnoremap <M-p> <up>
cnoremap <M-n> <down>

" 是否显示空白字符
noremap <F7> :set list!<cr>
inoremap <F7> <C-o>:set list!<cr>
cnoremap <F7> <C-c>:set list!<cr>

" 是否进行拼写检查
noremap <F8> :set spell!<cr>
