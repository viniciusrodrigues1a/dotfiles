local opt = vim.opt

-- line numbers
opt.relativenumber = true
opt.number = true

-- indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true

-- search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true
opt.inccommand = "split"

-- appearance
opt.list = true
opt.listchars = { tab = "│·", trail = "·", nbsp = "~", extends = "›", precedes = "‹" }
vim.cmd("set showbreak=⤷\\")
vim.cmd("set signcolumn=yes:1")

-- other configs
opt.guicursor = ""
opt.wrap = false
opt.swapfile = false
opt.cmdheight = 2
opt.scrolloff = 5

vim.g.mapleader = " "

-- netrw config
vim.g.netrw_bufsettings = "noma nomod nu nobl nowrap ro"
vim.g.netrw_banner = 0
-- do not create entries in the .netrwhist file
vim.g.netrw_dirhistmax = 0
vim.cmd("autocmd FileType netrw set nolist")
