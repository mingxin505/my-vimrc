filetype off                  " required!
set rtp+=~/.vim/Bundle/Vundle.vim

""""""""""""""""""""""""""""""
" Vundle
""""""""""""""""""""""""""""""

call vundle#begin()
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-rails.git'
call vundle#end()
call vundle#begin()
" let Vundle manage Vundle
" required! 
Plugin 'gmarik/vundle'
" My Plugins here:
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'molokai'
" vim-scripts repos
Plugin 'Valloric/YouCompleteMe'
Plugin 'Valloric/ListToggle'
"Plugin 'scrooloose/syntastic'
Plugin 'L9'
Plugin 'FuzzyFinder'
" non-GitHub repos
Plugin 'wincent/command-t.git'
" Git repos on your local machine (i.e. when working on your own plugin)
" ...
filetype plugin indent on     " required!
call vundle#end()


""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe
" """"""""""""""""""""""""""""""""""""""""
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
" "nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
let g:ycm_global_ycm_extra_conf='.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
" "Do not ask when starting vim
let g:ycm_confirm_extra_conf = 0
""let g:ycm_key_list_stop_completion = ['<TAB>']
let g:syntastic_always_populate_loc_list = 1
map <F9> :call SaveInputData()<CR>
func! SaveInputData()
    exec "tabnew"
    exec 'normal "+gP'
    exec "w! /tmp/input_data"
endfunc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 显示相关  
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set go=             " 不要图形按钮 
autocmd InsertLeave * se nocul  " 用浅色高亮当前行  
autocmd InsertEnter * se cul    " 用浅色高亮当前行  
set showcmd         " 输入的命令显示出来，看的清楚些 
"set novisualbell    " 不要闪烁(不明白)  
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\    "状态行显示的内容  
set statusline+=%{fugitive#statusline()}\  "  Git Hotness
set statusline+=%{strftime(\"%d/%m/%y\ -\ %H:%M\")}\  " show time 
set laststatus=1    " 启动显示状态行(1),总是显示状态行(2)  
set foldenable      " 允许折叠  
set foldmethod=manual   " 手动折叠  
set nocompatible  "去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限
" 显示中文帮助
if version >= 603
    set helplang=cn
    set encoding=utf-8
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:insert_gates()
    let gatename = substitute(toupper(expand("%:t")), "\\.", "_", "g")
    call setline(1, "/*************************************************************************") 
    call append(line("."), "    > File Name: ".expand("%")) 
    call append(line(".")+1, "  > Author: wangZhanDuo") 
    call append(line(".")+2, "  > Mail:wangzhanduo@offcn.com ") 
    call append(line(".")+3, "  > Created Time: ".strftime("%c")) 
    call append(line(".")+4, " ************************************************************************/") 
    call append(line(".")+5, "")
    execute "normal! Go__"
    execute "normal! Gi#ifndef __" .gatename
    execute "normal! Go__"
    execute "normal! Gi#define __" .gatename
    execute "normal! Go"
    execute "normal! Go"
    execute "normal! Go#endif"
    normal! kk
endfunction
autocmd BufNewFile *.{h,hpp,H} call <SID>insert_gates()

"新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.[cr],*.sh,*.java,*.lua exec ":call SetTitle_()" 
""定义函数SetTitle_，自动插入文件头 
func! SetTitle_() 
    "如果文件类型为.sh文件 
    if &filetype == 'sh' 
        call setline(1,"\#########################################################################") 
        call append(line("."), "\# File Name: ".expand("%")) 
        call append(line(".")+1, "\# Author: wzd") 
        call append(line(".")+2, "\# mail: wangwei1543@gmail.com") 
        call append(line(".")+3, "\# Created Time: ".strftime("%c")) 
        call append(line(".")+4, "\#########################################################################") 
        call append(line(".")+5, "\#!/bin/bash") 
        call append(line(".")+6, "") 
    else 
        call setline(1, "/*************************************************************************") 
        call append(line("."), "    > File Name: ".expand("%")) 
        call append(line(".")+1, "  > Author: wzd") 
        call append(line(".")+2, "  > Mail:wangZhanDuo@offcn.com ") 
        call append(line(".")+3, "  > Created Time: ".strftime("%c")) 
        call append(line(".")+4, " ************************************************************************/") 
        call append(line(".")+5, "")
    endif
    if &filetype == 'cpp'
        call append(line(".")+6, "#include <iostream>")
        call append(line(".")+7, "using namespace std;")
        call append(line(".")+8, "")
    endif
    if &filetype == 'c'
        call append(line(".")+6, "#include <stdio.h>")
        call append(line(".")+7, "")
    endif
    if &filetype == 'lua'

	endif 
	if &filetype == 'java'
        call append(line(".")+6,"public class ".expand("%"))
        call append(line(".")+7,"")
    endif
    "新建文件后，自动定位到文件末尾
    autocmd BufNewFile * normal G
endfunc 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"键盘命令
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>w :w!<cr>
nmap <leader>f :find<cr>
" 映射全选+复制 ctrl+a
map <C-A> ggVGY
map! <C-A> <Esc>ggVGY
map <F12> gg=G
" 选中状态下 Ctrl+c 复制
vmap <C-c> "+y
"去空行  
nnoremap <F2> :g/^\s*$/d<CR> 
"比较文件  
nnoremap <C-F2> :vert diffsplit 
"新建标签  
map <M-F2> :tabnew<CR>  
"列出当前目录文件  
map <F3> :tabnew .<CR>  
"打开树状文件目录  
map <C-F3> \be  
"C，C++ 按F7编译运行
map <F7> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'java' 
        exec "!javac %" 
        exec "!java %<"
    elseif &filetype == 'sh'
        :!./%
    elseif &filetype == 'py'
        exec "!python %"
        exec "!python %<"
    endif
endfunc
"C,C++的调试
map <F5> :call Rungdb()<CR>
func! Rungdb()
    exec "w"
    exec "!g++ % -g -o %<"
    exec "!gdb ./%<"
endfunc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""实用设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoread " 设置当文件被改动时自动载入
" quickfix模式
autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>
"代码补全 
set completeopt=preview,menu 
"允许插件  
filetype plugin on
"共享剪贴板  
set clipboard+=unnamed 

set nobackup				"从不备份  
:set makeprg=g++\ -Wall\ \ % "make 运行


set ruler                   " 打开状态栏标尺
set cursorline              " 突出显示当前行
set magic                   " 设置魔术
set guioptions-=T           " 隐藏工具栏
set guioptions-=m           " 隐藏菜单栏
"set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\
" 设置在状态行显示的信息
set foldcolumn=0
set foldmethod=indent 
set foldlevel=3 
set foldenable              " 开始折叠
" 去掉输入错误的提示声音
set noeb
" 在处理未保存或只读文件的时候，弹出确认
set confirm

"set noexpandtab	" 不要用空格代替制表符
set smarttab		" 在行和段开始处使用制表符
set number			" 显示行号
set history=1000	" 历史记录数
set ignorecase		"搜索忽略大小写


"行内替换
set gdefault
"编码设置
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
"语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn
" 我的状态行显示的内容（包括文件类型和解码）
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
"set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
" 总是显示状态行
set laststatus=2
" 命令行（在状态行下）的高度，默认为1，这里是2
set cmdheight=2
" 侦测文件类型
filetype on
" 载入文件类型插件
filetype plugin on
" 为特定文件类型载入相关缩进文件
filetype indent on
" 保存全局变量
set viminfo+=!
" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-
" 字符间插入的像素行数目
set linespace=0
" 增强模式中的命令行自动完成操作
set wildmenu
" 使回格键（backspace）正常处理indent, eol, start等
set backspace=2
" 允许backspace和光标键跨越行边界
set whichwrap+=<,>,h,l
" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
"""""""""""""""""""??????????????
"set mouse=a
"set selection=exclusive
"set selectmode=mouse,key
"""""""""""""""""""??????????????
" 通过使用: commands命令，告诉我们文件的哪一行被改变过
set report=0
" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\
" 高亮显示匹配的括号
set showmatch
" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=1
" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3
" 为C程序提供自动缩进
set smartindent
" 高亮显示普通txt文件（需要txt.vim脚本）
au BufRead,BufNewFile *  setfiletype txt
"自动补全
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
":inoremap { {<CR>}<ESC>O
":inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endfunction
filetype plugin indent on 
"打开文件类型检测, 加了这句才可以用智能补全
set completeopt=longest,menu
"""""""""""""""""""""""""""""""""""""""""""""""

