local nnoremap = require("config.keymap").nnoremap
local inoremap = require("config.keymap").inoremap
local vnoremap = require("config.keymap").vnoremap
local tnoremap = require("config.keymap").tnoremap

-- Easy window navigation
nnoremap("<C-h>", "<C-w>h")
nnoremap("<C-j>", "<C-w>j")
nnoremap("<C-k>", "<C-w>k")
nnoremap("<C-l>", "<C-w>l")

-- Disabling arrow keys
nnoremap("<up>", "<nop>")
nnoremap("<down>", "<nop>")
nnoremap("<left>", "<nop>")
nnoremap("<right>", "<nop>")

-- Make Y behave like D and C
nnoremap("Y", "y$")

-- Keep screen centered when joining lines
nnoremap("J", "mzJ`z")

-- Add undo break points in insert mode
inoremap(",", ",<C-g>u")
inoremap(".", ".<C-g>u")
inoremap("!", "!<C-g>u")
inoremap("?", "?<C-g>u")

-- Moving text
vnoremap("K", ":m '<-2<CR>gv=gv")
vnoremap("J", ":m '>+1<CR>gv=gv")
inoremap("<C-k>", "<Esc>ml :m .-2<CR>==`la")
inoremap("<C-j>", "<Esc>ml :m .+1<CR>==`la")
nnoremap("<leader>k", ":m .-2<CR>==")
nnoremap("<leader>j", ":m .+1<CR>==")

-- Terminal mappings
tnoremap("<Esc>", "<C-\\><C-n")
