local km = vim.keymap
km.set("n", "sx", vim.cmd.so)
km.set("v", "J", ":m '>+1<CR>gv=gv")
km.set("v", "K", ":m '<-2<CR>gv=gv")
km.set("n", "Q", "<nop>")
km.set({ "n", "v", "i" }, "<M-left>", "<C-w>h")
km.set({ "n", "v", "i" }, "<M-right>", "<C-w>l")
km.set({ "n", "v", "i" }, "<M-down>", "<C-w>j")
km.set({ "n", "v", "i" }, "<M-up>", "<C-w>k")
km.set("n", "x", '"_x')
km.set("n", "n", "nzzzv")
km.set("n", "N", "Nzzzv")
-- km.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- km.set("n", "<C-j>", "<cmd>cprev<CR>zz")
km.set("n", "<leader>k", "<cmd>lnext<CR>zz")
km.set("n", "<leader>j", "<cmd>lprev<CR>zz")

local wk = require("which-key")
wk.register({
  -- CTRL
  ["<c-"]     = {
    ["s>"] = { "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find({ previewer = false })<cr>", "Search" },
    ["c>"] = { "<cmd>BufferClose<cr>", "Close Current Buffer" },
    ["w>"] = { "<cmd>w!<CR>", "Save" },
    ["q>"] = { "<cmd>q!<CR>", "Quit" },
    ["r>"] = { [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], "Search and Replace in current buffer" },
  },
  -- ALT
  ["<M-"]     = {
    [".>"]   = { "<C-u>zz", "Half page up" },
    [",>"] = { "<C-d>zz", "Half page down" },
    -- Select buffer
    ["-1>"]   = { "<Cmd>BufferGoto 1<CR>", "Goto buffer 1" },
    ["-2>"]   = { "<Cmd>BufferGoto 2<CR>", "Goto buffer 2" },
    ["-3>"]   = { "<Cmd>BufferGoto 3<CR>", "Goto buffer 3" },
    ["-4>"]   = { "<Cmd>BufferGoto 4<CR>", "Goto buffer 4" },
    ["-5>"]   = { "<Cmd>BufferGoto 5<CR>", "Goto buffer 5" },
    ["-6>"]   = { "<Cmd>BufferGoto 6<CR>", "Goto buffer 6" },
    ["-7>"]   = { "<Cmd>BufferGoto 7<CR>", "Goto buffer 7" },
    ["-8>"]   = { "<Cmd>BufferGoto 8<CR>", "Goto buffer 8" },
    ["-9>"]   = { "<Cmd>BufferGoto 9<CR>", "Goto buffer 9" },
    ["-0>"]   = { "<Cmd>BufferGoto 0<CR>", "Goto buffer 0" },
    ["-c>"]   = { "<cmd>BufferClose<CR>", "Close Buffer" },
  },
  -- Space
  ["<space>"] = {
    -- Buffers
    b = {
      name = "Buffers",
      b = { "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>", "Buffers" },
      c = { "<cmd>BufferClose<CR>", "Close Buffer" },
      p = { "<cmd>BufferPin<CR>", "Pin Buffer" },
    },
    e = {
      name = "Explore",
      e = { "<cmd>Ex<CR>", "Vim Explore" },
      t = { "<cmd>Neotree toggle<cr>", "Explorer" },
    },
    f = {
      name = "Telescope",
      b = { "<cmd>Telescope buffers<cr>", "Buffer list" },
      f = { "<cmd>Telescope file_browser<cr>", "Find File" },
      g = { "<cmd>Telescope live_grep<cr>", "Find String" },
      h = { "<cmd>Telescope help_tags<cr>", "Help" },
      l = { ":lua require('telescope.builtin').lsp_document_symbols()<cr>", "Help" },
      p = { "<cmd>Telescope command_palette<cr>", "Find File" },
      y = { ":lua require('telescope.builtin').registers()<CR>", "Copy History"},
      -- s = { "<cmd>Telescope session-lens<cr>", "Help" },
    },
    g = {
      name  = "g",
      d = {"<cmd>Telescope lsp_definitions<CR>", "lsp definitions"},
      r = {"<cmd>Telescope lsp_references<CR>", "lsp Reference"},
    },
    ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
    -- Packer
    p = {
      name = "Packer",
      c = { "<cmd>PackerCompile<cr>", "Compile" },
      i = { "<cmd>PackerInstall<cr>", "Install" },
      s = { "<cmd>PackerSync<cr>", "Sync" },
      S = { "<cmd>PackerStatus<cr>", "Status" },
      u = { "<cmd>PackerUpdate<cr>", "Update" },
    },
    -- Open Files
    o = {
      name = "Open preset file",
      c = {
        name = "Config Files",
        h = { "<cmd>e ~/.config/hypr/hyprland.conf<CR>", "Hyprland Config" },
        t = { "<cmd>e ~/.tmux.conf<CR>", "Tmux Config" },
        z = { "<cmd>e ~/.zshrc<CR>", "ZSHRC File" },
      },
      n = {
        name = "Neovim Files",
        i = { "<cmd>e ~/.config/nvim/init.lua<CR>", "init file" },
        k = { "<cmd>e ~/.config/nvim/lua/keymaps.lua<CR>", "Keymaps file" },
        c = { "<cmd>e ~/.config/nvim/lua/plugins-config.lua<CR>", "Plugins Config file" },
        s = { "<cmd>e ~/.config/nvim/lua/settings.lua<CR>", "Settings file" },
        p = { "<cmd>e ~/.config/nvim/lua/plugins.lua<CR>", "Packer Setting File" },
      },
    },
    -- Terminal
    t = {
      name = "Terminal",
      n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
      u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
      t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
      p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
      f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
      h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
      v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
    },
    ["u"] = { ":lua require('undotree').toggle()<cr>", "undotree" },
    -- Windows
    w = {
      name = "Windows",
      c = { ":close<CR>", "Close Current Window" },
      e = { "<C-w>=", "Equal Split Windows" },
      h = { "<C-w>s", "Open Window horizontally" },
      v = { "<C-w>v", "Open Windows vertically" },
      m = { ":MaximizerToggle<CR>", "Maximize Current Window" },
    },
  },
})
