set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\    "状态行显示的内容
set statusline+=%{fugitive#statusline()}\  "  Git Hotness
set statusline+=%{strftime(\"%d/%m/%y\ -\ %H:%M\")}\  " show time
set laststatus=2    " 启动显示状态行(1),总是显示状态行(2)
