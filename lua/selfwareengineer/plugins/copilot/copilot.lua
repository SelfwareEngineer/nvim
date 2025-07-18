return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	build = ":Copilot auth",
	config = function()
		local copilot = require("copilot")
		copilot.setup({
			panel = {
				enabled = true,
				auto_refresh = true,
				keymap = {
					jump_prev = "[[",
					jump_next = "]]",
					accept = "<CR>",
					refresh = "gr",
					open = "<M-p>",
				},
				layout = {
					position = "bottom", -- | top | left | right
					ratio = 0.4,
				},
			},
			suggestion = {
				enabled = true, --:INFO: Turn copilot suggestions on/off
				auto_trigger = true,
				hide_during_completion = true,
				debounce = 75,
				keymap = {
					accept = "<M-a>",
					accept_word = "<M-w>",
					accept_line = "<M-m>",
					next = "<M-l>",
					prev = "<M-h>",
					dismiss = "<M-d>",
				},
			},
			filetypes = {
				yaml = false,
				markdown = false,
				help = false,
				gitcommit = false,
				gitrebase = false,
				hgcommit = false,
				svn = false,
				cvs = false,
				["*"] = true,
				["^."] = false,
			},
			copilot_node_command = "node", -- Node.js version must be > 18.x
			server_opts_overrides = {},
		})
		vim.keymap.set({ "n", "v" }, "<leader>co", "<cmd>Copilot suggestion toggle_auto_trigger<CR>", {
			desc = "Toggle Copilot Suggestions",
		})
	end,
}
