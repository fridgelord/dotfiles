call plug#begin('~/.local/share/nvim/plugged')


Plug 'neoclide/coc.nvim', {'branch': 'release'}
set cmdheight=2
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Recently vim can merge signcolumn and number column into one
if has("patch-8.1.1564")
      set signcolumn=number
else
      set signcolumn=yes
endif
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction
nmap <leader>rn <Plug>(coc-rename)

Plug 'sheerun/vim-polyglot'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'romainl/vim-cool' "disable search highlight with movement

Plug 'thinca/vim-quickrun'
let g:quickrun_config = {
      \'*': {
      \'outputter/buffer/split': ':rightbelow vsplit'},}
nnoremap <silent> <F5> :w<CR> :QuickRun python3<CR>
vnoremap <silent> <F5> :w<CR> :QuickRun python3<CR>



call plug#end()


set ignorecase		" ignore case
set smartcase		" but don't ignore it, when search string contains uppercase letters

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap	;	:
cmap		Q	quit
" ctrl+v pastes from + register in insert mode
inoremap <c-v> <esc>:set paste<cr>a<c-r>=getreg('+')<cr><esc>:set nopaste<cr>mi`[=`]`ia

" search & replace word under cursor
:nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>

" remove search highlighting on esc
" nnoremap <silent> <Enter> :noh<cr>


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


" au BufNewFile,BufRead *.py;
    " \ set tabstop=4
    " \ set softtabstop=4
    " \ set shiftwidth=4
    " \ set textwidth=79
    " \ set expandtab
    " \ set autoindent
    " \ set fileformat=unix
set encoding=utf-8

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set nobackup		" DON'T keep a backup file

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
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
" set clipboard=unnamedplus	" use X11 register (change to base on win/unix)
set laststatus=2	" always dispaly status line
set wildignorecase
set completeopt=menu,longest,preview

set splitbelow 		" open new split below current
set splitright		" open new split to the right

set statusline=%<%f%h%m%r%=%b\ 0x%B\ \ %l,%c%V\ %P	"char code in statusline
set cursorline


" webcode
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

" important only in case of leader change or maping to esc
" set timeoutlen=1000 
" set ttimeoutlen=10
" imap jj			<Esc>


" let g:gruvbox_italic = 1
colorscheme gruvbox
set bg=dark
