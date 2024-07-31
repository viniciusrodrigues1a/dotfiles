return {
	"nvim-treesitter/nvim-treesitter-context",
	config = function()
		local treesitter_context = require("treesitter-context")

		local keymap = vim.keymap
		local opts = { noremap = true, silent = true }
		local on_attach = function(bufnr)
			opts.buffer = bufnr

			opts.desc = "Jump to outer context"
			keymap.set("n", "<leader>fu", function()
				treesitter_context.go_to_context(vim.v.count1)
			end, opts)
		end

		treesitter_context.setup({
			enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
			max_lines = 5, -- How many lines the window should span. Values <= 0 mean no limit.
			min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
			line_numbers = true,
			multiline_threshold = 20, -- Maximum number of lines to show for a single context
			trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
			mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
			-- Separator between context and content. Should be a single character string, like '-'.
			-- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
			separator = nil,
			zindex = 20, -- The Z-index of the context window
			on_attach = on_attach, -- (fun(buf: integer): boolean) return false to disable attaching
		})
	end,
}
