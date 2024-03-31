local opt = vim.opt

--= line number
opt.relativenumber = true
opt.number = true
--#

--= tab & indenting
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
--#

--= line wrapping
opt.wrap = false
--#

--= search
opt.ignorecase = true
opt.smartcase = true
--#

--= cursor line
opt.cursorline = true
--#

--= appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "no"
--#

--= backspace
opt.backspace = "indent,eol,start"
--#

--= clipboard
opt.clipboard:append("unnamedplus")
--#

--= split windows
opt.splitright = true
opt.splitbelow = true
--#

--= set fold method
opt.foldmarker = "--=,--#"
opt.foldmethod = "marker"
opt.foldlevel = 1
--#

opt.iskeyword:append("-")

vim.opt_local.conceallevel = 2

vim.cmd("set autochdir")

vim.opt.swapfile = false
