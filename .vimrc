if !has('nvim')
  set nocompatible
  filetype off
endif

" https://github.com/junegunn/vim-plug
if has('nvim')
  call plug#begin('~/.local/share/nvim/plugged')
else
  call plug#begin()
endif


if !has('ide')
  " save sessions between restarts ############
  if has('nvim')
    Plug 'thaerkh/vim-workspace'
    let g:workspace_autocreate = 1
    let g:workspace_session_directory = $HOME . '/.local/share/nvim/sessions/'
    let g:workspace_undodir = $HOME . '/.local/share/nvim/undo/'
  " else
  "   let g:workspace_session_directory = $HOME . '/.vim/sessions/'
  "   let g:workspace_undodir = $HOME . '/.vim/undo/'
  endif
  " " when workspace plugin doesn't work
  " if has('persistent_undo')
  "   set undofile
  "   if has('nvim')
  "     set undodir=$HOME/.local/share/nvim/undo/
  "   else
  "     set undodir=$HOME/.vim/undo/
  "   endif
  " endif
  " ###########################################


  " display marks on the left #################
  Plug 'kshenoy/vim-signature'
  " ###########################################


  " # ##### Rrun python in buffer ###############
  Plug 'thinca/vim-quickrun'
  let g:quickrun_config = {
        \'*': {
          \'outputter/buffer/split': ':rightbelow vsplit'},}
  nnoremap <silent> <F5> :w<CR> :QuickRun python3<CR>
  vnoremap <silent> <F5> :w<CR> :QuickRun python3<CR>
  " ###############################################


  " Ipython for vim ###########################
  Plug 'jpalardy/vim-slime', { 'for': 'python' }
  Plug 'hanschen/vim-ipython-cell', { 'for': 'python' }
  " let g:ipython_cell_delimit_cells_by = 'marks'
  let g:ipython_cell_delimit_cells_by = 'tags'
  let g:slime_target = 'neovim'
  let g:slime_dont_ask_default = 1

  function! IPythonOpen()
    " open a new terminal in vertical split and run IPython
    vnew|call termopen('ipython --matplotlib')
    file ipython " name the new buffer

    " set slime target to new terminal
    if !exists('g:slime_default_config')
      let g:slime_default_config = {}
    end
    let g:slime_default_config['jobid'] = b:terminal_job_id

    wincmd p " switch to the previous buffer
  endfunction
  " ###########################################


  if has('nvim')
    " CoC ###########################################
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Give more space for displaying messages.
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
    " Use K to show documentation in preview window.
    nnoremap <silent> K :call <SID>show_documentation()<CR>
    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      else
        call CocActionAsync('doHover')
      endif
    endfunction
    nmap <leader>rn <Plug>(coc-rename)
    " ####################################################
  endif


  " Tabline ###########################################
  Plug 'pacha/vem-tabline'
  let g:vem_tabline_show = 2
  let g:vem_tabline_show_number = 'buffnr'
  nmap <C-PageDown> <Plug>vem_next_buffer-
  nmap <C-PageUp> <Plug>vem_prev_buffer-
  " ####################################################


  " ############ run current files in terminal #######################
  Plug 'erietz/vim-terminator'
  let g:terminator_clear_default_mappings="nothing"
  nnoremap <silent> <F5> :TerminatorRunFileInOutputBuffer <CR>
  nnoremap <silent> <F6> :TerminatorStopRun <CR>
  nnoremap <silent> <F8> :TerminatorRunFileInTerminal <CR>
  " #################################################################################
endif

" ############ SMALLER PLUGINS #######################
Plug 'psf/black', {'branch': 'main'}
let g:black_linelength = 100
Plug 'sheerun/vim-polyglot'
Plug 'dhruvasagar/vim-table-mode'  " auto table formatting
let g:table_mode_corner='|'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
nnoremap <C-_> gcc
vnoremap <C-_> gcc
Plug 'tpope/vim-fugitive'
Plug 'romainl/vim-cool' "disable search highlight with movement
Plug 'fridgelord/split-term.vim'
let g:split_term_height = 10
" ####################################################


" ############ UNUSED PLUGINS #######################
" Plug 'moll/vim-bbye'
" Plug 'ActivityWatch/aw-watcher-vim'  " for time tracker
" semantic highlighting for Python in Neovim
" Plug 'numirias/semshi'
" ####################################################

call plug#end()



set ignorecase		" ignore case
set smartcase		" but don't ignore it, when search string contains uppercase letters

nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

if !has('ide')
  nnoremap <C-n> :tabedit %<CR>
  inoremap <C-n> :tabedit %<CR>
endif
inoremap <A-1> 1gt
inoremap <A-2> 2gt
inoremap <A-3> 3gt
inoremap <A-4> 4gt
inoremap <A-5> 5gt
inoremap <A-6> 6gt
inoremap <A-7> 7gt
inoremap <A-8> 8gt
inoremap <A-9> 9gt
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
if has('ide')
 inoremap <c-v> <esc>:set paste<cr>a<c-r>*<cr><esc>:set nopaste<cr>mi`[=`]`ia
endif

" search & replace word under cursor
:nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>
" C-r doesn't work in ideavim using another solution
if has('ide')
  :nnoremap <Leader>s * :%s///g<Left><Left>
endif

" remove search highlighting on esc - when not using romainl's plugin
nnoremap <silent> <Esc> :noh<cr>

" map brackets and gn/gp for diffview to move to prev/next diff
" if &diff
"   map gn ]c
"   ap gp [c
"   map ] ]c
"   map [ [c
" endif

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
set nowritebackup

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
set clipboard=unnamedplus " on linux it's ctrl-c clipboard on, on win it doesn't matter
set laststatus=2	" always dispaly status line
set wildignorecase
set completeopt=menu,longest,preview

set splitbelow 		" open new split below current
set splitright		" open new split to the right

set statusline=%{FugitiveStatusline()}%<%f%h%m%r%=%b\ 0x%B\ \ %l,%c%V\ %P	"char code in statusline + fugitive
set cursorline
set scrolloff=10


" webcode
au BufNewFile,BufRead *.js, *.html, *.css
      \ set tabstop=2
      \ set softtabstop=2
      \ set shiftwidth=2

augroup Markdown
  autocmd!
  autocmd FileType markdown setlocal wrap
  autocmd FileType markdown setlocal linebreak
  autocmd FileType markdown setlocal spell
  autocmd FileType markdown setlocal spelllang=en,pl
augroup END

" important only in case of leader change or maping to esc
" set timeoutlen=1000
" set ttimeoutlen=10
" imap jj			<Esc>


let g:gruvbox_italic = 1
colorscheme gruvbox
set bg=dark

" replace previous spell error with first suggestion in insert
imap <c-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" don't overwrite the register when replacing selected text
vnoremap p "_dp
vnoremap P "_dp

if has('ide')
  set ideajoin=true
  set lookupkeys="<Tab>"
  " plug surround does not work properly (ds" not working for example)
  set surround
endif