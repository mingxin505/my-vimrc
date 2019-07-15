" 设置语法高亮
syntax on
syntax enable

filetype off 			" 关闭文件类型检测,在bundle#end之后由filetype plugin indent on 重新打开.
colorscheme delek " 设置色彩方案
set nocompatible  "去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限

" 自动缩进
set autoindent
set cindent
set noexpandtab 
set number

" 统一缩进为2
set tabstop=2		
set softtabstop=2	
set shiftwidth=2

"indent:	如果用了:set indent,:set ai 等自动缩进，
"					想用退格键将字段缩进的删掉，必须设置这个选项。
"					否则不响应。
"eol:			如果插入模式下在行开头，想通过退格键合并两行，需要设置eol。
"start：	要想删除此次插入前的输入，需设置这个。
set backspace=indent,eol,start

"禁止生成临时文件
set nobackup
set noswapfile

set autowrite               " 自动保存

"搜索逐字符高亮
set hlsearch
set incsearch


" 根据文件类型设置缩进"
if has("autocmd")
  filetype on
  autocmd Filetype c,c++,java  setlocal ts=4 sts=4 sw=4 et
endif

" auto complete 
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {<CR>}<Esc>O
autocmd Syntax html,vim inoremap < <lt>><Esc>i| inoremap > <c-r>=ClosePair('>')<CR>
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap } <c-r>=CloseBracket()<CR>
inoremap " <c-r>=QuoteDelim('"')<CR>
inoremap ' <c-r>=QuoteDelim("'")<CR>

function ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
	return "\<Right>"
	else
	return a:char
	endif
endf

function CloseBracket()
	if match(getline(line('.') + 1), '\s*}') < 0
	return "\<CR>}"
	else
	return "\<Esc>j0f}a"
	endif
endf

function QuoteDelim(char)
	let line = getline('.')
	let col = col('.')
	if line[col - 2] == "\\"
	return a:char
	elseif line[col - 1] == a:char
	return "\<Right>"
	else
	return a:char.a:char."\<Esc>i"
	endif
endf
