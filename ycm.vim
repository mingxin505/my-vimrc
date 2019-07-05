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

" from https://stackoverflow.com/questions/24500281/youcompleteme-and-syntastic-compatibility
" 没理解具体作用.
let g:ycm_register_as_syntastic_checker = 1 "default 1
let g:Show_diagnostics_ui = 1 "default 1

"will put icons in Vim's gutter on lines that have a diagnostic set.
"Turning this off will also turn off the YcmErrorLine and YcmWarningLine
"highlighting
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_always_populate_location_list = 1 "default 0
let g:ycm_open_loclist_on_ycm_diags = 1 "default 1


let g:ycm_complete_in_strings = 1 "default 1
let g:ycm_collect_identifiers_from_tags_files = 0 "default 0
let g:ycm_path_to_python_interpreter = '' "default ''


let g:ycm_server_use_vim_stdout = 0 "default 0 (logging to console)
let g:ycm_server_log_level = 'info' "default info


let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'  "where to search for .ycm_extra_conf.py if not found
let g:ycm_confirm_extra_conf = 1


let g:ycm_goto_buffer_command = 'same-buffer' "[ 'same-buffer', 'horizontal-split', 'vertical-split', 'new-tab' ]
let g:ycm_filetype_whitelist = { '*': 1 }
let g:ycm_key_invoke_completion = '<C-Space>'


nnoremap <F11> :YcmForceCompileAndDiagnostics <CR>

