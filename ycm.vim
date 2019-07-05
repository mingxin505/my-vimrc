nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gd :YcmCompleter GoToDefinitionElseDeclaration<CR>

let g:ycm_key_list_stop_completion = ['<C-y>'] " ctrl+y关闭候选项
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>'] " 选中第一个并依次向下
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>'] " 依次向上
set completeopt-=preview " 在选中候选项的时候,细节描述不出现在最上


"Do not ask when starting vim
let g:ycm_confirm_extra_conf = 0

let g:syntastic_always_populate_loc_list = 0
map <F9> :call SaveInputData()<CR>
func! SaveInputData()
    exec "tabnew"
    exec 'normal "+gP'
    exec "w! /tmp/input_data"
endfunc
