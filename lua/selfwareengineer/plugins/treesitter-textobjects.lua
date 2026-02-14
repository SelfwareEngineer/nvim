return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	lazy = true,
	config = function()
		require("nvim-treesitter-textobjects").setup({
			textobjects = {
				select = {
					enable = true,

					-- Automatically jump forward to textobj, similar to targets.vim
					lookahead = true,

					-- Keymaps for selecting code objects (not sure why *this* section is called keymaps and the others aren't, but whatev)
					keymaps = {
						-- You can use the capture groups defined in textobjects.scm
						-- You can optionally set descriptions to the mappings (used in the desc parameter of
						-- nvim_buf_set_keymap) which plugins like which-key display

						-- You can also use captures from other query groups like `locals.scm`
						["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },

						-- Assignment selection
						["a="] = { query = "@assignment.outer", desc = "select around assignment" },
						["i="] = { query = "@assignment.inner", desc = "select in assignment" },
						["l="] = { query = "@assignment.lhs", desc = "select left hand side of an assignment" },
						["r="] = { query = "@assignment.rhs", desc = "select right hand side of an assignment" },

						-- Param/arg selection
						["aa"] = { query = "@parameter.outer", desc = "select around parameter/argument" },
						["ia"] = { query = "@parameter.inner", desc = "select in parameter/argument" },

						-- Conditional selection
						["ai"] = { query = "@conditional.outer", desc = "select around conditional" },
						["ii"] = { query = "@conditional.inner", desc = "select in conditional" },

						-- Loop selection
						["al"] = { query = "@loop.outer", desc = "select around loop" },
						["il"] = { query = "@loop.inner", desc = "select in loop" },

						-- Function call selection
						["af"] = { query = "@call.outer", desc = "Select around function call" },
						["if"] = { query = "@call.inner", desc = "Select in function call" },

						-- Function/method definition selection
						["am"] = { query = "@function.outer", desc = "Select around function/method definition" },
						["im"] = { query = "@function.inner", desc = "Select in function/method definition" },

						-- Class selection
						["ac"] = { query = "@class.outer", desc = "Select around class" },
						["ic"] = { query = "@class.inner", desc = "Select in class" },
					},
				},

				-- Keymaps for swapping different types of code objects around with each other
				swap = {
					enable = true,
					swap_next = {
						["<leader>na"] = { query = "@parameter.inner", desc = "Swap parameter/argument with next" },
						["<leader>nm"] = { query = "@function.outer", desc = "Swap function with next" },
					},
					swap_previous = {
						["<leader>pa"] = { query = "@parameter.inner", desc = "Swap parameter/argument with previous" },
						["<leader>pm"] = { query = "@function.outer", desc = "Swap function with previous" },
					},
				},

				-- Keymaps for navigating based on code objects
				move = {
					enable = true,
					set_jumps = true, -- Whether to set jumps in the jumplist
					goto_next_start = {
						["]f"] = { query = "call.outer", desc = "Jump to next function call start" },
						["]m"] = { query = "function.outer", desc = "Jump to next method/function definition start" },
						["]c"] = { query = "class.outer", desc = "Jump to next class start" },
						["]i"] = { query = "conditional.outer", desc = "Jump to next conditional start" },
						["]l"] = { query = "loop.outer", desc = "Jump to next loop start" },
					},
					goto_next_end = {
						["]F"] = { query = "call.outer", desc = "Jump to next function call end" },
						["]M"] = { query = "function.outer", desc = "Jump to next method/function definition end" },
						["]C"] = { query = "class.outer", desc = "Jump to next class end" },
						["]I"] = { query = "conditional.outer", desc = "Jump to next conditional end" },
						["]L"] = { query = "loop.outer", desc = "Jump to next loop end" },
					},
					goto_previous_start = {
						["[f"] = { query = "call.outer", desc = "Jump to previous function call start" },
						["[m"] = {
							query = "function.outer",
							desc = "Jump to previous method/function definition start",
						},
						["[c"] = { query = "class.outer", desc = "Jump to previous class start" },
						["[i"] = { query = "conditional.outer", desc = "Jump to previous conditional start" },
						["[l"] = { query = "loop.outer", desc = "Jump to previous loop start" },
					},
					goto_previous_end = {
						["[F"] = { query = "call.outer", desc = "Jump to previous function call end" },
						["[M"] = { query = "function.outer", desc = "Jump to previous method/function definition end" },
						["[C"] = { query = "class.outer", desc = "Jump to previous class end" },
						["[I"] = { query = "conditional.outer", desc = "Jump to previous conditional end" },
						["[L"] = { query = "loop.outer", desc = "Jump to previous loop end" },
					},
				},
			},
		})
		local ts_repeat_move = require("nvim-treesitter-textobjects.repeatable_move")

		-- vim way: ; goes to the direction you were moving.
		vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
		vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)

		-- The above breaks f, F, t, and T's ; and , functionality, this fixes that.
		vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
		vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
		vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
		vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })
	end,
}
