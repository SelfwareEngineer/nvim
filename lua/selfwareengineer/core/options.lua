vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt -- for conciseness

-- navigation
opt.relativenumber = true -- shows relative numbers to the cursor line to make vim movements easier
opt.number = true
opt.scrolloff = 8

-- tabs and indentation
opt.tabstop = 4 -- 4 spaces for a tab
opt.softtabstop = 4 -- 4 spaces for tab key
opt.shiftwidth = 4 -- 4 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one
opt.smartindent = true -- smart indenting on new lines
opt.wrap = true -- wrap lines at the edge of the window

-- backspace behavior
opt.backspace = { "indent", "eol", "start" } -- allow backspacing over indent, end of line, and start of insert

-- undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]]) -- undercurl for diagnostics
vim.cmd([[let &t_Ce = "\e[4:0m"]]) -- reset undercurl

-- enable spell check
-- opt.spell = true
-- opt.spelllang = { "en_us" }
--
-- show diagnostics messages - disable if using lsp_lines.nvim to avoid duplication
-- vim.diagnostic.config({ virtual_text = true })

-- search settings
opt.incsearch = true -- search highlighting updates with each keystroke
opt.inccommand = "split" -- show search results in a split window
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

opt.cursorline = true -- draws line to make cursor easier to find

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical windows to the right
opt.splitbelow = true -- split horizontal windows to the bottom

-- Allow undo history (including undotree) to access more than just the current session
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

-- Colors good. Me like.
opt.termguicolors = true
opt.background = "dark"
