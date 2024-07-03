return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"mxsdev/nvim-dap-vscode-js",
	},
	config = function()
		local dap, dapui = require("dap"), require("dapui")

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		dap.adapters.python = {
			type = "executable",
			command = os.getenv("HOME") .. "/.virtualenvs/debugpy/bin/python",
			args = { "-m", "debugpy.adapter" },
		}

		dap.adapters.chrome = {
			type = "executable",
			command = "node",
			args = { os.getenv("HOME") .. "~/microsoft/vscode-chrome-debug/out/src/chromeDebug.js" }, -- TODO adjust
		}

		dap.configurations.javascript = { -- change this to javascript if needed
			{
				type = "chrome",
				request = "attach",
				program = "${file}",
				cwd = vim.fn.getcwd(),
				sourceMaps = true,
				protocol = "inspector",
				port = 9222,
				webRoot = "${workspaceFolder}",
			},
		}

		dap.configurations.javascriptreact = { -- change this to javascript if needed
			{
				type = "chrome",
				request = "attach",
				program = "${file}",
				cwd = vim.fn.getcwd(),
				sourceMaps = true,
				protocol = "inspector",
				port = 9222,
				webRoot = "${workspaceFolder}",
			},
		}

		dap.configurations.typescript = { -- change to typescript if needed
			{
				type = "chrome",
				request = "attach",
				program = "${file}",
				cwd = vim.fn.getcwd(),
				sourceMaps = true,
				protocol = "inspector",
				port = 9222,
				webRoot = "${workspaceFolder}",
			},
		}

		dap.configurations.typescriptreact = { -- change to typescript if needed
			{
				type = "chrome",
				request = "attach",
				program = "${file}",
				cwd = vim.fn.getcwd(),
				sourceMaps = true,
				protocol = "inspector",
				port = 9222,
				webRoot = "${workspaceFolder}",
			},
		}

		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>bb", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
		keymap.set("n", "<leader>bd", dap.continue, { desc = "Start/stop debugging" })
		keymap.set("n", "<leader>bs", dap.step_over, { desc = "Debugger step over" })
		keymap.set("n", "<leader>bi", dap.step_into, { desc = "Debugger step into" })
		keymap.set("n", "<leader>bo", dap.step_out, { desc = "Debugger step out" })
		keymap.set("n", "<leader>bn", dap.repl.open, { desc = "Debugger inspect state" })
	end,
}
