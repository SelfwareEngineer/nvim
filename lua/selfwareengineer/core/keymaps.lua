vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- syntax: keymap.set("mode initial", "new key/combo", "default key", { desc = "<description>"})

-- Return to Normal Mode
keymap.set("i", "zm", "<ESC>", { desc = "exit insert mode with 'zm'" })
keymap.set("v", "zm", "<ESC>", { desc = "exit visual mode with 'zm'" })

-- Increment and decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment num" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement num" })

-- Window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make split windows equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close currently selected split" })

-- Tab management
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "" })

-- Yank to system clipboard - BROKEN
keymap.set("n", "<leader>y", '"+y')
keymap.set("v", "<leader>y", '"+y')
keymap.set("n", "<leader>Y", '"+Y')

-- Misc
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
keymap.set("n", "zv", vim.cmd.Ex, { desc = "Return to Explorer" })
keymap.set("x", "<leader>p", '"_dp', { desc = "Paste without yank" })
