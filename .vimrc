"Configuration file for vim
set modelines=0		" CVE-2007-2438

syntax enable
"开启语法高亮功能
syntax on
set background=dark
colorscheme solarized


"设置按esc中文切换到英文输入法
set noimdisable
autocmd! InsertLeave * set imdisable|set iminsert=0
autocmd! InsertEnter * set noimdisable|set iminsert=0

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
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
filetype plugin indent on    " 启用自动补全


hi Comment ctermfg=6

"****************************************************************
"                     vundle配置
"****************************************************************
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'bling/vim-airline'
Bundle 'scrooloose/nerdtree'
Bundle 'fatih/vim-go'
Bundle 'Valloric/YouCompleteMe'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
Bundle 'majutsushi/tagbar'
Bundle 'mattn/emmet-vim'
Bundle 'klen/python-mode'
Bundle 'bbye'
Bundle 'kien/ctrlp.vim'
Bundle 'danro/rename.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'pbrisbin/vim-mkdir'
Bundle 'jiangmiao/auto-pairs'
Bundle 'nathanaelkane/vim-indent-guides'

"****************************************************************
"airline配置开始
"****************************************************************
set laststatus=2
" 使用powerline打过补丁的字体
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_theme = 'durant'
let g:airline_symbols.space = "\ua0"
let g:airline_exclude_filename = []
let g:Powerline_symbols='fancy'
set t_Co=256
let Powerline_symbols='fancy'
let g:bufferline_echo=0
" 开启tabline
let g:airline#extensions#tabline#enabled = 1
" tabline中当前buffer两端的分隔字符
let g:airline#extensions#tabline#left_sep = ' '
" tabline中未激活buffer两端的分隔字符
let g:airline#extensions#tabline#left_alt_sep = '|'
" tabline中buffer显示编号
let g:airline#extensions#tabline#buffer_nr_show = 1
" 映射切换buffer的键位
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>
"airline配置结束

"***************************************************************
"          NERDTree配置
"***************************************************************
"设置vim启动默认自动开启NERDTree，并且光标在编辑框
autocmd VimEnter * NERDTree
wincmd w
autocmd VimEnter * wincmd w

"当退出时，如果编辑区是空的时候，退出整个vim
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
nnoremap <silent> fl :NERDTree<CR>
"显示增强
"let NERDChristmasTree=1
"自动调整焦点
"let NERDTreeAutoCenter=1
"鼠标模式:目录单击,文件双击
"let NERDTreeMouseMode=2
"高亮显示当前文件或目录
"let NERDTreeHightCursorline=1
" 设置NERDTree子窗口宽度
let NERDTreeWinSize=32
" 设置NERDTree子窗口位置
let NERDTreeWinPos="left"
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1
"NERDTree插件配置结束

"****************************************************************
" YCM settings
"****************************************************************
let g:ycm_key_list_select_completion = ['', '']
let g:ycm_key_list_previous_completion = ['', '']
let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_use_ultisnips_completer = 1

"****************************************************************
" UltiSnips settings
"****************************************************************
let g:UltiSnipsSnippetDirectories=['UltiSnips']
let g:UltiSnipsSnippetsDir = '~/.vim/bundle/vim-snippets/UltiSnips'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsUsePythonVersion = 2

"****************************************************************
"                Tagbar配置
"****************************************************************
"nmap <Leader>tb :TagbarToggle<CR>		"快捷键设置
let g:tagbar_ctags_bin='ctags'			"ctags程序的路径
let g:tagbar_width=30					"窗口宽度的设置

"go tagbar
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }

"****************************************************************
"               emmet-vim配置
"****************************************************************
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

"****************************************************************
" Bbye设置
"****************************************************************
" 由于原生的:bd在删除当前buffer时会将整个窗口关闭，故使用Bbye的:Bd
nnoremap bd :Bd<CR>

"****************************************************************
"               vim-indent-guides配置
"****************************************************************
" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
:nmap <silent> <Leader>i <Plug>IndentGuidesToggle"

"****************************************************************
"               javacomplete配置
"****************************************************************

set ambiwidth=double
