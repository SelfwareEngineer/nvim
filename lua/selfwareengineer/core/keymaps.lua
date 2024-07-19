vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- syntax: keymap.set("mode initial", "new key/combo", "default key", { desc = "<description>"})

-- Primagen's sacriligous ESC remap that I happen to completely agree with
keymap.set("i", "<C-c>", "<ESC>", { desc = "Exit insert mode with ctrl+c" })

-- Increment and decrement numbers
keymap.set("n", "<leader>.", "<C-a>", { desc = "Increment num" })
keymap.set("n", "<leader>,", "<C-x>", { desc = "Decrement num" })

-- Window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make split windows equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close currently selected split" })

-- Tab management
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- Yank to system clipboard
keymap.set("n", "<leader>y", '"+y')
keymap.set("v", "<leader>y", '"+y')
keymap.set("n", "<leader>Y", '"+Y')

-- Misc
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
keymap.set("n", "zv", vim.cmd.Ex, { desc = "Return to Explorer" })
keymap.set("x", "<leader>p", '"_dp', { desc = "Paste without yank" })

-- Highlight dragging in visual mode
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

-- Line append without moving cursor
keymap.set("n", "J", "mzJ`z", { desc = "Append line below without moving cursor" })

-- Keep cursor in the middle with various movements
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Move half page down" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Move half page up" })
keymap.set("n", "n", "nzzzv", { desc = "Move to next search result" })
keymap.set("n", "N", "Nzzzv", { desc = "Move to previous search result" })

-- Add blank line w/o entering insert mode
keymap.set("n", "<leader>o", "o<ESC>", { desc = "Add blank line below (no insert mode)" })
keymap.set("n", "<leader>O", "O<ESC>", { desc = "Add blank line above (no insert mode)" })

-- Options to avoid losing buffer
keymap.set("x", "<leader>p", '"_dp', { desc = "Paste without yank" })
keymap.set("n", "<leader>d", '"_d', { desc = "Delete without yank (normal)" })
keymap.set("v", "<leader>d", '"_d', { desc = "Delete without yank (visual)" })
keymap.set("n", "<leader>c", '"_c', { desc = "Change without yank (normal)" })
keymap.set("v", "<leader>c", '"_c', { desc = "Change without yank (visual)" })

-- wtf does this do actually
keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", { desc = "Open tmux sessionizer" })

-- Set up boilerplate HTML
keymap.set(
	"n",
	"<leader>!",
	'i<!doctype html><CR><html lang="en"><CR><Tab><head><CR><Tab><Tab><meta charset="UTF-8" /><CR><Tab><Tab><meta name="viewport" content="width=device-width, initial-scale=2.0" /><CR><Tab><Tab><link rel="stylesheet" href="style.css" /><CR><Tab><Tab><script src="script.js" defer></script><CR><Tab><Tab><title>Document</title><CR><Tab></head><CR><Tab><body></body><CR></html><ESC>',
	{ desc = "set up boilerplate HTML" }
)

-- Add the extremely annoying text for "required" *s in HTML forms
keymap.set(
	"n",
	"<leader>hr",
	'a<span aria-label="required">*</span><ESC>',
	{ desc = 'Add span for "required" asterisk (HTML forms)' }
)
