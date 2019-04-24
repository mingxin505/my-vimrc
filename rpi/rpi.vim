
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
