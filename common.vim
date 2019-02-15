" 设置语法高亮
syntax on

" 设置色彩方案
colorscheme delek

" 自动缩进
set autoindent
set cindent

" 统一缩进为2
set tabstop=2		
set softtabstop=2	
set shiftwidth=2

" 根据文件类型设置缩进"
if has("autocmd")
  filetype on
  autocmd Filetype c,c++,java  setlocal ts=4 sts=4 sw=4 et
endif
syntax on
set hlsearch
set noexpandtab 
set number
set autoindent 
set cindent

