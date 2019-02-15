set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/vundle'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'Valloric/YouCompleteMe'
Plugin 'hail2u/vim-css3-syntax' " css3 语法高亮
Plugin 'groenewege/vim-less' " less 语法高亮
Plugin 'pangloss/vim-javascript' " js 语法高亮
Plugin 'Raimondi/delimitMate' " 引号/双引号/括号自动补全.shift+tab跳到后面
Plugin 'tpope/vim-endwise' " 在ruby中自动添加end
" 自动补全html/xml标签
Plugin 'docunext/closetag.vim', { 'for': ['html', 'xml'] }
call vundle#end()

" ycm 回车选中
" let g:ycm_key_list_stop_completion = ['<CR>']
" css 自动补全css属性+属性值.2是指缩进设置
let g:ycm_semantic_triggers = {
   \   'css': [ 're!^\s{2}', 're!:\s+' ],
   \ }

" % to bounce from do to end etc.
runtime! macros/matchit.vim

" 高亮js中的css/html
let javascript_enable_domhtmlcss = 1
