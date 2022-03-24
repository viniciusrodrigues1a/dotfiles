if (has("termguicolors"))
  set termguicolors
endif

syntax enable
syntax on

"" set transparent background
autocmd VimEnter * hi Normal guibg=NONE ctermbg=NONE

" let g:tokyonight_style = 'night' " available: night, storm
" let g:tokyonight_enable_italic = 1

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" colorscheme OceanicNext
" colorscheme nord
" colorscheme gruvbox
colorscheme onedark
" colorscheme dracula
" colorscheme darkblue
" colorscheme industry
" colorscheme tokyonight
" colorscheme spaceduck
