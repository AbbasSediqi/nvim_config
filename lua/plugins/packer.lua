vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- NOTE: packer             =   Package manager
	use("wbthomason/packer.nvim")

	-- NOTE: wich key           =   keymap plugin
	use("folke/which-key.nvim")

	-- NOTE: catppuccin         =   Theme
	use("catppuccin/nvim")

	-- NOTE: todo-comments      =   Todo Color
	use({ "folke/todo-comments.nvim", requires = { "nvim-lua/plenary.nvim" } })

	-- NOTE: telescope          =   Fuzzy Finder
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"LinArcX/telescope-command-palette.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
		},
	})
	-- NOTE: luaine             =   status bar
	use("nvim-lualine/lualine.nvim")

	-- NOTE: barbar             =   tab bar
	use("romgrk/barbar.nvim")

	-- NOTE: scrollbar          =   good looking scroolbar
	use("Xuyuanp/scrollbar.nvim")

	-- NOTE: neo-tree           =   file manager
	use({
		"nvim-neo-tree/neo-tree.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			"3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
	})

	-- NOTE: maximizer          =   maximize the buffer
	use("szw/vim-maximizer")

	-- NOTE:
	use("lukas-reineke/indent-blankline.nvim")

	-- NOTE: golden_size        =   larger view for focused window
	use("dm1try/golden_size")

	-- NOTE: beacon             =   Cursure Beacon
	use("DanilaMihailov/beacon.nvim")

	-- NOTE: undotree           =   undo history
	use("jiaoshijie/undotree")

	-- NOTE: vim-visual-multi   =   multi line edit in visual mode
	use("mg979/vim-visual-multi")

	-- NOTE: vim-tmux-navigator =   tmux movement sync with novim
	use("christoomey/vim-tmux-navigator")

	-- NOTE: vim-surround       =   surround all kind of text with any thing and change that to
	use("tpope/vim-surround")

	-- NOTE: comment            =   comment line with gcc or lines with gc + motion
	use("numToStr/Comment.nvim")

	-- NOTE: treesiter          =   treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})
	-- NOTE: ufo                =   fold plugin
	use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" })

	-- NOTE: alpha              =   dashboard
	use("goolord/alpha-nvim")

	-- NOTE: lazygit            =   git plugin
	use("kdheepak/lazygit.nvim")

	-- NOTE: autocompletion
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp") -- completion plugin
	use("hrsh7th/cmp-buffer") -- source for text in buffer
	use("hrsh7th/cmp-path") -- source for file system paths
	use("hrsh7th/cmp-cmdline")
	use("stevearc/conform.nvim")

	-- NOTE: snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("saadparwaiz1/cmp_luasnip") -- for autocompletion
	use("rafamadriz/friendly-snippets") -- useful snippets

	-- NOTE: managing & installing lsp servers, linters & formatters
	use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
	use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

	-- NOTE: configuring lsp servers
	use("neovim/nvim-lspconfig") -- easily configure language servers
	use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
		requires = {
			{ "nvim-tree/nvim-web-devicons" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	}) -- NOTE: enhanced lsp uis
	use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

	if packer_bootstrap then
		require("packer").sync()
	end
end)
