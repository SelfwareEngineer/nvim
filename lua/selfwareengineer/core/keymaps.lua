vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- syntax: keymap.set("<mode_initial>", "<new_key_combo>", "<default_key_combo>", { desc = "<description>"})

-- Plugin manager shortcuts
keymap.set({ "n", "v" }, "<leader>L", "<cmd>Lazy<CR>", { desc = "Open Lazy menu" })
keymap.set({ "n", "v" }, "<leader>M", "<cmd>Mason<CR>", { desc = "Open Mason menu" })

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

-- Allow multiple indents for visual mode
keymap.set("v", "<", "<gv", { desc = "Indent left in visual mode" })
keymap.set("v", ">", ">gv", { desc = "Indent right in visual mode" })

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
keymap.set("n", "X", "x", { desc = "Delete charecter" })
keymap.set("n", "x", '"_x', { desc = "Delete charecter without yank" })

-- Documentation shortcuts
-- Highlight groups :NOTE: Plugins are likely to have highlight group documentation under :h <plugin_name>-highlight-groups or similar
keymap.set({ "n", "v" }, "<leader>rg", "<cmd>h group-name<CR>", { desc = "Read basic syntax highlighting info" })
keymap.set(
	{ "n", "v" },
	"<leader>ra",
	"<cmd>h highlight-groups<CR>",
	{ desc = "Read advanced syntax highlighting info" }
)
keymap.set(
	{ "n", "v" },
	"<leader>rd",
	"<cmd>h diagnostic-highlights<CR>",
	{ desc = "Read diagnostic highlight group documentation" }
)
keymap.set(
	{ "n", "v" },
	"<leader>rt",
	"<cmd>h treesitter-highlight-groups<CR>",
	{ desc = "Read treesitter syntax highlighting info" }
)
-- Health check
keymap.set({ "n", "v" }, "<leader>rh", "<cmd>checkhealth<CR>", { desc = "Perform and read health check" })

-- Use fuzzy finder to quickly jump to another project (via tmux sessionizer)
keymap.set("n", "<C-f>", "<cmd>!tmux neww tmux-sessionizer<CR>", { desc = "Open tmux sessionizer" })

-- Make current file executable
keymap.set("n", "<leader>xe", "<cmd>!chmod +x %<CR>", { desc = "Make current file executable" })

-- Set up boilerplate HTML
keymap.set(
	"n",
	"<leader>!",
	'i<!doctype html><CR><html lang="en"><CR><head><CR><meta charset="UTF-8" /><CR><meta name="viewport" content="width=device-width, initial-scale=2.0" /><CR><link rel="stylesheet" href="style.css" /><CR><script src="script.js" defer></script><CR><title>Document</title><CR></head><CR><body></body><CR></html><ESC>',
	{ desc = "set up boilerplate HTML" }
)

-- Add the extremely annoying text for "required" *s in HTML forms
keymap.set(
	"n",
	"<leader>hr",
	'a<span aria-label="required">*</span><ESC>',
	{ desc = 'Add span for "required" asterisk (HTML forms)' }
)
