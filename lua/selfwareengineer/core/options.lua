vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt -- for conciseness

-- navigation
opt.relativenumber = true -- shows relative numbers to the cursor line to make vim movements easier
opt.number = true
opt.scrolloff = 8

-- tabs and indentation
opt.tabstop = 4 -- 4 spaces for tabs (prettier default)
opt.shiftwidth = 4 -- 4 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive
opt.incsearch = true -- search highlighting updates with each keystroke

opt.cursorline = true -- draws line to make cursor easier to find

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical windows to the right
opt.splitbelow = true -- split horizontal windows to the bottom

-- Allow undotree to access more than just the current session
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

-- Colors good. Me like.
opt.termguicolors = true
