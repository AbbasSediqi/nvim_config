local setup, _ = pcall(vim.cmd, "colorscheme catppuccin-mocha")
if not setup then
	return
end

local setup, catppuccin = pcall(require, "catppuccin")
if not setup then
	return
end

catppuccin.setup({
	transparent_background = false,
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		treesitter = true,
		alpha = true,
		barbar = false,
	},
})
