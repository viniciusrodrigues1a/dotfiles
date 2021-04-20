" Map <Leader> to space-bar
:let mapleader = "\<Space>"

" Do not create entries in the .netrwhist file
:let g:netrw_dirhistmax = 0

" Setting tab width, use spaces instead of tabs
set expandtab
set smarttab
set tabstop=2
set shiftwidth=2
set softtabstop=2

" Enable mouse
set mouse=a

" Display numbers
set number
set relativenumber

" Incremental substitution
set inccommand=split

" Do not create swap files
set noswapfile

" Do not wrap lines
set nowrap

" Display different types of white spaces.
set list
set listchars=tab:│·,trail:·,extends:›,precedes:‹,nbsp:~
set showbreak=⤷\

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Disabling arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Display 5 lines above/below the cursor when scrolling
set scrolloff=5
