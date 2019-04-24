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
