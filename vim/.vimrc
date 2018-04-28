set laststatus=2        " enable status line always set nocompatible
set secure

set splitbelow 	        " set scratch/preview window bottom
set backspace=2         " allow backspacing over everything in insert mode
set viminfo='20,\"50    " read/write a .viminfo file, don't store more
						" than 50 lines of registers
set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time
set scrolloff=2			" keep space from top and bottom
set laststatus=2		" show status in all windows

set nu
set t_Co=256            " number of colors
set t_Sf=^[[1;3%p1%dm   " set foreground color
set t_Sb=^[[1;4%p1%dm   " set background color
set showcmd             " show command
set showmode            " show current mode
set incsearch           " While typing a search pattern, show immediately 
						" where the so far typed pattern matches.
set hlsearch            " When there is a previous search pattern, 
						" highlight all its matches.
syntax on               " show parts of the text in another font or color
set signcolumn=yes      " always show error sign

set fileencodings=utf-8,cp936,big5,latin1

set background=dark
colorscheme luthadel



" ----------------------------------------- "
"  Vundle
" ----------------------------------------- "
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
			
" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Yggdroot/indentLine'
Plugin 'majutsushi/tagbar'
Plugin 'jpalardy/vim-slime'
Plugin 'vim-latex/vim-latex'
" Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-surround'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required



" ----------------------------------------- "
"  YouCompleteMe
" ----------------------------------------- "
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0															" don't need to ask whether to use .ycm_extra_conf.py
set completeopt-=preview                                                                    " don't show the preview window
set completeopt=longest,menuone           													" let complete menu to be like IDE
" let g:ycm_autoclose_preview_window_after_insertion = 1
" let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_path_to_python_interpreter = 'python'
let g:ycm_python_binary_path = 'python'
let g:ycm_seed_identifiers_with_syntax = 1                          						" syntax complete
let g:ycm_complete_in_strings = 1                                   						" string complete
let g:ycm_cache_omnifunc = 0                                        						" prevend from caching match
let g:ycm_filetype_blacklist = {
	\ 'tagbar' : 1,
	\ 'nerdtree' : 1,
	\}																						" close ycm under some condition
let g:ycm_key_list_stop_completion = ['`']                                                  " use ` to choose the current option
" let g:ycm_key_list_select_completion = ['<C-n>', '<Down>', '<TAB>']
" let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>', '<TAB>']
" set the direction key
" inoremap <expr> <Down>      pumvisible() ? '<C-n>' : '<Down>'
" inoremap <expr> <Up>        pumvisible() ? '<C-p>' : '<Up>'
" inoremap <expr> <PageDown>  pumvisible() ? '<PageDown><C-p><C-n>' : '<PageDown>'
" inoremap <expr> <PageUp>    pumvisible() ? '<PageUp><C-p><C-n>' : '<PageUp>'
" use ? to open the documentation
nnoremap ? :YcmCompleter GetDoc <CR>
" use q to close all preview window
nnoremap qq :pclose <CR>



" ----------------------------------------- "
"  NERDTree + Tabs
" ----------------------------------------- "
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif		" automatically quit vim if nerd tree is the only buffer
map <C-l> :tabn <CR>								    " use Control+l to go to the next tab
map <C-h> :tabp <CR>									" use Control+h to go to the previous tab
map <F1> :NERDTreeTabsToggle <CR>						" use F1 to open the nerdtree



" ----------------------------------------- "
"  NERDCommender
" ----------------------------------------- "
let g:NERDSpaceDelims = 1				" Add spaces after comment delimiters by default
let g:NERDCompactSexyComs = 1			" Use compact syntax for prettified multi-line comments
let g:NERDDefaultAlign = 'start'			" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDCommentEmptyLines = 1			" Allow commenting and inverting empty lines (useful when commenting a region)
map <C-\> <leader>ci					" Use CONTROL+\ to commend



" ----------------------------------------- "
"  Indentline
" ----------------------------------------- "
let g:indentLine_color_term = 239		" set the color
let g:indentLine_enabled = 1



" ----------------------------------------- "
"  TagBar
" ----------------------------------------- "
map <F2> :TagbarToggle<CR>



" ----------------------------------------- "
"  Vim-Slime
" ----------------------------------------- "
let g:slime_target = 'tmux'
let g:slime_default_config = {"socket_name": "default", "target_pane": ":0.1"}
" let g:slime_no_mappings = 1



" ----------------------------------------- "
"  Vim-Latex
" ----------------------------------------- "
filetype plugin on                                          " invoke Latex-Suite when open a tex file
filetype indent on
let g:tex_flavor='latex'
autocmd filetype tex imap ∫ <Plug>Tex_MathBF
autocmd filetype tex imap ç <Plug>Tex_MathCal
autocmd filetype tex imap ¬ <Plug>Tex_LeftRight
autocmd filetype tex imap ˆ <Plug>Tex_InsertItemOnThisLine
autocmd BufNewFile,BufRead *.tex
    \ let g:indentLine_conceallevel=0                       " prevent \pi become π
    \ let g:Tex_AdvancedMath = 1
let Tex_FoldedSections=""
let Tex_FoldedEnvironments=""
let Tex_FoldedMisc=""
set grepprg=grep\ -nH\ $*                                   " for completement
" dynamically update Last Change
function! LastChange()
  if &modified
    let save_cursor = getpos(".")
    let n = min([8, line("$")])
    keepjumps exe '1,' . n . 's#^% Last Change: \zs.*#' . strftime('%a %b %d %I:00 %p %Y ').substitute(strftime('%Z'), '\<\(\w\)\(\w*\)\>\(\W\|$\)', '\1', 'g') . '#e'
    call histdel('search', -1)
    keepjumps call setpos('.', save_cursor)
  endif
endfun
autocmd BufWritePre *.tex call LastChange()
" let g:Tex_FormatDependency_pdf = 'dvi,ps,pdf'
" let g:Tex_CompileRule_dvi = 'latex --interaction=nonstopmode $*'
" let g:Tex_CompileRule_ps = 'dvips -Ppdf -o $*.ps $*.dvi'
" let g:Tex_CompileRule_pdf = 'ps2pdf $*.ps'
" let g:Tex_DefaultTargetFormat = 'pdf'



" ----------------------------------------- "
"  Latex Live Preview
" ----------------------------------------- "
" autocmd filetype tex setl updatetime=1000           " update time
" let g:livepreview_previewer = 'open -a Preview'
" let g:livepreview_engine = 'pdflatex'
" autocmd filetype tex :LLPStartPreview



" ----------------------------------------- "
"  UltiSnips
" ----------------------------------------- "
let g:UltiSnipsExpandTrigger="<C-e>"
let g:UltiSnipsJumpForwardTrigger="∆"
let g:UltiSnipsJumpBackwardTrigger="˚"



" ----------------------------------------- "
"  set for C family
" ----------------------------------------- "
autocmd FileType c,cpp
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set cindent |
    \ set autoindent |
    \ set expandtab |
    \ set showmatch |
    \ inoremap <expr> <CR> getline(".")[col(".")-2] == "{" && getline(".")[col(".")-1] == "}" ? '<CR><CR><Up><TAB>' : '<CR>'



" ----------------------------------------- "
"  set for Python
" ----------------------------------------- "
au BufNewFile,BufRead *.py
	\ set textwidth=79 |
	\ set autoindent |
 	\ set fileformat=unix |



" ----------------------------------------- "
"  set pathogen			" auto load all plugins in vim bundle
" ----------------------------------------- "
execute pathogen#infect()



" ----------------------------------------- "
"  Use PageUp and PageDown in Insert Mode
" ----------------------------------------- "
" imap <PageUp> <C-O><C-U>
" imap <PageDown> <C-O><C-D>



" ----------------------------------------- "
"  PageUp, PageDown, Home, End 
" ----------------------------------------- "
" nnoremap <C-k> <PageUp>
" nnoremap <C-j> <PageDown>
" noremap <C-h> <Home>
" noremap <C-l> <End>


" ----------------------------------------- "
"  set expandtab			" expand tabs to spaces.
" ----------------------------------------- "
set wildchar=<TAB>		" such as <TAB> in shell
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4



" ----------------------------------------- "
"  smart mapping for tab completion
" ----------------------------------------- "
" function InsertTabWrapper()
"     let col = col('.') - 1
"     if !col || getline('.')[col - 1] !~ '\k'
"         return "\<tab>"
"     else
"         return "\<c-p>"
"     endif
" endfunction 
" 
" inoremap <TAB> <C-R>=InsertTabWrapper()<CR>



" ----------------------------------------- "
"  Code Folding
" ----------------------------------------- "
" autocmd FileType c,cpp,cc,jave 
"     \ set foldmethod=syntax |
"     \ set foldnestmax=1 |   		                    " only fold one layer
" nnoremap <Space> za				                        " use space to fold
" highlight Folded ctermbg=DarkCyan ctermfg=Black         
" set nofoldenable                                        " default not fold



" ----------------------------------------- "
"  set TAB for indentation in normal mode
" ----------------------------------------- "
vnoremap <TAB> >gv
vnoremap <S-TAB> <gv



" ----------------------------------------- "
"  set increase and decrease
" ----------------------------------------- "
" Use OPTION+a to increase
nnoremap å <C-a>
" Use OPTION+s to increase
nnoremap ß <C-x>



" ----------------------------------------- "
"  set for parentheses
" ----------------------------------------- "
inoremap () ()<++><LEFT><LEFT><LEFT><LEFT><LEFT>
inoremap [] []<++><LEFT><LEFT><LEFT><LEFT><LEFT>
inoremap {} {}<++><LEFT><LEFT><LEFT><LEFT><LEFT>
inoremap '' ''<++><LEFT><LEFT><LEFT><LEFT><LEFT>
inoremap "" ""<++><LEFT><LEFT><LEFT><LEFT><LEFT>
inoremap <> <><++><LEFT><LEFT><LEFT><LEFT><LEFT>



" ----------------------------------------- "
"  Highlight cursor
" ----------------------------------------- "
highlight Comment    ctermfg=DarkCyan
highlight SpecialKey ctermfg=Yellow
highlight statement  ctermfg=142



" ----------------------------------------- "
"  Highlight cursor line
" ----------------------------------------- "
set cursorline
highlight CursorLine cterm=bold
highlight LineNr ctermfg=Black ctermbg=237
highlight CursorLineNr cterm=NONE ctermfg=White ctermbg=240



" ----------------------------------------- "
"  Highlight tab line
" ----------------------------------------- "
highlight TabLineFill ctermbg=Black
highlight TabLine ctermbg=Black ctermfg=DarkCyan
highlight TabLineSel ctermbg=DarkCyan ctermfg=Black



" ----------------------------------------- "
"  Statusline
" ----------------------------------------- "
highlight StatusLine ctermfg=White ctermbg=25
highlight StatusLineNc ctermbg=234



" ----------------------------------------- "
"  NERDTree color
" ----------------------------------------- "
highlight NERDTreeDir ctermfg=Blue
highlight NERDTreeDirSlash ctermfg=DarkMagenta
highlight NERDTreeOpenable ctermfg=Cyan
highlight NERDTreeClosable ctermfg=DarkCyan
highlight NERDTreeExecFile ctermfg=Red
