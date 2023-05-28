local set = vim.opt
local indent = 4

set.guicursor = ""
set.nu = true
set.relativenumber = true
set.tabstop = indent
set.softtabstop = indent
set.shiftwidth = indent
set.expandtab = true
set.hlsearch = false
set.incsearch = true
set.inccommand = "split"
set.smartindent = true
set.wrap = false
set.swapfile = false
set.cmdheight = 2
set.scrolloff=5
set.list = true
set.listchars = { tab = "│·", trail = "·", nbsp = "~", extends = "›", precedes = "‹" }
-- set.mouse="a"
vim.cmd("set showbreak=⤷\\")
vim.cmd("set signcolumn=yes:1")

-- Netrw config
vim.g.netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
vim.g.netrw_banner = 0
-- Do not create entries in the .netrwhist file
vim.g.netrw_dirhistmax = 0
vim.cmd("autocmd FileType netrw set nolist")

vim.g.mapleader = " "
