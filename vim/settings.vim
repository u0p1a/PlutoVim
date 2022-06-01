" 不与 vi 兼容
set nocompatible
" 支持鼠标
set mouse=a
" 设置编码
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
" 自动切换工作目录
set autochdir
" 出错配置
set visualbell
set noerrorbells
" 剪切板同步
set clipboard=unnamed,unnamedplus
" 记录历史操作
set history=1000
" 修改提示自动载入
set autoread
" 不创建备份文件
set nobackup
set nowritebackup
"  set backupdir=~/.vim/.backup/
" 不创建交换文件
set noswapfile
"  set directory=~/.vim/.swp/
" 保留历史记录文件
set undofile
set undodir=~/.vim/.undo/ 

"" 显示设置
" 允许未保存跳转
set hidden
" 显示状态栏
set ruler
" 显示当前模式
set showmode
" 显示输入指令
set showcmd
set termguicolors
" 语法高亮
syntax on
" 设置行宽
" set textwidth = 80
" 自动折叠行
set linebreak
" set wrap
" 显示绝对行号
" set number
" 显示相对行号
" set relativenumber
" 突出显示当前行
set cursorline
" 插入模式绝对行号, 普通模式相对行号
autocmd InsertEnter * :set norelativenumber number
autocmd InsertLeave * :set relativenumber

"" 搜索配置
" 显示括号匹配
set showmatch
" 高亮搜索结果
set hlsearch
" 自动自配搜索字符
set incsearch
" 自动忽略大小写
set ignorecase
set smartcase
" 从头搜索
set wrapscan

"" 空格功能
" 显示行空格
" set listchars=tab:»■,trail:■
" set list
" Tab 键格数
set tabstop=4
" 将 Tab 键转为空格
" set expandtab
" " 缩进格数 (<<, >>)
set shiftwidth=4
" 自动缩进
set autoindent
set smartindent
" 开启文件类型缩进 (~/.vim/indent/xxx.vim)
filetype plugin indent on
autocmd FileType php setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType ruby setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType php setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
autocmd FileType coffee,javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
autocmd FileType html,htmldjango,xhtml,haml setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=0
autocmd FileType sass,scss,css setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120

"" 折叠功能
set foldenable
set foldmethod=indent
set foldlevel=100

"" 拼写检查
set spell spelllang=en_us,cjk

"" 时间配置
" set notimeout
set timeoutlen=1000
" 写入交换文件延迟
set updatetime=100

"" 补全功能
" 命令补全
set wildmenu
" set wildmode=longest:list,full

"" 其他功能
set shortmess+=c
set signcolumn=yes

"" Neovide 支持
if has("gui_running")
    set guifont=DroidSansMono\ Nerd\ Font:h19
endif
