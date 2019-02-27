set sw=1
set nocompatible "与vi不一致
let autosave=1
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/ "载入特定目录插件
"set rtp+=$HOME/.vim/bundle/vundle/ "Windows下
call vundle#rc()
"plugin 
"vimscripts账号下的项目直接填写名称即可
Bundle 'snipMate'
"其它需填写用户/资源名称
Bundle 'gmarik/vundle'
"非github上资源
Bundle 'git://git.wincent.com/command-t.git'
"indent
Bundle 'php.vim-html-enhanced'
"color
Bundle 'Lucius'
Plugin 'tpope/vim-rails'
Plugin 'vim-scripts/kkruby.vim'
filetype plugin indent on  

