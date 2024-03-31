local setup, undotree = pcall(require, "undotree")
if not setup then
	return
end
undotree.setup({
	float_diff = true, -- NOTE:using float window previews diff, set this `true` will disable layout option
	layout = "left_bottom", -- NOTE:"left_bottom", "left_left_bottom"
	position = "left", -- NOTE:"right", "bottom"
	window = {
		winblend = 30,
	},
	keymaps = {
		["j"] = "move_next",
		["k"] = "move_prev",
		["gj"] = "move2parent",
		["J"] = "move_change_next",
		["K"] = "move_change_prev",
		["<cr>"] = "action_enter",
		["p"] = "enter_diffbuf",
		["q"] = "quit",
	},
	vim.cmd("let target_path = expand('~/.config/nvim/undodir')"),
	vim.cmd("let &undodir=target_path"),
	vim.cmd("set undofile"),
})
