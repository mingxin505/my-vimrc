# my-vimrc
我的.vimrc文件
# 修改之后重新加载
: so $MYVIMRC

# vundle 
vundle#begin()/end()对只能出现一次.  
那我的多个组件文件如何就只能放配置信息.  
plugin XX这行放一起了.  
我不想这样做.  
解决之道是把Plugin 和配置分开.分别:source

# vimrc 
是各个平台的.vimrc文件,需要修改文件里的路径才能使用

# PlugIn
## ctrlp
用于模糊搜索文件.  
## endwise
用于补全{},[],end
## ycm
用于语法高亮和语法检测
## coffee
用于coffeescript语言
## nerdtree
用于目录查看.
## status
用于显示状态栏
## tagbar
用于关键字提取与显示.需要ctags协助.
## emmet
用于HTML自动生成代码.
## ruby-vim
编译与编写ruby
## rails-vim
在ror项目间跳转.
## ale
语法检测插件
