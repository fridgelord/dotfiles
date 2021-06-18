call plug#begin('~/.local/share/nvim/plugged')

Plug 'kshenoy/vim-signature' " display marks on the left

Plug 'jpalardy/vim-slime', { 'for': 'python' }
let g:slime_target = "neovim"
Plug 'hanschen/vim-ipython-cell', { 'for': 'python' }
let g:ipython_cell_delimit_cells_by = 'marks'

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
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'romainl/vim-cool' "disable search highlight with movement
Plug 'fridgelord/split-term.vim'
let g:split_term_height = 10
Plug 'pacha/vem-tabline'
let g:vem_tabline_show = 2
let g:vem_tabline_show_number = 'buffnr'
nnoremap <C-PageDown> <Plug>vem_next_buffer-
nnoremap <C-PageUp> <Plug>vem_prev_buffer-


Plug 'thinca/vim-quickrun'
let g:quickrun_config = {
      \'*': {
      \'outputter/buffer/split': ':rightbelow vsplit'},}
nnoremap <silent> <F5> :w<CR> :QuickRun python3<CR>
vnoremap <silent> <F5> :w<CR> :QuickRun python3<CR>



call plug#end()


set ignorecase		" ignore case
set smartcase		" but don't ignore it, when search string contains uppercase letters

nnoremap <A-j> <C-w><C-j>
nnoremap <A-k> <C-w><C-k>
nnoremap <A-l> <C-w><C-l>
nnoremap <A-h> <C-w><C-h>

nnoremap <A-1> 1gt
nnoremap <A-2> 2gt
nnoremap <A-3> 3gt
nnoremap <A-4> 4gt
nnoremap <A-5> 5gt
nnoremap <A-6> 6gt
nnoremap <A-7> 7gt
nnoremap <A-8> 8gt
nnoremap <A-9> 9gt

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
" set nobackup		" DON'T keep a backup file

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

set statusline=%{FugitiveStatusline()}%<%f%h%m%r%=%b\ 0x%B\ \ %l,%c%V\ %P	"char code in statusline
set cursorline
set scrolloff=99


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
