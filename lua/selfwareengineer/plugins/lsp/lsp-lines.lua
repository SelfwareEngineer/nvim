return {
	"ErichDonGubler/lsp_lines.nvim",
	config = function()
		local lsp_lines = require("lsp_lines")
		lsp_lines.setup()
		vim.diagnostic.config({
			virtual_text = false, -- Disable default virtual text
			virtual_lines = true, -- Enable virtual lines, which is what lsp_lines uses
		})
		vim.keymap.set("n", "<leader>ll", lsp_lines.toggle, {
			desc = "Toggle LSP Lines",
		})
	end,
}
