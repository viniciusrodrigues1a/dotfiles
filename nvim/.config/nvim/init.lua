vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ==============
-- Options
-- ==============
-- vim.opt.clipboard = 'unnamedplus'
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.wrap = false
vim.opt.smartcase = true
vim.opt.swapfile = false
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.g.netrw_bufsettings = "noma nomod nu nobl nowrap ro"
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false
vim.opt.hlsearch = true

-- ==============
-- Keybindings
-- ==============
vim.cmd("nnoremap <leader>vc <cmd>e ~/.config/nvim/init.lua<CR>")
vim.cmd("nnoremap <leader>rc <cmd>source ~/.config/nvim/init.lua<CR>")
vim.cmd("nnoremap <Esc> <cmd>nohlsearch<CR>")
vim.cmd("nnoremap <C-h> <C-w>h")
vim.cmd("nnoremap <C-l> <C-w>l")
vim.cmd("nnoremap <C-j> <C-w>j")
vim.cmd("nnoremap <C-k> <C-w>k")
vim.cmd("tnoremap <Esc> <C-\\><C-n>")
vim.keymap.set("n", "<leader>e", function()
	print(vim.bo.filetype)
	if vim.bo.filetype == "netrw" then
		vim.cmd("b#")
	else
		vim.cmd("Ex")
	end
end)

-- ==============
-- Plugins
-- ==============
vim.api.nvim_create_autocmd(
	"PackChanged",
	{ -- builds blink.cmp's fuzzy finder after install. To do this manually, go to ~/.local/share/nvim/site/pack/core/opt/blink.cmp and run cargo build --release
		pattern = "blink.cmp",
		callback = function(args)
			vim.system({ "cargo", "build", "--release" }, { cwd = args.data.path }, function(obj)
				vim.schedule(function()
					if obj.code == 0 then
						vim.notify("blink.cmp's fuzzy finder built successfully!", vim.log.levels.INFO)
					else
						vim.notify("blink.cmp's fuzzy finder build failed!", vim.log.levels.ERROR)
					end
				end)
			end)
		end,
	}
)

vim.pack.add({
	{ src = "https://github.com/folke/tokyonight.nvim" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/stevearc/conform.nvim" },
	{
		src = "https://github.com/Saghen/blink.cmp",
		name = "blink.cmp",
	},
	{ src = "https://github.com/L3MON4D3/LuaSnip" },
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
	{ src = "https://github.com/windwp/nvim-autopairs" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/NMAC427/guess-indent.nvim" },
})

-- ==============
-- Colorscheme
-- ==============
vim.cmd("colorscheme tokyonight")

-- ==============
-- LSP configuration
-- ==============
-- :help lsp-defaults			-> "gra" (code_action), "gri" (impl), "grn" (rename), "grr" (ref), "grt" (type_def ), "gO" (doc_symbol)
-- :help diagnostic-defaults	-> "]d" (next), "[d" (prev), "]D" (first), "[D" (last), "<C-w>d" (at cursor)
vim.keymap.set("n", "grd", vim.lsp.buf.definition) -- why do we have all those defaults, but not vim.lsp.buf.definition? who knows

vim.lsp.enable("gopls")
vim.lsp.enable("lua_ls")
vim.lsp.enable("superhtml")
vim.lsp.enable("ts_ls")
vim.lsp.enable("sqls")
vim.lsp.enable("sqls")
vim.lsp.enable("pyright")
-- vim.lsp.enable("sqlls")

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			diagnostics = { globals = { "vim" } },
			workspace = { library = vim.api.nvim_get_runtime_file("", true) },
		},
	},
})

-- ==============
-- TreeSitter configuration
-- ==============
require("nvim-treesitter.configs").setup({
	modules = {},
	auto_install = true,
	sync_install = false,
	ignore_install = {},
	ensure_installed = {},
	highlight = { enable = true },
})

-- ==============
-- Conform configuration to format on save and format injected languages
-- ==============
local conform = require("conform")
conform.setup({
	default_format_opts = {
		lsp_format = "fallback",
	},
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
		javascript = { "prettierd", "prettier" },
		typescript = { "prettierd", "prettier" },
		typescriptreact = { "prettierd", "prettier" },
		javascriptreact = { "prettierd", "prettier" },
		html = { "prettierd", "prettier" },
		css = { "prettierd", "prettier" },
		json = { "prettierd", "prettier" },
		sql = { "sqlfmt" },
		go = { "gofumpt", "goimports-reviser" },
		["*"] = { "injected" },
	},
	formatters = {
		injected = {
			options = {
				ignore_errors = false,
				lang_to_ext = {
					bash = "sh",
					c_sharp = "cs",
					javascript = "js",
					latex = "tex",
					markdown = "md",
					python = "py",
					rust = "rs",
					typescript = "ts",
					sql = "sql",
					go = "go",
					lua = "lua",
				},
				lang_to_formatters = {},
			},
		},
	},
})

local function conformFormat(bufnr, async)
	local function callback()
		local formatter_names = vim.tbl_map(function(f)
			return f.name
		end, conform.list_formatters_to_run(bufnr))

		FlashStatusLineMsg("fmts: " .. table.concat(formatter_names, ", "))
	end

	conform.format({ bufnr = bufnr, async = async }, callback)
end

function FlashStatusLineMsg(msg)
	vim.g.status_line_msg = { text = msg, target_win = vim.api.nvim_get_current_win() }
	vim.cmd("redrawstatus")
	vim.defer_fn(function()
		vim.g.status_line_msg = nil
		vim.cmd("redrawstatus")
	end, 750)
end

function StatusLine()
	local flash_msg = ""

	if vim.g.status_line_msg ~= nil then
		local target_win = vim.g.status_line_msg.target_win
		local drawing_win = vim.g.statusline_winid

		if target_win == drawing_win then
			flash_msg = vim.g.status_line_msg.text
		end
	end

	local left = "%f %m %r %n %#WarningMsg#" .. flash_msg .. "%*"
	local right = "%l:%c/%L"

	return left .. "%=" .. right
end

vim.opt.statusline = "%!v:lua.StatusLine()"

vim.api.nvim_create_autocmd("BufWritePost", { -- format after save
	pattern = "*",
	callback = function(args)
		conformFormat(args.buf)
	end,
})

vim.keymap.set("n", "<leader>f", conformFormat)

-- ==============
-- ==============
-- Completions configuration ==============
local blink = require("blink.cmp")
blink.setup({
	snippets = { preset = "luasnip" },
	keymap = {
		preset = "default",
		["<Enter>"] = { "select_and_accept", "fallback" },
	},
	appearance = {
		use_nvim_cmp_as_default = true,
	},
	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},
})

-- ==============
-- Telescope configuration
-- ==============
local telescope = require("telescope.builtin")

vim.keymap.set("n", "<leader>sf", telescope.find_files)
vim.keymap.set("n", "<leader>sg", telescope.live_grep)
vim.keymap.set("n", "<leader>sb", telescope.buffers)
vim.keymap.set("n", "<leader>sd", function()
	telescope.diagnostics({
		bufnr = nil,
		sort_by = "severity",
	})
end)

-- ==============
-- others
-- ==============
require("luasnip.loaders.from_vscode").lazy_load()
require("snippets.golang")

require("guess-indent").setup({})
require("nvim-autopairs").setup({})
require("mason").setup({})
