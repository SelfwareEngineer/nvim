return {
	-- old colorscheme: ayu-dark
	-- "Shatur/neovim-ayu",
	"craftzdog/solarized-osaka.nvim",
	priority = 1000,
	config = function()
		vim.cmd("colorscheme solarized-osaka")
		vim.cmd([[
            highlight CursorLine guibg=#000909
        ]])
	end,
}
