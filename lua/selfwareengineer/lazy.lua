local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ import = "selfwareengineer.plugins" },
	{ import = "selfwareengineer.plugins.lsp" },
	{ import = "selfwareengineer.plugins.copilot" },
	{ import = "selfwareengineer.plugins.debuggers" },
}, {
	checker = {
		enabled = true,
		notify = false,
	},
})
