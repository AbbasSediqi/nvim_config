local setup, neotree = pcall(require, "neo-tree")
if not setup then
	return
end

neotree.setup({
	window = {
		position = "right",
		width = 25,
		mapping_options = {
			noremap = true,
			nowait = true,
		},
		mappings = {
			["<space>"] = {
				"toggle_node",
				nowait = false, -- NOTE:disable `nowait` if you have existing combos starting with this char that you want to use
			},
			["<2-LeftMouse>"] = "open",
			["<cr>"] = "open",
			["<esc>"] = "cancel", -- NOTE:close preview or floating neo-tree window
			["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
			-- NOTE:Read `# Preview Mode` for more information
			["l"] = "focus_preview",
			["S"] = "open_split",
			["s"] = "open_vsplit",
			-- NOTE:["S"] = "split_with_window_picker",
			-- NOTE:["s"] = "vsplit_with_window_picker",
			["t"] = "open_tabnew",
			-- NOTE:["<cr>"] = "open_drop",
			-- NOTE:["t"] = "open_tab_drop",
			["w"] = "open_with_window_picker",
			--["P"] = "toggle_preview", -- NOTE:enter preview mode, which shows the current node without focusing
			["C"] = "close_node",
			-- NOTE:['C'] = 'close_all_subnodes',
			["z"] = "close_all_nodes",
			--["Z"] = "expand_all_nodes",
			["a"] = {
				"add",
				-- NOTE:this command supports BASH style brace expansion ("x{a,b,c}" -> xa,xb,xc). see `:h neo-tree-file-actions` for details
				-- NOTE:some commands may take optional config options, see `:h neo-tree-mappings` for details
				config = {
					show_path = "none", -- NOTE:"none", "relative", "absolute"
				},
			},
			["A"] = "add_directory", -- NOTE:also accepts the optional config.show_path option like "add". this also supports BASH style brace expansion.
			["d"] = "delete",
			["r"] = "rename",
			["y"] = "copy_to_clipboard",
			["x"] = "cut_to_clipboard",
			["p"] = "paste_from_clipboard",
			["c"] = "copy", -- NOTE:takes text input for destination, also accepts the optional config.show_path option like "add":
			-- NOTE:["c"] = {
			-- NOTE: "copy",
			-- NOTE: config = {
			-- NOTE:   show_path = "none" -- NOTE:"none", "relative", "absolute"
			-- NOTE: }
			--}
			["m"] = "move", -- NOTE:takes text input for destination, also accepts the optional config.show_path option like "add".
			["q"] = "close_window",
			["R"] = "refresh",
			["?"] = "show_help",
			["<"] = "prev_source",
			[">"] = "next_source",
			["i"] = "show_file_details",
		},
	},
})
