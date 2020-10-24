set nocompatible
filetype off


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-scripts/indentpython.vim'

Plugin 'romainl/vim-cool' "disable search highlight with movement

" needs pip install flake8
Plugin 'nvie/vim-flake8' "pep8 check

" Plugin 'scrooloose/syntastic' "syntax check
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" needs pip install flake8
Plugin 'w0rp/ale' "syntax chech in the fly
" let g:ale_sign_column_always = 1
" let g:ale_change_sign_column_color = 1
" " let g:ale_lint_on_text_changed='normal'
" let g:ale_python_flake8_args = '--ignore=E2,E3,E5,E722 --max-line-length=99'
" " workaround for disappearing cursor in some vim versions
" let g:ale_echo_cursor = 0

" Plugin 'scrooloose/nerdtree' "file tree
" let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" Plugin 'kien/ctrlp.vim' "search for basically anything from VIM

" Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" Plugin 'tpope/vim-fugitive'
" set diffopt+=vertical

Plugin 'tmhedberg/SimpylFold'
let g:SimpylFold_docstring_preview=1 " see the docstrings for folded code

" Plugin 'Raimondi/delimitMate' " break indenting a little
" let delimitMate_expand_cr = 1
" let delimitMate_expand_space = 1
" 
Plugin 'thinca/vim-quickrun'
let g:quickrun_config = {
      \'*': {
      \'outputter/buffer/split': ':rightbelow vsplit'},}
nnoremap <silent> <F5> :w<CR> :QuickRun python3<CR>
vnoremap <silent> <F5> :w<CR> :QuickRun python3<CR>

Plugin 'davidhalter/jedi-vim'
let g:jedi#completions_enabled = 0
let g:jedi#show_call_signatures_delay = 50
let g:jedi#goto_command = "gD"
let g:jedi#documentation_command = "gd"
"" Doesn't work for some reason (can't find configure function)
"" let g:jedi#auto_initialization = 0
"" let g:jedi#auto_vim_configuration = 0
"" if g:jedi#show_call_signatures > 0
"	" call jedi#configure_call_signatures()
"" endif

" needs pip install jedi
" after installation run ~/.vim/bundle/YCM/install.py
Bundle 'Valloric/YouCompleteMe'
let g:ycm_python_binary_path = '/usr/bin/python3'
" let g:ycm_autoclose_preview_window_after_completion=1
"
" messes with jedi-vim document lookup
" map <leader>g  	:YcmCompleter GoToDefinition<CR>
" map <leader>d  	:YcmCompleter GetDoc<CR>
" map gd		:YcmCompleter GetDoc<CR>
" map gD		:YcmCompleter GoTo<CR>

" " Plugin 'python-mode/python-mode'
" " let g:pymode_python = 'python3'

Plugin 'The-NERD-Commenter'
let g:NERDSpaceDelims = 1 " Add spaces after comment delimiters by default
let g:NERDCommentEmptyLines = 1 " Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDDefaultAlign = 'left' " Align line-wise comment delimiters flush left instead of following code indentation
noremap <silent> <C-_> :call NERDComment(0,"toggle")<CR>
" vnoremap <silent> <C-_> :call NERDComment(0,"toggle")<CR> "not needed??
inoremap <silent> <C-_> <esc>:call NERDComment(0,"toggle")<CR>


""""""""""""""""""""""
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
""""""" end for Vundle

" To be checked
" show bad unnecessary whitespace (isn't part of some Plugin?)
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h ; match BadWhitespace /\s\+$/
" what does this do??
" autocmd FileType python nnoremap <F8> :0,$!yapf<Cr><C-o>
"filetype plugin on
"set showtabline=2               " File tabs allways visible
":nmap <C-S-tab> :tabprevious<cr>
":nmap <C-tab> :tabnext<cr>
":nmap <C-t> :tabnew<cr>
":map <C-t> :tabnew<cr>
":map <C-S-tab> :tabprevious<cr>
":map <C-tab> :tabnext<cr>
":map <C-w> :tabclose<cr>
":imap <C-S-tab> <ESC>:tabprevious<cr>i
":imap <C-tab> <ESC>:tabnext<cr>i
":imap <C-t> <ESC>:tabnew<cr>



"let python_highlight_all=1
syntax on

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap	;	:
cmap		Q	quit
" remove search highlighting on esc
nnoremap <silent> <Enter> :noh<cr>

" map brackets and gn/gp for diffview to move to prev/next diff
if &diff
	set cursorline
	map gn ]c
	map gp [c
	map ] ]c
	map [ [c
endif

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za


au BufNewFile,BufRead *.py;
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix
set encoding=utf-8

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set nobackup		" DON'T keep a backup file

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set bg=dark
set hls
set rdt=3000
set number relativenumber	" line numbers relative
set cindent		" guess what indent should be used (c-like)
set autoindent		" cp indent from previous line
set mouse=a		" use mouse in xterm
set ignorecase		" ignore case
set smartcase		" but don't ignore it, when search string contains uppercase letters
set hid 		" allow switching buffers, which have unsaved changes
set showmatch		" showmatch: Show the matching bracket for the last ')'?
set nowrap		" don't wrap by def
set formatoptions=1	" prevent edited lines from breaking
set nolinebreak		" if wrapping do so only on whitespace
syntax on			
set confirm		" ask on quit
set clipboard=unnamedplus	" use X11 register (change to base on win/unix)
set laststatus=2	" always dispaly status line
set wildignorecase
set completeopt=menu,longest,preview

set splitbelow 		" open new split below current
set splitright		" open new split to the right

set statusline=%<%f%h%m%r%=%b\ 0x%B\ \ %l,%c%V\ %P	"char code in statusline


" webcode
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

" important only in case of leader change or maping to esc
" set timeoutlen=1000 
" set ttimeoutlen=10
" imap jj			<Esc>


colorscheme gruvbox
