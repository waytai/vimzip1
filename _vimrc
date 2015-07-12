set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

"��ɫ����"
syntax enable
set background=dark
""colorscheme solarized
colorscheme desert
"
"
"���ñ����Զ�ʶ��
set fileencodings=utf-8,gbk,chinese,latin-1

set ambiwidth=double
set shortmess=atI "����ҳ�治��ʾԮ���ڸɴ��ͯ
set ruler "��ʾ���
"���ñ���
"set termencoding=utf-8
"set encoding=utf-8

"�����˸��ɾ����tab����
set smartindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set backspace=2
set textwidth=79

"����������ʾ����
set showcmd
set magic "����ħ��

"�������
set mouse=a
"��ʾ�к�
set nu

"����������
set showmatch

inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap " ""<ESC>i
inoremap { {}<ESC>i
inoremap < <><ESC>i

"�����۵�
set foldenable
"set foldmethod=indent
"�۵�����
"manual �ֹ��۵�
"indent ʹ��������ʾ�۵�
"expr   ʹ�ñ��ʽ�����۵�
"syntax ʹ���﷨�����۵�
"diff   ��û�и������ı������۵�
"marker ʹ�ñ�ǽ����۵�,Ĭ�ϱ����{{{��}}}

set wrapscan
set foldmethod=manual 
"���Դ�Сд
set wildignorecase

"�Զ���ȫ
filetype plugin indent on
set completeopt=longest,menu
"�����ļ����;�������
"filetype indent on
autocmd  filetype make set noexpandtab

"set laststatus=2 "������ʾ״̬��


"�Զ���ȫ����ʱ��ʹ�òö�ʽƥ���б�
autocmd FileType python set omnifunc=pythoncomplete
autocmd FileType javascript set omnifunc=javascriptcomplete
autocmd FileType html set omnifunc=htmlcomplete
autocmd FileType css set omnifunc=csscomplete
autocmd FileType xml set omnifunc=xmlcomplete
autocmd FileType java set omnifunc=javacomplete

"pydiction
let g:pydiction_location='D:\software\vim\vimfiles\ftplugin\complete-dict'

"����·��
set path=.,d:/software/Vim
set path+=e:/platform-tools
set path+=d:/test/*
set path+=d:/PopoServer/trunk/PC/Tools/Python27/Lib/**
"TagList
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
"tags
"set tags=D:\PopBox\popocloud\tags
"set tags=D:\sessionbox\tags
"set tags=D:\PopoServer\trunk\2.2\popocloud\tags
"set tags=D:\PopoServer\trunk\2.3\popocloud\tags
set tags+=.
"set tags=D:\PopoServer\trunk\2.4\popocloud\tags
set tags=D:\PopoServer\trunk\3.0\popocloud\tags
set tags+=D:\PopoServer\trunk\PC\Tools\Python27\tags
set tags+=E:\work\cloud\tags
"cscope
"cs a D:\PopBox\popocloud\cscope.out

"�����ļ�
set backupext=.bak
set backupdir=D:\backupdir
au BufWritePre * let &bex='-'.strftime("%Y%m%d-%H%M%S").'.bak'

"NerdTree
map <F3> :Tlist<CR>
"od %:p:h

"let the vim big
nmap sx <ESC>:simalt~x<CR>
nmap sr <ESC>:simalt~r<CR>
nmap sn <ESC>:simalt~n<CR>

nmap gc <ESC>:cd %:p:h<CR>
"nmap <silent> <C-p> <ESC>:cd d:\PopoServer\trunk\2.4\popocloud<CR>
"":command Gdir24 :cd d:\PopoServer\trunk\2.4\popocloud
":command App    :cd d:\PopoServer\trunk\2.4\popocloud\Apps
"
:command Gdir30 :cd d:\PopoServer\trunk\3.0\popocloud
:command Gdir24 :cd d:\PopoServer\trunk\2.4\popocloud
:command Port   :cd d:\PopoServer\trunk\3.0\popocloud\portal
:command Test   :cd d:\test

command  Goto :call Goto()
command  Godesk :call Godesk()

function! Goto()
    :cd d:\PopoServer
endfunction

function! Godesk()
    :cd ~
endfunction

"�½�.c,.h,.sh,.java,*.py�ļ����Զ������ļ�ͷ
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java,*.py exec ":call SetTitle()"
func SetTitle() 
    "����ļ�����Ϊ.sh�ļ� 
    if &filetype == 'sh' 
        call setline(1,"\#########################################################################") 
        call append(line("."), "\# File Name: ".expand("%")) 
        call append(line(".")+1, "\# Author: wayne") 
        call append(line(".")+2, "\# mail: @163.com") 
        call append(line(".")+3, "\# Created Time: ".strftime("%c")) 
        call append(line(".")+4, "\#########################################################################") 
        call append(line(".")+5, "\#!/bin/bash") 
        call append(line(".")+6, "") 
    elseif &filetype == 'python' 
        call setline(1,"\#########################################################################") 
        call append(line("."), "\# -*- coding:utf-8 -*- ") 
        call append(line(".")+1, "\# File Name: ".expand("%")) 
        call append(line(".")+2, "\# Author: wayne") 
        call append(line(".")+3, "\# mail: @163.com") 
        call append(line(".")+4, "\# Created Time: ".strftime("%c")) 
        call append(line(".")+5, "\#########################################################################") 
        call append(line(".")+6, "\#!/bin/python") 
        call append(line(".")+7, "") 
    else 
        call setline(1, "/*************************************************************************") 
        call append(line("."), "    > File Name: ".expand("%")) 
        call append(line(".")+1, "    > Author: wayne") 
        call append(line(".")+2, "    > Mail: @163.com ") 
        call append(line(".")+3, "    > Created Time: ".strftime("%c")) 
        call append(line(".")+4, " ************************************************************************/") 
        call append(line(".")+5, "")
    endif
    if &filetype == 'cpp'
        call append(line(".")+6, "#include<iostream>")
        call append(line(".")+7, "using namespace std;")
        call append(line(".")+8, "")
    endif
    if &filetype == 'c'
        call append(line(".")+6, "#include<stdio.h>")
        call append(line(".")+7, "")
    endif
    if &filetype == 'py'
        call append(line(".")+7, "")
    endif
    "�½��ļ����Զ���λ���ļ�ĩβ
    autocmd BufNewFile * normal G
endfunc 

"�����Զ�����
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
 "Inserting a quoted quotation mark into the string
 return a:char
 elseif line[col - 1] == a:char
 "Escaping out of the string
 return "\<Right>"
 else
 "Starting a string
 return a:char.a:char."\<Esc>i"
 endif
endf

"C�ı��������
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    exec "!gcc % -o %<"
    if has('win32')
        echo "-------" 
        echo expand('')
        exec "! \%<.exe"
    elseif has('linux')
        exec "! ./%<"
    endif
endfunc
 
"C++�ı��������
map <F6> :call CompileRunGpp()<CR>
func! CompileRunGpp()
    exec "w"
    exec "!g++ % -o %<"
    if has('win32')
        echo "-------" 
        echo expand('')
        exec "! \%<.exe"
    elseif has('linux')
        exec "! ./%<"
    endif
endfunc
 
