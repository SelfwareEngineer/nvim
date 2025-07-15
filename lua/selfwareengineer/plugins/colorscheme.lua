return {
	"selfwareengineer/city-lights.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-tree.lua",
	},
	config = function()
		require("city-lights").setup()
	end,
}
