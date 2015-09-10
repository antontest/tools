" This must be first, beacuse it changes other options as a side effect.
set nocompatible

" set mouse to work in the console
set mouse=a

" show line numbers
set number

" Session 
set sessionoptions-=curdir
set sessionoptions+=sesdir

" hight current line
set cursorline
" set nocursorcolumn

" Coding mode
set encoding=utf-8
set fencs=utf-8,gb18030 

" Automatic judge coding
set fileformats=unix
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

" search
set incsearch
set hlsearch

" show cmd
set showcmd

" isplay "-- INSERT --" when entering insert mode
set showmode

" keep 50 lines of command line history
set history=50

" Auto read
set autoread

" set mapleader
let mapleader = ";"
let g:mapleader = ";"

" resource ~./vimrc
map <leader>s :source ~/.vimrc<cr> 
map <leader>e :e! ~/.vimrc<cr>

" when .vimrc modifying, then resource
autocmd! bufwritepost vimrc source ~/.vimrc 

" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" size of cmd window
set cmdheight=1

" Default Indentation
:filetype indent on
set autoindent
set cindent	 " indent when
set tabstop=4	   " tab width
set softtabstop=4   " backspace
set shiftwidth=4	" indent width
set expandtab	   " expand tab to space

"delete 4 spaces when setting the back grid key
set smarttab
set softtabstop=4

"Format C code
set et
set ci 
autocmd FileType make setlocal noexpandtab "Format C code
" :retab


" set ic means case-insensitive search; noic means case-sensitive.
set noic

" allow backspacing over any character insert mode
set backspace=indent,eol,start

" Backspace and cursor keys wrap to
set whichwrap+=<,>,h,l

" do not wrap lines
set nowrap

" show the cursor position
set ruler

" wild memu
set wildmenu 

" the visual bell flashes the background instead of an audible bell.
" set visualbell

" show syntax highlighting
syntax on
syntax enable

" color scheme
" set background=dark
" set t_Co=88
" colorscheme wombat
" colorscheme desert

" cancel auto backup
set nobackup
set noswapfile
set nowritebackup

" set match mode
set showmatch

" ingore case
set ignorecase

"Detection file type
filetype on
filetype plugin on
filetype plugin indent on

" No annoying sound on errors
set novisualbell 
set noerrorbells
set noeb
set t_vb=
set tm=500

" code complete
set completeopt=longest,preview,menu

" quickfix mode
autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>

" Shared clipboard
set clipboard+=unnamed 

" no backup
set nobackup

"make running
set makeprg=gcc\ -Wall\ -O2\ -g\ -ansi\ -fomit-frame-pointer\ -lpthead\ \ %

" vim statusbar
set laststatus=2
function! CurDir()
	let curdir = substitute(getcwd(), '/home/anton', "~/", "g")
	return curdir
endfunction
set statusline=\ %f%m%r%h\ %w\ %<CWD:\ %{CurDir()}\ %=Pos:\ %l/%L:%c\ %p%%\ 

set nocp 

" Automatically jump to the next open position
autocmd BufReadPost *
            \ if line("'\"") > 0 && line ("'\"") <= line("$") |
            \ exe "normal! g'\"" |
            \ endif 

"*****************************************************
""                     taglist                      *
"*****************************************************
" let Tlist_Ctags_Cmd="/usr/bin/ctags"
let Tlist_Compact_Format=1

let Tlist_Show_One_File=1  
let Tlist_Auto_Highlight_tag=1
let Tlist_Exit_OnlyWindow=1 
let Tlist_Use_SingClick=1
let Tlist_Auto_Open = 0
let Tlist_Auto_Update = 1
" Sort by name
" let Tlist_Sort_Type = "name"

"*****************************************************
""                       ctag                      *
"*****************************************************
"F12生成/更新tags文件 
set tags=tags;
" set tags+=../tags;
set tags+=~/tools/include/tags;
set tags+=~/.vim/systags;
set tags+=/usr/include/tags;
set autochdir 
" function! UpdateTagsFile() 
"    silent !ctags -R --fields=+ianS --extra=+q 
" endfunction 
" nmap <F12> :call UpdateTagsFile()<CR> 

"*****************************************************
""                       cscope                      *
"*****************************************************
if has("cscope")
    set csprg=/usr/bin/cscope
    set csto=1
    set nocst
    set cspc=6
    let g:autocscope_menus=0
    set nocsverb
    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
        cs add /usr/include/cscope.out
        cs add /home/anton/tools/include/cscope.out
    " else add database pointed to by environment
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
        cs add /usr/include/cscope.out
        cs add /home/anton/tools/include/cscope.out
    endif
    set csverb
    " show in quickbuffer
    set cscopequickfix=s-,c-,d-,i-,t-,e-
endif

nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>    
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>    
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>    
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>    
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>    
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>    
" nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>    
" nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR><CR>    

"*****************************************************
""                     echofunc                      *
"*****************************************************
set tags+=/usr/include/tags 
"nmap <M-F9> :!ctags --append=yes -f ~/.vim/systags --fields=+lS
""nmap <C-F9> :!ctags -R --fields=+lS
let g:EchoFuncLangsUsed = ["c", "cpp", "java"] 
"let g:EchoFuncShowOnStatus = 1 

"*****************************************************
""                     supertab                      *
"*****************************************************
let g:SuperTabDefaultCompletionType="context"
let g:SuperTabRetainCompletionType=2
let g:SuperTabDefaultCompletionType="<C-X><C-O>"

"*****************************************************
""                Doxygen toolkit                    *
"*****************************************************
let g:DoxygenToolkit_commentType="C"
let g:DoxygenToolkit_authorName="Antonio_an"
let s:licenseTag = "Copyright(C)\<enter>"
let s:licenseTag = s:licenseTag . "For free\<enter>"
let s:licenseTag = s:licenseTag . "All right reserved"
let g:DoxygenToolkit_licenseTag = s:licenseTag
let g:DoxygenToolkit_briefTag_funcName="yes"
let g:doxygen_enhanced_color=1

:nmap <C-@>m :Dox<CR>
