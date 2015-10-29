" filetype
filetype plugin on
filetype plugin indent on 

"******************************************************************
"****************** Plugin Setting ********************************
"******************************************************************
""--------------------------------------------------------------------
"" => Other enhance
""--------------------------------------------------------------------

"*****************************************************
""                     Calendar                      *
"*****************************************************
let g:calendar_frame = 'default'
" Calendar Key Binding
nnoremap <Leader>cal :Calendar<CR>
nnoremap <Leader>cay :Calendar -view=year -split=vertical -width=27<CR>


"*****************************************************
""                    session                        *
"*****************************************************
set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize
" session Key Binding
nmap <leader>sl :SessionList<CR>
nmap <leader>ss :SessionSave<CR>
nmap <leader>sc :SessionClose<CR>


"*****************************************************
""              multi_cursor Setting                 *
"*****************************************************
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_exit_from_visual_mode=1
" Default highlighting (see help :highlight and help :highlight-link)
highlight multiple_cursors_cursor term=reverse cterm=reverse gui=reverse
highlight link multiple_cursors_visual Visual

" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
  if exists(':NeoCompleteLock')==2
    exe 'NeoCompleteLock'
  endif
endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
  if exists(':NeoCompleteUnlock')==2
    exe 'NeoCompleteUnlock'
  endif
endfunction

" multi_cursor Key Binding
" Default mapping
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
" Map start key separately from next key
let g:multi_cursor_start_key='<C-n>'
let g:multi_cursor_start_word_key='g<C-n>'


"*****************************************************
""                  miniBufexplorer                  *
"*****************************************************
let g:miniBufExplVSplit=32
let g:miniBufExplBRSplit=1
let g:miniBufExplorerAutoStart=1
let g:miniBufExplBuffersNeeded=2
let g:miniBufExplMapWindowNavArrows = 1  
let g:miniBufExplMapWindowNavVim = 1  
let g:miniBufExplMapCTabSwitchWindows = 1  
"let g:miniBufExplMapCTabSwitchBufs = 1   
let g:miniBufExplModSelTarget = 1  
"解决FileExplorer窗口变小问题  
let g:miniBufExplForceSyntaxEnable = 1  
let g:miniBufExplorerMoreThanOne=2  


""--------------------------------------------------------------------
"" => Status line
""--------------------------------------------------------------------
"*****************************************************
""              vim-indent-guides                    *
"*****************************************************
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 1 " 2
let g:indent_guides_guide_size = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey


"*****************************************************
""                     echofunc                      *
"*****************************************************
let g:EchoFuncLangsUsed = ["c", "cpp", "java"] 
"let g:EchoFuncShowOnStatus = 1 
" Key to echo the next function
" let g:EchoFuncKeyNext = '<C-Space>'
" Key to echo the prev function
" let g:EchoFuncKeyPrev = '<C-S-Space>'

"*****************************************************
""                    Vim-Airline                    *
"*****************************************************
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
" unicode symbols
let g:airline_left_sep='?'  " Slightly fancier than '>'
let g:airline_right_sep='?' " Slightly fancier than '<'
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
	let g:airline_section_c = airline#section#create(['%{getcwd()}'])
	let g:airline_section_z = airline#section#create(['Pos: %p%% %l/%L:%c '])
endfunction
autocmd User AirlineAfterInit call AirlineInit()

"*****************************************************
""                     rainbow                       *
"*****************************************************
"0 if you want to enable it later via :RainbowToggle
let g:rainbow_active = 1
    "   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
    "   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
let g:rainbow_conf = {
    \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
    \   'ctermfgs': ['brown', 'darkmagenta', 'darkblue', 'darkcyan'],
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
""                 Matchit Setting                   *
"*****************************************************
" Use Tab instead of % to switch
nmap <Tab> %
vmap <Tab> %


""--------------------------------------------------------------------
"" => Code Comment
""--------------------------------------------------------------------

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
" Doxygen toolkit Key Binding
:nmap <C-@>m :Dox<CR>


""--------------------------------------------------------------------
"" => Tag bar
""--------------------------------------------------------------------

"*****************************************************
""                       ctags                       *
"*****************************************************
" tag files path
set tags=tags;
set tags+=~/tools/tags/tools.tags;
set tags+=~/tools/tags/usr_include_std.tags
set tags+=~/tools/tags/usr_include_str_time.tags
set tags+=~/tools/tags/usr_include_net.tags
set tags+=~/tools/tags/usr_include_sys.tags
set tags+=~/tools/tags/timer.tags
set tags+=~/tools/tags/utils.tags
set tags+=~/tools/tags/thread.tags
" set tags+=~/.vim/systags;
set autochdir 

function! UpdateCtags()
    let curdir=getcwd()
    while !filereadable("./tags")
        cd ..
        if getcwd() == "/"
            break
        endif
    endwhile
    if filewritable("./tags")
        !ctags -R --file-scope=yes --langmap=c:+.h --languages=c,c++ --links=yes --c-kinds=+p --c++-kinds=+p --fields=+liaS --extra=+q
        TlistUpdate
    endif
    execute ":cd " . curdir
endfunction

" ctags Key Binding
nmap <F10> :call UpdateCtags()<CR>
" map <F5> :!ctags -R --c++-kinds=+p --fields=+liaS --extra=+q .<CR><CR> :TlistUpdate<CR>


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
" set completeopt=preview,longest,menu,menuone
" let Tlist_Sort_Type = "name"  " Sort by name
" taglist Key Binding
nnoremap <Leader>tl :Tlist<CR>

"*****************************************************
""                    Tag bar                        *
"*****************************************************
nnoremap <Leader>tg :TagbarToggle<CR>
let g:tagbar_left = 1
let g:tagbar_width=30
let g:tagbar_autofocus=1
let g:tagbar_expand=1
let g:tagbar_foldlevel=2
let g:tagbar_autoshowtag=1
let g:tagbar_zoomwidth = 0
let g:tagbar_sort = 0
" autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()

"*****************************************************
""                     NERDTree                      *
"*****************************************************
let NERDTreeWinPos = 'right'
let NERDTreeChDirMode=2          "选中root即设置为当前目录
let NERDTreeQuitOnOpen=1         "打开文件时关闭树
let NERDTreeShowBookmarks=1      "显示书签
let NERDTreeMinimalUI=1          "不显示帮助面板
let NERDTreeShowHidden=1         "目录箭头 1 显示箭头 0传统+-|号
let NERDTreeShowLineNumbers=1
let NERDTreeDirArrows=1
let NERDTreeDirArrowExpandable = '▸'
let NERDTreeDirArrowCollapsible = '▾'
let nerdtree_tabs_open_on_gui_startup=0
" NERDTree Key Binding
nnoremap <Leader>d :NERDTreeToggle<CR>
nnoremap <Leader>f :NERDTreeFind<CR>


"*****************************************************
""                     undotree                      *
"*****************************************************
let g:undotree_SetFocusWhenToggle=1
set undodir='~/.undodir/'
set undofile
" undotree Key Binding
nnoremap <Leader>u :UndotreeToggle<CR>

""--------------------------------------------------------------------
"" => Search
""--------------------------------------------------------------------

"*****************************************************
""                vim-expand-region                  *
"*****************************************************
let g:expand_region_use_select_mode = 1

" Default settings. (NOTE: Remove comments in dictionary before sourcing)
let g:expand_region_text_objects = {
      \ 'iw'  :0,
      \ 'iW'  :0,
      \ 'i"'  :0,
      \ 'i''' :0,
      \ 'i]'  :1,
      \ 'ib'  :1, 
      \ 'iB'  :1,
      \ 'il'  :0, 
      \ 'ip'  :0,
      \ 'ie'  :0,
      \ }

" Extend the global default (NOTE: Remove comments in dictionary before sourcing)
call expand_region#custom_text_objects({
      \ "\/\\n\\n\<CR>": 1,
      \ 'a]' :1, 
      \ 'ab' :1,
      \ 'aB' :1, 
      \ 'ii' :0, 
      \ 'ai' :0,
      \ })

map K <Plug>(expand_region_expand)
map J <Plug>(expand_region_shrink)

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

" cscope Key Binding
nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>    
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>    
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>    
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>    
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>    
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>    
" nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>    
" nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR><CR>

"*****************************************************
""                      ctrlp                        *
"*****************************************************
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.png,*.jpg,*.gif     " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = '\v\.(exe|so|dll)$'
let g:ctrlp_extensions = ['funky']


"*****************************************************
""                     EasyMotion                    *
"*****************************************************
" Use uppercase target labels and type as a lower case
let g:EasyMotion_use_upper = 1
 " type `l` and match `l`&`L`
let g:EasyMotion_smartcase = 1
" Smartsign (type `3` and match `3`&`#`)
let g:EasyMotion_use_smartsign_us = 1
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion

" EasyMotion  Key Binding
" Require tpope/vim-repeat to enable dot repeat support
" Jump to anywhere with only `s{char}{target}`
" `s<CR>` repeat last find motion.
nmap s <Plug>(easymotion-s)
" Bidirectional & within line 't' motion
omap t <Plug>(easymotion-bd-tl)

" hjkl-motion
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

" n-char motion 
map  ;/ <Plug>(easymotion-sn)
omap ;/ <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map ;n <Plug>(easymotion-next)
map ;N <Plug>(easymotion-prev)


""--------------------------------------------------------------------
"" => Code Style
""--------------------------------------------------------------------

"*****************************************************
""                     Tabularize                    *
"*****************************************************
" Tabularize Key Binding
nmap <Leader>a&     :Tabularize /&<CR>
vmap <Leader>a&     :Tabularize /&<CR>
nmap <Leader>a=     :Tabularize /=<CR>
vmap <Leader>a=     :Tabularize /=<CR>
nmap <Leader>a:     :Tabularize /:<CR>
vmap <Leader>a:     :Tabularize /:<CR>
nmap <Leader>a::    :Tabularize /:\zs<CR>
vmap <Leader>a::    :Tabularize /:\zs<CR>
nmap <Leader>a,     :Tabularize /,<CR>
vmap <Leader>a,     :Tabularize /,<CR>
nmap <Leader>a,,    :Tabularize /,\zs<CR>
vmap <Leader>a,,    :Tabularize /,\zs<CR>
nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
vmap <Leader>a<Bar> :Tabularize /<Bar><CR>

"*****************************************************
""                   vim-easy-align                  *
"*****************************************************
" vim-easy-align Key Binding
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"*****************************************************
""                   indentLine                      *
"*****************************************************
let g:indentLine_color_term = 239
let g:indentLine_char = '¦'


""--------------------------------------------------------------------
"" => Code Complete
""--------------------------------------------------------------------
"*****************************************************
""                  Path Complete                    *
"*****************************************************
imap <C-l> <C-X><C-F>

"*****************************************************
""                 Include Complete                  *
"*****************************************************
let g:inccomplete_showdirs=1
let g:inccomplete_appendslash=1
let b:inccomplete_root=1

"*****************************************************
""                     supertab                      *
"*****************************************************
let g:SuperTabDefaultCompletionType="context"
let g:SuperTabRetainCompletionType=2
let g:SuperTabContextDefaultCompletionType = "<c-n>"
let g:SuperTabDefaultCompletionType="<C-X><C-O>"
let g:SuperTabClosePreviewOnPopupClose = 1


"*****************************************************
""                     xptemplate                    *
"*****************************************************
" let g:xptemplate_lib_filter = '~/.vim/UltiSnips/'
" xptemplate
let g:xptemplate_vars = "SParg=&BRfun="			" 代码紧贴括号,函数名单行
" let g:xptemplate_brace_complete = "[{"		        " 括号引号自动补全	

" Prevent supertab from mapping <tab> to anything.
let g:SuperTabMappingForward = '<Plug>xpt_void'

" Tell XPTemplate what to fall back to, if nothing matches.
" Original SuperTab() yields nothing if g:SuperTabMappingForward was set to
" something it does not know.
let g:xptemplate_fallback = '<C-r>=XPTwrapSuperTab("n")<CR>'

fun! XPTwrapSuperTab(command) "{{{
    let v = SuperTab(a:command)
    if v == ''
        " Change \<Tab> to whatever you want, when neither XPTemplate or
        " supertab needs to do anything.
        return "\<Tab>"
    else
        return v
    end
endfunction "}}}

let g:xptemplate_key = '<Plug>triggerxpt'
inoremap <Plug>closePUM <C-v><C-v><BS>
imap <tab> <Plug>closePUM<Plug>triggerxpt
let g:xptemplate_fallback = 'nore:<TAB>' " Optional. Use this only when you have no other plugin like SuperTab to handle <TAB>.


"*****************************************************
""                  clang_complete                   *
"*****************************************************
set conceallevel=2
set concealcursor=vin
let g:clang_auto_select=1       " 弹出补全列表之后会自动选择第一个选项但不会生效
let g:clang_complete_auto=1 
let g:clang_complete_copen=1    " 该变量控制语法错误检查后是否打开quickfix窗口列表. 默认值是0表示不打开
let g:clang_periodic_quickfix=1
let g:clang_snippets=1
let g:clang_snippets_engine="clang_complete"
let g:clang_conceal_snippets=1
" let g:clang_user_options='-I~/tools/include -I/usr/include || exit 0'
let g:clang_user_options=''
let g:clang_auto_user_options="path,.clang_complete"
let g:clang_use_library=1
" let g:clang_library_path="~/etc/lib"
let g:clang_sort_algo="priority"
let g:clang_complete_macros=1
let g:clang_complete_patterns=0
let g:clang_close_preview=1
let g:clang_hl_errors=1
set pumheight=20              " Limit popup menu height
let g:clang_memory_percent=70 " Limit memory use
" let g:clang_jumpto_back_key="<a-t>"
" let g:clang_jumpto_declaration_key="<a-p>"

" Complete options (disable preview scratch window, longest removed to aways show menu)
set completeopt=menu,menuone

" SuperTab completion fall-back 
" let g:SuperTabDefaultCompletionType='<c-x><c-u><c-p>'

" imap <C-k>  <esc><tab>
imap <F1>  <esc><tab>

" nnoremap <Leader>q :call g:ClangUpdateQuickFix()<CR>
ino <a-s> <esc>:call Show_error()<cr>a
nno <a-s> <esc>:call Show_error()<cr>
func! Show_error()
   wall
   if &filetype == 'c' || &filetype == 'cpp'
      call g:ClangUpdateQuickFix()
   endif
endfunc


"*****************************************************
""                   AutoComplPop                    *
"*****************************************************
let g:acp_enableAtStartup = 1
let g:acp_ignorecaseOption = 1
" let g:acp_behaviorSnipmateLength = 2
let g:acp_behaviorKeywordLength = 2 
let g:AutoComplPop_MappingDriven = 1  
let g:acp_completeOption = '.,w,b,k'
let g:acp_behaviorFileLength = 1
let g:acp_behaviorKeywordCommand = "\<C-n>"
 "color  
" hi Pmenu guibg=#444444  
" hi PmenuSel ctermfg=7 ctermbg=4 guibg=#555555 guifg=#ffffff  
let g:AutoComplPop_Behavior = {
    \ 'c': [ {'command' : "\\",
    \ 'pattern' : ".",
    \ 'repeat' : 0}
    \ ]
    \}

"*****************************************************
""                 TTrCodeAssistor                   *
"*****************************************************
let g:TTrCodeAssistor_AutoStart=1 
nnoremap <F1> :call TTrCodeAssistor_ToggleComments()<CR>
vnoremap <F1> :call TTrCodeAssistor_ToggleComments()<CR> 

"*****************************************************
""                      Vundle                       *
"*****************************************************
" Vundle Key Binding
nnoremap <Leader>bl :BundleList<CR> 
nnoremap <Leader>bd :BundleInstall<CR> 
nnoremap <Leader>bu :BundleUpdate<CR> 
nnoremap <Leader>bc :BundleClean<CR> 
