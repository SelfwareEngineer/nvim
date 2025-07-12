return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-autopairs",
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	config = function()
		-- import nvim-treesitter plugin
		local treesitter = require("nvim-treesitter.configs")

		-- configure treesitter
		treesitter.setup({ -- enable syntax highlighting
			highlight = {
				enable = true,
			},
			-- enable indentation
			indent = { enable = true },
			-- ensure these language parsers are installed
			ensure_installed = {
				"bash",
				"c",
				"css",
				"dockerfile",
				"gitignore",
				"graphql",
				"html",
				"json",
				"javascript",
				"lua",
				"markdown",
				"markdown_inline",
				"python",
				"query",
				"regex",
				"svelte",
				"tsx",
				"typescript",
				"vim",
				"vimdoc",
				"yaml",
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<leader>ts",
					node_incremental = "<leader>t",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
		})
	end,
}
