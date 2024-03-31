local abb = vim.cmd
abb([[:ab abb abb(':iabbrev ')]])
abb(':ab setplug local setup_nameplug, nameplug = pcall(require, "nameplug")<CR>if not setup_nameplug then<CR>return<CR>end<CR>nameplug.setup()')
