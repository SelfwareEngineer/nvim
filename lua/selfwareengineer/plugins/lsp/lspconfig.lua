return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"mason-org/mason.nvim",
		"mason-org/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp", -- LSP completion source for nvim-cmp
		{ "antosha417/nvim-lsp-file-operations", config = true }, -- auto file renames, etc
		{ "folke/neodev.nvim", opts = {} }, -- improved Lua support in config files
	},
	config = function()
		local lspconfig = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local capabilities = cmp_nvim_lsp.default_capabilities() -- enhance autocomplete capabilities

		-- Define LSP diagnostic icons
		vim.diagnostic.config({
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "",
					[vim.diagnostic.severity.WARN] = "",
					[vim.diagnostic.severity.HINT] = "󰠠",
					[vim.diagnostic.severity.INFO] = "",
				},
			},
		})

		-- Reusable on_attach function for LSP keybindings
		local on_attach = function(client, bufnr)
			local builtin = require("telescope.builtin")
			local opts = { buffer = bufnr, silent = true }
			-- set keybinds
			opts.desc = "Show LSP references"
			vim.keymap.set("n", "gR", builtin.lsp_references, opts) -- show definition, references

			opts.desc = "Go to declaration"
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

			opts.desc = "Show LSP definitions"
			vim.keymap.set("n", "gd", builtin.lsp_definitions, opts) -- show lsp definitions

			opts.desc = "Show LSP implementations"
			vim.keymap.set("n", "gI", builtin.lsp_implementations, opts) -- show lsp implementations

			opts.desc = "Show LSP type definitions"
			vim.keymap.set("n", "gy", builtin.lsp_type_definitions, opts) -- show lsp type definitions

			opts.desc = "See available code actions"
			vim.keymap.set({ "n", "v" }, "<leader>xa", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

			opts.desc = "Smart rename"
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

			opts.desc = "Show documentation for what is under cursor"
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

			opts.desc = "Restart LSP"
			vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
			-- print("LSP attached to buffer " .. bufnr)
		end

		for _, server_name in ipairs(mason_lspconfig.get_installed_servers()) do
			vim.lsp.config(server_name, {
				capabilities = capabilities,
				on_attach = on_attach,
			})
			-- print("LSP server " .. server_name .. " configured")
		end
	end,
}
