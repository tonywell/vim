"Configuration file for vim
set modelines=0		" CVE-2007-2438
set nocompatible "非兼容vi模式
syntax enable
"开启语法高亮功能
syntax on

" install Vundle bundles
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

filetype plugin indent on

set background=dark
colorscheme solarized


"设置按esc中文切换到英文输入法
set noimdisable
autocmd! InsertLeave * set imdisable|set iminsert=0
autocmd! InsertEnter * set noimdisable|set iminsert=0

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set backspace=2		" more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup

autocmd InsertLeave * se nocul
autocmd InsertEnter * se cul
" 用浅色高亮当前行

nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv

" 取消备份。 视情况自己改
set nobackup
" 关闭交换文件
set noswapfile

set smartindent
" 智能对齐

set autoindent
" 自动对齐

set confirm
" 在处理未保存或只读文件的时候，弹出确认

"设置在vim中可以使用鼠标
set mouse=a

set tabstop=4
" Tab键的宽度

set softtabstop=4
set shiftwidth=4
"  统一缩进为4

set noexpandtab
" 不要用空格代替制表符

set number
" 显示行号

set history=50
" 历史纪录数

set hlsearch
set incsearch
" 搜索逐字符高亮

set gdefault
" 行内替换

"set encoding=utf-8
set fileencodings=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936,utf-16,big5,euc-jp,latin1
" 编码设置

colorscheme solarized
" 设置颜色主题

"set guifont=Courier\ New:h14
set guifont=Anonymous\ Pro\ for\ Powerline:h14
" 设置字体

set langmenu=zn_CN.UTF-8
set helplang=cn
" 语言设置

set cmdheight=2
" 命令行（在状态行）的高度，默认为1,这里是2

set ruler
" 在编辑过程中，在右下角显示光标位置的状态行

set laststatus=2
" 总是显示状态行

set showcmd
" 在状态行显示目前所执行的命令，未完成的指令片段亦会显示出来

set scrolloff=3
" 光标移动到buffer的顶部和底部时保持3行距离

set showmatch
" 高亮显示对应的括号

set matchtime=5
" 对应括号高亮的时间（单位是十分之一秒）

set autowrite
" 在切换buffer时自动保存当前文件

set wildmenu
" 增强模式中的命令行自动完成操作

set linespace=2
" 字符间插入的像素行数目

set cursorline
set cursorcolumn

set whichwrap=b,s,<,>,[,]
" 开启Normal或Visual模式下Backspace键，空格键，左方向键，右方向键，Insert或replace模式下左方向键，右方向键跳行的功能


"if has("gui_macvim")
"  set guifont=苹方-简:h12
  " Don't beep

"set visualbell
"endif

" 基于缩进或语法进行代码折叠
"set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable

let mapleader=","
" 注释开关

"检测文件类型
filetype on
"针对不同的文件采取不同的缩进方式
filetype indent on
filetype plugin on           " 针对不同的文件类型加载对应的插件

"防止特殊符号无法正常显示
set ambiwidth=double
