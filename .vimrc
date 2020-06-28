set nocompatible

syntax on

set number

set relativenumber

set termguicolors

inoremap jj <Esc>

set ruler

set showcmd

set wildmenu

set incsearch

set hlsearch

set cmdheight=2

filetype plugin indent on

set smartindent

set backspace=indent,eol,start

set noerrorbells

set shiftwidth=4

set tabstop=4

set softtabstop=4

set expandtab

set background=dark

"This loads the "matchit" plugin if the required features are available.
"It makes the |%| command more powerful.
if has('syntax') && has('eval')
  packadd! matchit
endif

"See help user txt file #5 for reference
if has("vms")
	  set nobackup
	else
	  set backup
	  if has('persistent_undo')
	    set undofile
	  endif
	endif



"###############################################
"           PLUGINS
"###############################################    


call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'jiangmiao/auto-pairs'
"Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'mattn/emmet-vim'
Plug 'dracula/vim', { 'as': 'dracula'  }
"Support for ejs syntax highlighting
Plug 'nikvdp/ejs-syntax'
Plug 'pangloss/vim-javascript'



call plug#end()

"Editor theme
 colorscheme dracula

"Vim-airline configuration for better tabs
let g:airline#extensions#tabline#enabled = 1

"Changes how file paths are displayed in each tab
let g:airline#extensions#tabline#formatter = 'unique_tail'

"Prettier command for coc-prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

"#########################################################
"Settings to better coc
"#########################################################

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

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

    " Use <cr> to confirm completion, `<C-g>u` means break undo chain at
    " current
    " position. Coc only does snippet and additional edit on confirm.
    " <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
"    if exists('*complete_info')
"          inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>"
"          : "\<C-g>u\<CR>"
"      else
"            inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"        endif

"###############################################
"    CocNavigation
"###############################################

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location
" list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)"
