""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"       _       _
"      (_)   __(_)___ ___
"     / / | / / / __ `__ \
"    / /| |/ / / / / / / /
"   /_/ |___/_/_/ /_/ /_/
"
"   Main Contributor: Antonio <d198908@163.com>
"   Version: 1.0
"   Created: 2015-10-01
"   Last Modified: 2015-10-01
"
"   Sections:
"     -> ivim Setting
"     -> General
"     -> Platform Specific Setting
"     -> NeoBundle
"     -> User Interface
"     -> Colors and Fonts
"     -> Indent Related
"     -> Search Related
"     -> Fold Related
"     -> File Type Specific Setting
"     -> Key Mapping
"     -> Plugin Setting
"     -> Local Setting
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"*****************************************************
""                     General                       *
"*****************************************************
set nocompatible " Get out of vi compatible mode
set viminfo='1000,f1,:1000,/1000

" With a map leader it's possible to do extra key combinations  
" like <leader>w saves the current file  
let mapleader=',' " Change the mapleader
let g:mapleader = ","  
let maplocalleader='\' " Change the maplocalleader
set timeoutlen=500 " Time to wait for a command

" New splits open to right and bottom
set splitbelow
set splitright

" Enable filetype plugin  
"filetype on
"filetype plugin on
"filetype indent on  
"filetype plugin indent on " Enable filetype

" set mouse to work in the console
" set mouse=a

" Session 
set sessionoptions-=curdir
set sessionoptions+=sesdir

" Fast saving  
nmap <leader>w :w!<cr>  
" Source the vimrc file after saving it
" autocmd BufWritePost ~/.vimrc source ~/.vimrc
autocmd! bufwritepost vimrc source ~/.vimrc 
" autocmd BufWritePost $MYVIMRC NeoBundleClean
" Fast edit the .vimrc file using ,x
nnoremap <Leader>x :tabedit ~/.vimrc<CR>
nnoremap <Leader>rs :source ~/.vimrc<CR>

set autoread " Set autoread when a file is changed outside
set autowrite " Write on make/shell commands
set hidden " Turn on hidden"

set history=1000 " Increase the lines of history
set modeline " Turn on modeline
set encoding=utf-8 " Set utf-8 encoding
set completeopt+=longest " Optimize auto complete
set completeopt-=preview " Optimize auto complete

set backup " Set backup
set undofile " Set undo

" autocmd BufWinLeave *.* silent! mkview " Make Vim save view (state) (folds, cursor, etc)
"autocmd BufWinEnter *.* silent! loadview " Make Vim load view (state) (folds, cursor, etc)

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=
set noeb

"allow deletion of previously entered data in insert mode
set backspace=indent,eol,start

" F2 = Paste Toggle (in insert mode, pasting indented text behavior changes)
" set pastetoggle=<F2>

" size of cmd window
set cmdheight=1

" Automatically jump to the next open position
autocmd BufReadPost *
            \ if line("'\"") > 0 && line ("'\"") <= line("$") |
            \ exe "normal! g'\"" |
            \ endif 

" Set directories
function! InitializeDirectories()
    let parent=$HOME
    let prefix='.vim'
    let dir_list={
                \ 'backup': 'backupdir',
                \ 'view': 'viewdir',
                \ 'swap': 'directory',
                \ 'undo': 'undodir',
                \ 'cache': '',
                \ 'session': ''}
    for [dirname, settingname] in items(dir_list)
        let directory=parent.'/'.prefix.'/'.dirname.'/'
        if !isdirectory(directory)
            if exists('*mkdir')
                let dir = substitute(directory, "/$", "", "")
                call mkdir(dir, 'p')
            else
                echo 'Warning: Unable to create directory: '.directory
            endif
        endif
        if settingname!=''
            exec 'set '.settingname.'='.directory
        endif
    endfor
endfunction
call InitializeDirectories()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"*****************************************************
""                User Interface                     *
"*****************************************************
" Set title
set title
set titlestring=%t%(\ %m%)%(\ (%{expand('%:p:h')})%)%(\ %a%)

" Set tabline
set showtabline=2 " Always show tab line
" Set up tab labels
set guitablabel=%m%N:%t[%{tabpagewinnr(v:lnum)}]
set tabline=%!MyTabLine()
function! MyTabLine()
    let s=''
    let t=tabpagenr() " The index of current page
    let i=1
    while i<=tabpagenr('$') " From the first page
        let buflist=tabpagebuflist(i)
        let winnr=tabpagewinnr(i)
        let s.=(i==t ? '%#TabLineSel#' : '%#TabLine#')
        let s.='%'.i.'T'
        let s.=' '
        let bufnr=buflist[winnr-1]
        let file=bufname(bufnr)
        let buftype = getbufvar(bufnr, 'buftype')
        let m=''
        if getbufvar(bufnr, '&modified')
            let m='[+]'
        endif
        if buftype=='nofile'
            if file=~'\/.'
                let file=substitute(file, '.*\/\ze.', '', '')
            endif
        else
            let file=fnamemodify(file, ':p:t')
        endif
        if file==''
            let file='[No Name]'
        endif
        let s.=m
        let s.=i.':'
        let s.=file
        let s.='['.winnr.']'
        let s.=' '
        let i=i+1
    endwhile
    let s.='%T%#TabLineFill#%='
    let s.=(tabpagenr('$')>1 ? '%999XX' : 'X')
    return s
endfunction
" Set up tab tooltips with each buffer name
set guitabtooltip=%F

" Only have cursorline in current window and in normal window
autocmd WinLeave * set nocursorline
autocmd WinEnter * set cursorline
autocmd InsertEnter * set nocursorline
autocmd InsertLeave * set cursorline
set wildmenu " Show list instead of just completing
set wildmode=list:longest,full " Use powerful wildmenu
set shortmess=at " Avoids hit enter
set showcmd " Show cmd
set showmode

set backspace=indent,eol,start " Make backspaces delete sensibly
set whichwrap+=h,l,<,>,[,] " Backspace and cursor keys wrap to
set virtualedit=block,onemore " Allow for cursor beyond last character
set scrolljump=5 " Lines to scroll when cursor leaves screen
set scrolloff=3 " Minimum lines to keep above and below cursor
set sidescroll=1 " Minimal number of columns to scroll horizontally
set sidescrolloff=10 " Minimal number of screen columns to keep away from cursor

set showmatch " Show matching brackets/parenthesis
set matchtime=2 " Decrease the time to blink
set number " Show line numbers

set formatoptions+=rnlmM " Optimize format options
set wrap " Set wrap
set textwidth=80 " Change text width

"set list " Show these tabs and spaces and so on
"set listchars=tab:?\ ,eol:?,extends:?,precedes:? " Change listchars
set linebreak " Wrap long lines at a blank
set showbreak=?  " Change wrap line break
set fillchars=diff:?,vert:│ " Change fillchars
augroup trailing " Only show trailing whitespace when not in insert mode
    autocmd!
    autocmd InsertEnter * :set listchars-=trail:?
    autocmd InsertLeave * :set listchars+=trail:?
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"*****************************************************
""                Colors and Fonts                   *
"*****************************************************
syntax on " Enable syntax
syntax enable
"colorscheme dracula
set guioptions-=T  
set background=dark " Set background 
set t_Co=256 " Use 256 colors
set background=dark  
colorscheme peaksea  
set nu   
set ffs=unix,dos,mac "Default file types  
set winminheight=0              " Windows can be 0 line high

" Coding mode
set encoding=utf-8
set fencs=utf-8,gb18030 

" Automatic judge coding
set fileformats=unix
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"*****************************************************
""                Files and backups                  *
"*****************************************************
" Turn backup off, since most stuff is in SVN, git anyway...  
set nowb  
set noswapfile  
set nowritebackup
set nobackup 


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"*****************************************************
""                  Indent Related                   *
"*****************************************************
set autoindent " Preserve current indent on new lines
set cindent " set C style indent
set expandtab " Convert all tabs typed to spaces
set softtabstop=4 " Indentation levels every four columns
set shiftwidth=4 " Indent/outdent by four columns
set shiftround " Indent/outdent to nearest tabstop
set formatoptions=tcrqn
set smartindent
set smarttab
set tabstop=4 
set expandtab	   " expand tab to space
"set expandtab
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,node_modules/*
"Format C code
set et
set ci


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"*****************************************************
""                  Search Related                   *
"*****************************************************
set smartcase " Case sensitive when uc present
set hlsearch " Highlight search terms
set incsearch " Find as you type search
set gdefault " turn on g flag
set noic
set ignorecase " Case insensitive search

" Use sane regexes
nnoremap / /\v
vnoremap / /\v
cnoremap s/ s/\v
nnoremap ? ?\v
vnoremap ? ?\v
cnoremap s? s?\v

" Keep search matches in the middle of the window
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap * *zzzv
nnoremap # #zzzv
nnoremap g* g*zzzv
nnoremap g# g#zzzv

" Visual search mappings
function! s:VSetSearch()
    let temp=@@
    normal! gvy
    let @/='\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
    let @@=temp
endfunction
vnoremap * :<C-U>call <SID>VSetSearch()<CR>//<CR>
vnoremap # :<C-U>call <SID>VSetSearch()<CR>??<CR>

" Use ,Space to toggle the highlight search
nnoremap <Leader><Space> :set hlsearch!<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"*****************************************************
""                   Fold Related                   *
"*****************************************************
set foldlevelstart=0 " Start with all folds closed
set foldcolumn=1 " Set fold column

" Space to toggle and create folds.
nnoremap <silent> <Space> @=(foldlevel('.') ? 'za' : '\<Space>')<CR>
vnoremap <Space> zf

" Set foldtext
function! MyFoldText()
    let line=getline(v:foldstart)
    let nucolwidth=&foldcolumn+&number*&numberwidth
    let windowwidth=winwidth(0)-nucolwidth-3
    let foldedlinecount=v:foldend-v:foldstart+1
    let onetab=strpart('          ', 0, &tabstop)
    let line=substitute(line, '\t', onetab, 'g')
    let line=strpart(line, 0, windowwidth-2-len(foldedlinecount))
    let fillcharcount=windowwidth-len(line)-len(foldedlinecount)
    return line.'…'.repeat(' ',fillcharcount).foldedlinecount.'L'.' '
endfunction
set foldtext=MyFoldText()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"*****************************************************
""                     Key Mapping                   *
"*****************************************************
" Make j and k work the way you expect
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Navigation between windows
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-H> <C-W>h
nnoremap <C-L> <C-W>l

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Repeat last substitution, including flags, with &.
nnoremap & :&&<CR>
xnoremap & :&&<CR>

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" Select entire buffer
nnoremap vaa ggvGg_

" Strip all trailing whitespace in the current file
nnoremap <Leader>q :%s/\s\+$//<CR>:let @/=''<CR>

" Modify all the indents
nnoremap \= gg=G

" See the differences between the current buffer and the file it was loaded from
command! DiffOrig vert new | set bt=nofile | r ++edit # | 0d_
            \ | diffthis | wincmd p | diffthis


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"--------------------------------------------------------------------
" => Plugin Setting
"--------------------------------------------------------------------

"*****************************************************
""                   Tabularize                      *
"*****************************************************
 nmap <Leader>a& :Tabularize /&<CR>
 vmap <Leader>a& :Tabularize /&<CR>
 nmap <Leader>a= :Tabularize /=<CR>
 vmap <Leader>a= :Tabularize /=<CR>
 nmap <Leader>a: :Tabularize /:<CR>
 vmap <Leader>a: :Tabularize /:<CR>
 nmap <Leader>a:: :Tabularize /:\zs<CR>
 vmap <Leader>a:: :Tabularize /:\zs<CR>
 nmap <Leader>a, :Tabularize /,<CR>
 vmap <Leader>a, :Tabularize /,<CR>
 nmap <Leader>a,, :Tabularize /,\zs<CR>
 vmap <Leader>a,, :Tabularize /,\zs<CR>
 nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
 vmap <Leader>a<Bar> :Tabularize /<Bar><CR>


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
""                     NERDTree                      *
"*****************************************************
nnoremap <Leader>d :NERDTreeToggle<CR>
nnoremap <Leader>f :NERDTreeFind<CR>
let NERDTreeWinPos = 'right'
let NERDTreeChDirMode=2
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=1
let NERDTreeDirArrows=1
let g:nerdtree_tabs_open_on_gui_startup=0

"*****************************************************
""                     undotree                      *
"*****************************************************
nnoremap <Leader>u :UndotreeToggle<CR>
let g:undotree_SetFocusWhenToggle=1
set undodir='~/.undodir/'
set undofile

"*****************************************************
""                     Calendar                      *
"*****************************************************
let g:calendar_frame = 'default'
nnoremap <Leader>cal :Calendar<CR>
nnoremap <Leader>cay :Calendar -view=year -split=vertical -width=27<CR>

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

nmap <F10> :call UpdateCtags()<CR>
"autocmd BufWritePost *.c,*.h,*.cpp call UpdateCtags()
" map <F5> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>

set tags=tags;
set tags+=~/tools/include/tags;
set tags+=~/.vim/systags;
set tags+=/usr/include/tags;
set tags+=~/.vim/tags/libc.tags
set tags+=~/.vim/tags/susv2.tags
set tags+=~/.vim/tags/glib.tags
set tags+=~/.vim/tags/cpp.tags
set autochdir 

"*****************************************************
""                     echofunc                      *
"*****************************************************
set tags+=/usr/include/tags 
"nmap <M-F9> :!ctags --append=yes -f ~/.vim/systags --fields=+lS
""nmap <C-F9> :!ctags -R --fields=+lS
let g:EchoFuncLangsUsed = ["c", "cpp", "java"] 
"let g:EchoFuncShowOnStatus = 1 

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
set completeopt=longest,menu
" Sort by name
" let Tlist_Sort_Type = "name"
nnoremap <Leader>tl :Tlist<CR>

"*****************************************************
""                     supertab                      *
"*****************************************************
let g:SuperTabDefaultCompletionType="context"
let g:SuperTabRetainCompletionType=2
let g:SuperTabDefaultCompletionType="<C-X><C-O>"

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

"*****************************************************
""                    Vim-Airline                    *
"*****************************************************
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep='›'  " Slightly fancier than '>'
let g:airline_right_sep='‹' " Slightly fancier than '<'

let g:airline_theme='bubblegum'
let g:bufferline_modified='[+]'
let g:bufferline_echo=0
set noshowmode " Hide the default mode text

set guifont=Ubuntu\ Mono\ derivative\ Powerline
" set status line
set laststatus=2
set fillchars+=stl:\ ,stlnc:\
" enable powerline-fonts
" let g:airline_powerline_fonts = 1
" enable tabline
let g:airline#extensions#tabline#enabled = 1
" set left separator
let g:airline#extensions#tabline#left_sep = ' '
" set left separator which are not editting
let g:airline#extensions#tabline#left_alt_sep = '|'

function! AirlineInit()
	let g:airline#extensions#tabline#buffer_nr_show = 1
	let g:airline_section_c = airline#section#create(['%{getcwd()}/%t'])
	let g:airline_section_z = airline#section#create(['Pos: %p%% %l/%L:%c '])
endfunction
autocmd User AirlineAfterInit call AirlineInit()

"*****************************************************
""                      ultisnips                    *
"*****************************************************
let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsSnippetDirectories=['UltiSnips']
let g:UltiSnipsSnippetsDir = '~/.vim/UltiSnips'
let g:UltiSnipsExpandTrigger="<F2>"
let g:UltiSnipsJumpForwardTrigger = '<Tab>'
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetsDir='~/.vim/UltiSnips'

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
inoremap <expr><space>  pumvisible() ? neocomplcache#close_popup() . "\<SPACE>" : "\<SPACE>"


"*****************************************************
""                    session                        *
"*****************************************************
set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize
nmap <leader>sl :SessionList<CR>
nmap <leader>ss :SessionSave<CR>
nmap <leader>sc :SessionClose<CR>


"*****************************************************
""                    Tag bar                        *
"*****************************************************
nnoremap <Leader>tg :TagbarToggle<CR>
let g:tagbar_autofocus=1
let g:tagbar_expand=1
let g:tagbar_foldlevel=2
let g:tagbar_autoshowtag=1

"*****************************************************
""                     rainbow                       *
"*****************************************************
"0 if you want to enable it later via :RainbowToggle
let g:rainbow_active = 1
let g:rainbow_conf = {
    \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
    \   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
    \   'operators': '_,_',
    \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
    \   'separately': {
    \       '*': {},
    \       'tex': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
    \       },
    \   'c': {
    \     'parentheses': [
    \       'start=/(/ end=/)/ fold',
    \       'start=/\[/ end=/\]/ fold',
    \       'start=/{/ end=/}/ fold',
    \       'start=/\(\(\<operator\>\)\@<!<\)\&[a-zA-Z0-9_]\@<=<\ze[^<]/ end=/>/'] 
    \       }, 
    \   'cpp': {
    \     'parentheses': [
    \       'start=/(/ end=/)/ fold',
    \       'start=/\[/ end=/\]/ fold',
    \       'start=/{/ end=/}/ fold',
    \       'start=/\(\(\<operator\>\)\@<!<\)\&[a-zA-Z0-9_]\@<=<\ze[^<]/ end=/>/'] 
    \       }, 
    \       'lisp': {
    \           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
    \       },
    \       'vim': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
    \       },
    \       'html': {
    \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
    \       },
    \       'css': 0,
    \   }
    \}


"*****************************************************
""                 Vundle Setting                    *
"*****************************************************
filetype off                  " required
nnoremap <Leader>bl :BundleList<CR> 
nnoremap <Leader>bd :BundleInstall<CR> 
nnoremap <Leader>bu :BundleUpdate<CR> 
nnoremap <Leader>bc :BundleClean<CR> 

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" required!
" Bundle 'gmarik/vundle'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'godlygeek/tabular'
Bundle 'scrooloose/nerdcommenter'
" Bundle 'sjl/gundo.vim'
Bundle 'scrooloose/syntastic'
Bundle 'vim-scripts/sessionman.vim'
Bundle 'majutsushi/tagbar'
Bundle 'tpope/vim-repeat'
" Bundle 'vim-scripts/vcscommand.vim'
Bundle 'dkprice/vim-easygrep'
Bundle 'luochen1990/rainbow'
" Bundle 'plasticboy/vim-markdown'
" Bundle 'vim-scripts/TxtBrowser'
Bundle 'vim-scripts/echofunc.vim'
