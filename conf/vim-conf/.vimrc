" Text formatting and layout
:filetype indent on
set formatoptions=tcrqn
set autoindent
set smartindent
set cindent 
set smarttab
set tabstop=4 
set softtabstop=4 
set shiftwidth=4
set expandtab	   " expand tab to space
"set noexpandtab 
"set nowrap 
set fileformats=unix,dos


"delete 4 spaces when setting the back grid key
set smarttab
set softtabstop=4
set magic

"Format C code
set et
set ci

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
set t_Co=256
if &t_Co > 2 || has("gui_running")
  "syntax on
  "syntax enable
  "set t_Co=256
  set hlsearch
endif

" color scheme
" set background=dark
" set t_Co=88
" colorscheme wombat
" colorscheme desert
" colorscheme molokai


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

" vim Multi label
" nnoremap gm m
" let g:EasyClipUseCutDefaults = 1
" let g:EasyClipUseSubstituteDefaults = 1
" cmap <c-v> <plug>EasyClipCommandModePaste
" nmap yd <Plug>MoveMotionPlug
" xmap yd <Plug>MoveMotionXPlug
" nmap ydd <Plug>MoveMotionLinePlug

"*****************************************************
""                     NERDTree                      *
"*****************************************************
let NERDTreeWinPos = 'right'
nnoremap <silent> <C-F1> :NERDTree<CR>


"*****************************************************
""                      AutoVim                      *
"*****************************************************
let g:calendar_frame = 'default'

"*****************************************************
""                     taglist                      *
"*****************************************************
" let Tlist_Ctags_Cmd="/usr/bin/ctags"
let Tlist_Compact_Format=1
"let Tlist_Ctags_Cmd="exctags"
let Tlist_Show_One_File=1  
let Tlist_Auto_Highlight_tag=1
let Tlist_Exit_OnlyWindow=1 
let Tlist_Use_SingClick=1
let Tlist_Auto_Open = 0
let Tlist_Auto_Update = 1
set completeopt=longest,menu
" Sort by name
" let Tlist_Sort_Type = "name"

"*****************************************************
""                       ctag                      *
"*****************************************************
function! UpdateCtags()
    let curdir=getcwd()
    while !filereadable("./tags")
        cd ..
        if getcwd() == "/"
            break
        endif
    endwhile
    if filewritable("./tags")
        !ctags -R --file-scope=yes --langmap=c:+.h --languages=c,c++ --links=yes --c-kinds=+p --c++-kinds=+p --fields=+iaS --extra=+q
        TlistUpdate
    endif
    execute ":cd " . curdir
endfunction
map <F5> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
"nmap <F10> :call UpdateCtags()<CR>
"autocmd BufWritePost *.c,*.h,*.cpp call UpdateCtags()


"F12生成/更新tags文件 
set tags=tags;
" set tags+=../tags;
set tags+=~/tools/include/tags;
set tags+=~/.vim/systags;
set tags+=/usr/include/tags;
set tags+=~/.vim/tags/libc.tags
set tags+=~/.vim/tags/susv2.tags
set tags+=~/.vim/tags/glib.tags
set tags+=~/.vim/tags/cpp.tags
set autochdir 
" function! UpdateTagsFile() 
"    silent !ctags -R --fields=+ianS --extra=+q 
" endfunction 
" nmap <F12> :call UpdateTagsFile()<CR> 
nmap <silent><leader>t :OmniTagsLoad ./tags<CR>
nmap <leader>u :OmniTagsUpdate

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

"*****************************************************
""                  NeoComplCache                    *
"*****************************************************
let g:neocomplcache_enable_at_startup=1
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
let g:neocomplcache_enable_quick_match = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
inoremap <expr><space>  pumvisible() ? neocomplcache#close_popup() . "\<SPACE>" : "\<SPACE>"

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

"*****************************************************
""                OmniCppComplete                    *
"*****************************************************
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_MayCompleteDot = 1
let OmniCpp_MayCompleteArrow = 1
let OmniCpp_MayCompleteScope = 1
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

"autocmd BufNewFile *.html 0r ~/.vim/skel/dot.html
"autocmd BufNewFile *.h    0r ~/.vim/skel/dot.h   | exe "%s/<FILE>/".expand("%")
"autocmd BufNewFile *.c    0r ~/.vim/skel/dot.c   | exe "%s/<FILE>/".expand("%")
"autocmd BufNewFile *.cpp  0r ~/.vim/skel/dot.cpp | exe "%s/<FILE>/".expand("%")
"autocmd BufNewFile *.pc   0r ~/.vim/skel/dot.pc  | exe "%s/<FILE>/".expand("%")
"autocmd BufNewFile *.ec   0r ~/.vim/skel/dot.ec  | exe "%s/<FILE>/".expand("%")

"*****************************************************
""                        Mark                       *
"*****************************************************
let mapleader = "," 

"*****************************************************
""                    Vim-Airline                    *
"*****************************************************
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" vim-powerline symbols
"let g:airline_left_sep          = '⮀'
"let g:airline_left_alt_sep      = '⮁'
"let g:airline_right_sep         = '⮂'
"let g:airline_right_alt_sep     = '⮃'
"let g:airline_branch_prefix     = '⭠'
"let g:airline_readonly_symbol   = '⭤'
"let g:airline_linecolumn_prefix = '⭡'

"let g:airline_theme='wombat'
set timeoutlen=50
"let g:airline_theme = 'powerlineish'
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=1
let g:airline_enable_branch     = 1

"set guifont=Liberation\ Mono\ for\ Powerline\ 10 
set guifont=Ubuntu\ Mono\ derivative\ Powerline
" set status line
set laststatus=2
set ambiwidth=double
set fillchars+=stl:\ ,stlnc:\
" enable powerline-fonts
let g:airline_powerline_fonts = 1
" enable tabline
" let g:airline#extensions#tabline#enabled = 1
" set left separator
let g:airline#extensions#tabline#left_sep = ' '
" set left separator which are not editting
let g:airline#extensions#tabline#left_alt_sep = '|'
" show buffer number
let g:airline#extensions#tabline#buffer_nr_show = 1
" 映射切换buffer的键位
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>

function! AirlineInit()
    "let g:airline_section_a = airline#section#create(['mode', ' ', 'foo'])
    "let g:airline_section_b = airline#section#create_left(['ffenc','file'])
    let g:airline_section_c = airline#section#create(['%{getcwd()}'])
    let g:airline_section_x = '%t'
endfunction
autocmd User AirlineAfterInit call AirlineInit()





