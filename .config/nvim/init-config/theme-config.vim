if (has("termguicolors"))
  set termguicolors
endif

syntax enable
syntax on

" Set transparent background
" autocmd VimEnter * hi Normal guibg=NONE ctermbg=NONE

let g:tokyonight_style = 'storm' " available: night, storm
let g:tokyonight_enable_italic = 1

" colorscheme OceanicNext
" colorscheme nord
" colorscheme gruvbox
" colorscheme dracula
" colorscheme darkblue
" colorscheme industry
colorscheme tokyonight
