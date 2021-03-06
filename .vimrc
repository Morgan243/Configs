"------------------VIM Runtime Configuration--------------
"Plugins Installed
"     [Referenced by this vimrc]
" 	-Ctags- Scan and mark c/cpp files for variables, functions, etc.
" 	-OmniCppComplete- Syntax completion using Ctags
" 	-TagBar- Displays tags in the current file using Ctags
" 	-Syntastic- checks syntax of c/cpp on save
" 	-SuperTab- adds a few features to tab with OmniComplete
" 	-Powerline- Makes the status line mroe readable and better looking
" 	-Pathogen- Makes it easy to install some plugins
"     
"     [Not referenced here, vim wont complain if its missing]	
"       -Taglist- like tag bar, but shows all open files at once
"       	  Really great for navigating large projects.
" 	Dont forget to install some colorschemes
"

"dont try and be vi compatible
"many plugins/setting require this
set nocompatible

filetype off

"enable filetype based plugins
filetype plugin on

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'klen/python-mode'
Bundle 'davidhalter/jedi-vim'
Bundle 'Valloric/YouCompleteMe'
Bundle 'tpope/vim-fugitive'

" Python-mode
" Activate rope
" Keys:
" K             Show python docs
"   Rope autocomplete
" g     Rope goto definition
" d     Rope show documentation
" f     Rope find occurrences
" b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 0

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = 'b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0


"highlight syntax
syntax on

"Powerline Plugin: make the status line mighty pretty
let g:Powerline_symbols = 'fancy'

"always show the status line
set laststatus=2

"turn omnicompletion on (code completion)
"set ofu=syntaxcomplete#Complete

"set t_Co=256

"The following sets the cursos color depending on mode
"However, the cursor currently keeps its color after vim
"is exited. This is a problem.
if &term =~ "xterm\\|rxvt"
"" use an orange cursor in insert mode
let &t_SI = "\<Esc>]12;teal\x7"
"" use a red cursor otherwise
let &t_EI = "\<Esc>]12;red\x7"
silent !echo -ne "\033]12;red\007"
"" reset cursor when vim exits
autocmd VimLeave * silent !echo -ne "\033]112\007"
"" use \003]12;gray\007 for gnome-terminald
endif

"map tagbar to F11
nmap <F11> :TagbarToggle<CR> 

"turn syntastic (syntax checking) on by default
let g:syntastic_mode_map = { 'mode': 'active',
	\ 'active_filetypes': [], 'passive_filetypes': [] }


"autocmd InsertLeave * if pumvisible() == 0|pclose|endif
autocmd CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

"let the menu show up, select the longest match and give a preview in code
set completeopt=menu,menuone,longest,preview

"make the enter key select highlighted item in omnicomplete menu
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
let g:SuperTabDefaultCompletionType = "context"

"next inoremap keeps lines highlighted but reloads to slim selection
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

"indents are based on filetype
filetype plugin indent on

" OmnicppComplete settings
"let OmniCpp_MayCompleteDot = 1 " autocomplete with .
"let OmniCpp_MayCompleteArrow = 1 " autocomplete with ->
"let OmniCpp_MayCompleteScope = 1 " autocomplete with ::
"let OmniCpp_SelectFirstItem = 2 " select first item (but don't insert)
"
"" search namespaces in this and included files
"let OmniCpp_NamespaceSearch = 2 
"
"" show function prototype (i.e.  parameters) in popup window
"let OmniCpp_ShowPrototypeInAbbr = 1 

" ctags
" map <ctrl>+F12 to generate ctags for current folder:
map <f12> :!ctags -R --c++-kinds=+pl --fields=+iaS --extra=+q --language-force=C++ .<CR>

"add current directory's generated tags file to available tags
set tags+=./tags


set runtimepath^=~/.vim/bundle/ctrlp.vim
"Pathogen makes it easy to modify the
"runtime path to include all plugins
"under the ~/.vim/bundle directory
"call pathogen#helptags()
"call pathogen#runtime_append_all_bundles()

"hides buffers instead of closing them
set hidden
set number "show line numbers
set showmatch "show matching parenthesis

"as you search with '/', vim will display the closest match as you type
set incsearch

"make searches case insensitive
set ignorecase

"keep it case insensitive, UNLESS a capital letter is used
set smartcase

"Set the minimum number of lines to keep above and below the cursor
"--noticed when scrolling
set scrolloff=2

set cursorcolumn "highlight column
set cursorline "highlight the current line

set history=1000 "remember more commands
set undolevels=1000 "lots of undo
set title "set the terminals title
set visualbell "flash
set noerrorbells "dont beep for ERRORS, like invalid commands
set backup "turn on backups
set backupdir=~/.vim/backups " make sure you set a valid path
set mouse=a "not sure what it does, but it allows me to scroll in vim with mouse

"show more command info at the bottom
set showcmd

"turn off arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

"replace ; with :
"makes it much easier to issue commands
nnoremap ; :

nnoremap j gj
nnoremap k gk

"folding code 
set foldmethod=marker "folds are manual 

" press f9 to run make in the working directory
nmap <f9> :make <cr>

" execute 'test' in the current directory
nmap <f8> :!./test

" Map ctrl-movement keys to window switching
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

" Switch to alternate file
map <C-Tab> :bnext<cr>
map <C-S-Tab> :bprevious<cr>

"unhighlights after search
nmap <silent> ,/ :nohlsearch<CR>

"fixes window resize and selection mouse weirdness for urxvt
set ttymouse=xterm2

" set the colorscheme--
colorscheme darkburn "jellybeans also good: leo, anotherdark
			"inkpot, freya, desert256
"set cursorLine and cursorColumn color
highlight CursorLine  term=underline  guibg=#555555  cterm=underline
highlight CursorColumn guibg=#550000  

let g:solarized_termcolors=256
"set background=dark

"tab spaces: tab equals 4 spaces (rather than 8)
set ts=4
set shiftwidth=4
set expandtab

" Auto show the completion menu after a . or -> (or ::)
let g:clang_complete_auto = 1
" Show clang errors in the quickfix window
let g:clang_complete_copen = 1
" Highlight errors and warnings. May be redundant if using syntastic
let g:clang_hl_errors = 1
" Use libclang instead of clang executable
let g:clang_use_library = 1
" The path to libclang. Apparently not needed anymore
" let g:clang_library_path = "/usr/local/Cellar/llvm/3.0/lib"
" Complete #defines
let g:clang_complete_macros = 1
" Clang snippets
"let g:clang_snippets = 1
"let g:clang_snippets_engine = "ultisnips"
" Complete patterns (loops etc)
let g:clang_complete_patterns = 1
