" Map <Leader> to space-bar
:let mapleader = "\<Space>"

let g:python3_host_prog = "/usr/bin/python3"

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
set listchars=tab:│·,trail:·,eol:⤶,extends:›,precedes:‹,nbsp:~
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

" Netrw config
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
let g:netrw_banner = 0
" Do not create entries in the .netrwhist file
:let g:netrw_dirhistmax = 0
autocmd FileType netrw set nolist

" Remaps
" Make Y behave like D and C
nnoremap Y y$

" Keeping it centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Undo break points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" Add K, J to jump history
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

" Moving text
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv
inoremap <c-k> <esc>ml :m .-2<CR>==`la
inoremap <c-j> <esc>ml :m .+1<CR>==`la
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==
