return {
	"craftzdog/solarized-osaka.nvim",
	name = "solarized-osaka",
	priority = 1000,
	config = function()
		require("solarized-osaka").setup({
			-- transparent = true, -- Enable transparent background
			terminal_colors = true, -- Enable terminal colors
			styles = {
				comments = { italic = false }, -- No styling for comments
				variables = {}, -- No styling for variables
				keywords = { italic = true }, -- Italic keywords
				functions = { italic = true, bold = true }, -- Bold + italic functions

				sidebars = "dark", -- Dark sidebars
				floats = "dark", -- Dark floating windows
			},
			sidebars = { "qf", "help" }, -- Specify sidebars to apply dark style
			dim_inactive = true, -- Dim inactive windows
			lualine_bold = true, -- Bold lualine section
			-- See custom-theme.lua to tweak colors
		})
		vim.cmd("colorscheme solarized-osaka")
		vim.cmd([[
            highlight CursorLine guibg=#000909
        ]])
	end,
}
