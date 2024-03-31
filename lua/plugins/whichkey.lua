vim.g.mapleader = " "
local km = vim.keymap

local setup_which_key, which_key = pcall(require, "which-key")
if not setup_which_key then
	return
end

local setup_which_key = {
	plugins = {
		marks = true, -- NOTE:shows a list of your marks on ' and `
		registers = true, -- NOTE:shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = true, -- NOTE:enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- NOTE:how many suggestions should be shown in the list?
		},
		-- NOTE:the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- NOTE:No actual key bindings are created
		presets = {
			operators = false, -- NOTE:adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = true, -- NOTE:adds help for motions
			text_objects = true, -- NOTE:help for text objects triggered after entering an operator
			windows = true, -- NOTE:default bindings on <c-w>
			nav = true, -- NOTE:misc bindings to work with windows
			z = true, -- NOTE:bindings for folds, spelling and others prefixed with z
			g = true, -- NOTE:bindings for prefixed with g
		},
	},
	-- NOTE:add operators that will trigger motion and text object completion
	-- NOTE:to enable all native operators, set the preset / operators plugin above
	-- NOTE:operators = { gc = "Comments" },
	key_labels = {
		-- NOTE:override the label used to display some keys. It doesn't effect WK in any other way.
		-- NOTE:For example:
		-- NOTE:["<space>"] = "SPC",
		-- NOTE:["<cr>"] = "RET",
		-- NOTE:["<tab>"] = "TAB",
	},
	icons = {
		breadcrumb = "»", -- NOTE:symbol used in the command line area that shows your active key combo
		separator = "➜", -- NOTE:symbol used between a key and it's label
		group = "+", -- NOTE:symbol prepended to a group
	},
	popup_mappings = {
		scroll_down = "<c-d>", -- NOTE:binding to scroll down inside the popup
		scroll_up = "<c-u>", -- NOTE:binding to scroll up inside the popup
	},
	window = {
		border = "rounded", -- NOTE:none, single, double, shadow
		position = "bottom", -- NOTE:bottom, top
		margin = { 1, 0, 1, 0 }, -- NOTE:extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- NOTE:extra window padding [top, right, bottom, left]
		winblend = 0,
	},
	layout = {
		height = { min = 4, max = 25 }, -- NOTE:min and max height of the columns
		width = { min = 20, max = 50 }, -- NOTE:min and max width of the columns
		spacing = 3, -- NOTE:spacing between columns
		align = "left", -- NOTE:align columns left, center or right
	},
	ignore_missing = true, -- NOTE:enable this to hide mappings for which you didn't specify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- NOTE:hide mapping boilerplate
	show_help = true, -- NOTE:show help message on the command line when the popup is visible
	triggers = "auto", -- NOTE:automatically setup triggers
	-- NOTE:triggers = {"<leader>"} -- NOTE:or specify a list manually
	triggers_blacklist = {
		-- NOTE:list of mode / prefixes that should never be hooked by WhichKey
		-- NOTE:this is mostly relevant for key maps that start with a native binding
		-- NOTE:most people should not need to change this
		i = { "j", "k" },
		v = { "j", "k" },
	},
}
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
-- NOTE:km.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- NOTE:km.set("n", "<C-j>", "<cmd>cprev<CR>zz")
km.set("n", "<leader>k", "<cmd>lnext<CR>zz")
km.set("n", "<leader>j", "<cmd>lprev<CR>zz")

local wk = require("which-key")
wk.register({
	-- NOTE:CTRL
	["<c-"] = {
		["s>"] = {
			"<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find({ previewer = false })<cr>",
			"Search",
		},
		["c>"] = { "<cmd>BufferClose<cr>", "Close Current Buffer" },
		["w>"] = { "<cmd>w!<CR>", "Save" },
		["q>"] = { "<cmd>q!<CR>", "Quit" },
		["r>"] = { [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], "Search and Replace in current buffer" },
	},
	-- NOTE:ALT
	["<M-"] = {
		[".>"] = { "<C-u>zz", "Half page up" },
		[",>"] = { "<C-d>zz", "Half page down" },
		-- NOTE:Select buffer
		["-1>"] = { "<Cmd>BufferGoto 1<CR>", "Goto buffer 1" },
		["-2>"] = { "<Cmd>BufferGoto 2<CR>", "Goto buffer 2" },
		["-3>"] = { "<Cmd>BufferGoto 3<CR>", "Goto buffer 3" },
		["-4>"] = { "<Cmd>BufferGoto 4<CR>", "Goto buffer 4" },
		["-5>"] = { "<Cmd>BufferGoto 5<CR>", "Goto buffer 5" },
		["-6>"] = { "<Cmd>BufferGoto 6<CR>", "Goto buffer 6" },
		["-7>"] = { "<Cmd>BufferGoto 7<CR>", "Goto buffer 7" },
		["-8>"] = { "<Cmd>BufferGoto 8<CR>", "Goto buffer 8" },
		["-9>"] = { "<Cmd>BufferGoto 9<CR>", "Goto buffer 9" },
		["-0>"] = { "<Cmd>BufferGoto 0<CR>", "Goto buffer 0" },
		["-c>"] = { "<cmd>BufferClose<CR>", "Close Buffer" },
	},
	-- NOTE:Space
	["<space>"] = {
		-- NOTE:Buffers
		b = {
			name = "Buffers",
			b = {
				"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
				"Buffers",
			},
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
			y = { ":lua require('telescope.builtin').registers()<CR>", "Copy History" },
			-- NOTE:s = { "<cmd>Telescope session-lens<cr>", "Help" },
		},
		g = {
			name = "g",
			d = { "<cmd>Telescope lsp_definitions<CR>", "lsp definitions" },
			i = { "<cmd>LazyGit<CR>", "lsp definitions" },
			r = { "<cmd>Telescope lsp_references<CR>", "lsp Reference" },
		},
		["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
		-- NOTE:Packer
		p = {
			name = "Packer",
			c = { "<cmd>PackerCompile<cr>", "Compile" },
			i = { "<cmd>PackerInstall<cr>", "Install" },
			s = { "<cmd>PackerSync<cr>", "Sync" },
			S = { "<cmd>PackerStatus<cr>", "Status" },
			u = { "<cmd>PackerUpdate<cr>", "Update" },
		},
		-- NOTE:Open Files
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
				k = { "<cmd>e ~/.config/nvim/lua/plugins/whichkey.lua<CR>", "Keymaps file" },
				p = { "<cmd>e ~/.config/nvim/lua/plugins/packer.lua<CR>", "Packer Setting File" },
				s = { "<cmd>e ~/.config/nvim/lua/settings/options.lua<CR>", "Settings file" },
			},
		},
		["r"] = { "<cmd>redo<CR>", "redo" },
		-- NOTE:Terminal
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
		-- NOTE:Windows
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
