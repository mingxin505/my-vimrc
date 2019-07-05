" 打开ctrlp搜索
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_map = '<c-p>'
" 相当于mru功能，show recently opened files
map <leader>fp :CtrlPMRU<CR>
"set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux"

" 设置过滤不进行查找的后缀名
let g:ctrlp_custom_ignore = {
	\ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
	\ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz)$',
	\ 
	\ 'link': 'SOME_BAD_SYMBOLIC_LINKS'}
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1
