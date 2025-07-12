return {
	"folke/which-key.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "echasnovski/mini.nvim" },
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	opts = {
		-- add opts here or leave empty to use default settings
	},
}
