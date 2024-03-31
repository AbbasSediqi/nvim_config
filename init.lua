-- NOTE: Startup
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerCompile
  augroup end
  augroup yank highlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }
  augroup end
  augroup ScrollbarInit
  autocmd!
  autocmd WinScrolled,VimResized,QuitPre * silent! lua require('scrollbar').show()
    autocmd WinEnter,FocusGained           * silent! lua require('scrollbar').show()
    autocmd WinLeave,BufLeave,BufWinLeave,FocusLost            * silent! lua require('scrollbar').clear()
  augroup end
]])


-- NOTE: Settings Files
require("settings.options")
require("settings.abbrev")

-- NOTE: Plugins Files
require("plugins.packer")
require("plugins.whichkey")
require("plugins.catppuccin")
require("plugins.todo_comments")
require("plugins.telescope")
require("plugins.lualine")
require("plugins.barbar")
require("plugins.neotree")
require("plugins.indentblankline")
require("plugins.undotree")
require("plugins.comment")
require("plugins.treesitter")
require("plugins.ufo")
require("plugins.alpha")

-- NOTE: lsp files
require("plugins.lsp.nvimcmp")
require("plugins.lsp.mason")
require("plugins.lsp.lspsaga")
require("plugins.lsp.lspconfig")
require("plugins.conform")


