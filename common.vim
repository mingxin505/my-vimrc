" 设置语法高亮
syntax on
syntax enable

filetype off 			" 关闭文件类型检测,在bundle#end之后由filetype plugin indent on 重新打开.
colorscheme delek " 设置色彩方案
set nocompatible  "去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限

" 自动缩进
set autoindent
set cindent
set paste
" 统一缩进为2
set tabstop=2		
set softtabstop=2	
set shiftwidth=2

" 根据文件类型设置缩进"
if has("autocmd")
  filetype on
  autocmd Filetype c,c++,java  setlocal ts=4 sts=4 sw=4 et
endif

set noexpandtab 
set number
set autoindent 
set cindent


"禁止生成临时文件
set nobackup
set noswapfile

set autowrite               " 自动保存

"搜索逐字符高亮
set hlsearch
set incsearch
