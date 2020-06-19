"True Colors on term set termguicolors

set termguicolors
"Syntax highlighting
syntax on

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

"Disables the compatibility with vi features
set nocompatible

"Shift command width
set shiftwidth=4

"Line numbers
set number

"highlight LineNr ctermfg=grey

" Bit more space for messages display
set cmdheight=2

"Disables sound when getting to end of line
set noerrorbells

"Sets a visual bell instead of beeping
set visualbell

"Size of tab (visual appearance of tab)
set tabstop=4

"Size of tab in software
set softtabstop=4

"Tabs are spaces
set expandtab

"Shows the command at the bottom bar
set showcmd

"Identifies specific file types and loads the filetype-specific indent files
filetype plugin indent on

"Autocomplete menu
set wildmenu

" Shows the mathcing brackets
set showmatch

"Shows results of search as you type
set incsearch

"Highlights the matches of the search
set hlsearch
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
"Folding codeblocks for easier navigation through code
"set foldenable

"Sets the starting fold level by default. 0 means all blocks will
"be folded by default. 10 only heavily nested blocks are folded. 99 all blocks
"are open by default
"set foldlevelstart=10

"Folds based on indentation
"set foldmethod=indent

"Draws a bar at the 80 character location
"set colorcolumn=80
"highlight ColorColumn ctermbg=0 guibg=lightgrey

"autoindentation smarter than autoindent
set smartindent

"Sets the leader key to space
let mapleader=" "

"Search down into subfolders
"Provides tab-completion for  all file-related tasks
"set path+=**

call plug#begin('~/.vim/plugged')


Plug 'gruvbox-community/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'mattn/emmet-vim'


call plug#end()

imap jj <Esc>

let g:gruvbox_italic=1

let g:gruvbox_contrast_dark='hard'

colorscheme gruvbox
set background=dark

let mapleader = " "

"let g:netrw_browse_split = 2
"let g:vrfr_rg = 'true'
"let g:netrw_banner = 0
"let g:netrw_winsize = 25

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
"nnoremap <C-p> :GFiles<CR>
"nnoremap <Leader>pf :Files<CR>
"nnoremap <Leader>+ :vertical resize +5<CR>
"nnoremap <Leader>- :vertical resize -5<CR>

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"


function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" GoTo code navigation.
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
nnoremap <leader>cr :CocRestart

