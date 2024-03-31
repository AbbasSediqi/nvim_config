local setup, tabbar = pcall(require, "barbar")
if not setup then
	return
end
require("barbar").setup({
	-- NOTE: WARN: do not copy everything below into your config!
	-- NOTE:       It is just an example of what configuration options there are.
	-- NOTE:       The defaults are suitable for most people.

	-- NOTE: Enable/disable animations
	animation = true,

	-- NOTE: Automatically hide the tabline when there are this many buffers left.
	-- NOTE: Set to any value >=0 to enable.
	auto_hide = false,

	-- NOTE: Enable/disable current/total tabpages indicator (top right corner)
	tabpages = true,

	-- NOTE: Enables/disable clickable tabs
	-- NOTE:  - left-click: go to buffer
	-- NOTE:  - middle-click: delete buffer
	clickable = true,

	-- NOTE: Excludes buffers from the tabline
	exclude_ft = { "javascript" },
	exclude_name = { "package.json" },

	-- NOTE: A buffer to this direction will be focused (if it exists) when closing the current buffer.
	-- NOTE: Valid options are 'left' (the default), 'previous', and 'right'
	focus_on_close = "left",

	-- NOTE: Hide inactive buffers and file extensions. Other options are `alternate`, `current`, and `visible`.
	-- NOTE: hide = {extensions = true, inactive = true},

	-- NOTE: Disable highlighting alternate buffers
	highlight_alternate = false,

	-- NOTE: Disable highlighting file icons in inactive buffers
	highlight_inactive_file_icons = false,

	-- NOTE: Enable highlighting visible buffers
	highlight_visible = true,

	icons = {
		-- NOTE: Configure the base icons on the bufferline.
		-- NOTE: Valid options to display the buffer index and -number are `true`, 'superscript' and 'subscript'
		buffer_index = false,
		buffer_number = false,
		button = "",
		-- NOTE: Enables / disables diagnostic symbols
		diagnostics = {
			[vim.diagnostic.severity.ERROR] = { enabled = true, icon = "ﬀ" },
			[vim.diagnostic.severity.WARN] = { enabled = false },
			[vim.diagnostic.severity.INFO] = { enabled = false },
			[vim.diagnostic.severity.HINT] = { enabled = true },
		},
		gitsigns = {
			added = { enabled = true, icon = "+" },
			changed = { enabled = true, icon = "~" },
			deleted = { enabled = true, icon = "-" },
		},
		filetype = {
			-- NOTE: Sets the icon's highlight group.
			-- NOTE: If false, will use nvim-web-devicons colors
			custom_colors = false,

			-- NOTE: Requires `nvim-web-devicons` if `true`
			enabled = true,
		},
		separator = { left = "▎", right = "" },

		-- NOTE: If true, add an additional separator at the end of the buffer list
		separator_at_end = true,

		-- NOTE: Configure the icons on the bufferline when modified or pinned.
		-- NOTE: Supports all the base icon options.
		modified = { button = "●" },
		pinned = { button = "", filename = true },

		-- NOTE: Use a preconfigured buffer appearance— can be 'default', 'powerline', or 'slanted'
		preset = "default",

		-- NOTE: Configure the icons on the bufferline based on the visibility of a buffer.
		-- NOTE: Supports all the base icon options, plus `modified` and `pinned`.
		alternate = { filetype = { enabled = false } },
		current = { buffer_index = true },
		inactive = { button = "×" },
		visible = { modified = { buffer_number = false } },
	},

	-- NOTE: If true, new buffers will be inserted at the start/end of the list.
	-- NOTE: Default is to insert after current buffer.
	insert_at_end = false,
	insert_at_start = false,

	-- NOTE: Sets the maximum padding width with which to surround each tab
	maximum_padding = 1,

	-- NOTE: Sets the minimum padding width with which to surround each tab
	minimum_padding = 1,

	-- NOTE: Sets the maximum buffer name length.
	maximum_length = 30,

	-- NOTE: Sets the minimum buffer name length.
	minimum_length = 0,

	-- NOTE: If set, the letters for each buffer in buffer-pick mode will be
	-- NOTE: assigned based on their name. Otherwise or in case all letters are
	-- NOTE: already assigned, the behavior is to assign letters in order of
	-- NOTE: usability (see order below)
	semantic_letters = true,

	-- NOTE: Set the filetypes which barbar will offset itself for
	sidebar_filetypes = {
		-- NOTE: Use the default values: {event = 'BufWinLeave', text = '', align = 'left'}
		-- NOTE: NvimTree = true,
		-- NOTE: Or, specify the text used for the offset:
		undotree = {
			text = "undotree",
			align = "center", -- NOTE: *optionally* specify an alignment (either 'left', 'center', or 'right')
		},
		-- NOTE: Or, specify the event which the sidebar executes when leaving:
		["neo-tree"] = { event = "BufWipeout" },
		-- NOTE: Or, specify all three
		Outline = { event = "BufWinLeave", text = "symbols-outline", align = "right" },
	},

	-- NOTE: New buffer letters are assigned in this order. This order is
	-- NOTE: optimal for the qwerty keyboard layout but might need adjustment
	-- NOTE: for other layouts.
	letters = "asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP",

	-- NOTE: Sets the name of unnamed buffers. By default format is "[Buffer X]"
	-- NOTE: where X is the buffer number. But only a static string is accepted here.
	no_name_title = nil,
})
