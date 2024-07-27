local nnoremap = require("core.keymaps.util").nnoremap
local inoremap = require("core.keymaps.util").inoremap
local vnoremap = require("core.keymaps.util").vnoremap
local tnoremap = require("core.keymaps.util").tnoremap

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
tnoremap("<Esc>", "<C-\\><C-n>")
