local setup_todo_comments, todo_comments = pcall(require, "todo-comments")
if not setup_todo_comments then
	return
end
todo_comments.setup({
	signs = true, -- NOTE:show icons in the signs column
	sign_priority = 8, -- NOTE:sign priority
	-- NOTE:keywords recognized as todo comments
	keywords = {
		FIX = {
			icon = " ", -- NOTE:icon used for the sign, and in search results
			color = "error", -- NOTE:can be a hex color, or a named color (see below)
			alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- NOTE:a set of other keywords that all map to this FIX keywords
			-- NOTE:signs = false, -- NOTE:configure signs for some keywords individually
		},
		TODO = { icon = " ", color = "info" },
		HACK = { icon = " ", color = "warning" },
		WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
		PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
		NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
		TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
	},
	gui_style = {
		fg = "NONE", -- NOTE:The gui style to use for the fg highlight group.
		bg = "BOLD", -- NOTE:The gui style to use for the bg highlight group.
	},
	merge_keywords = true, -- NOTE:when true, custom keywords will be merged with the defaults
	-- NOTE:highlighting of the line containing the todo comment
	-- NOTE:* before: highlights before the keyword (typically comment characters)
	-- NOTE:* keyword: highlights of the keyword
	-- NOTE:* after: highlights after the keyword (todo text)
	highlight = {
		multiline = true, -- NOTE:enable multine todo comments
		multiline_pattern = "^.", -- NOTE:lua pattern to match the next multiline from the start of the matched keyword
		multiline_context = 10, -- NOTE:extra lines that will be re-evaluated when changing a line
		before = "", -- NOTE:"fg" or "bg" or empty
		keyword = "wide", -- NOTE:"fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
		after = "fg", -- NOTE:"fg" or "bg" or empty
		pattern = [[.*<(KEYWORDS)\s*:]], -- NOTE:pattern or table of patterns, used for highlighting (vim regex)
		comments_only = true, -- NOTE:uses treesitter to match keywords in comments only
		max_line_len = 400, -- NOTE:ignore lines longer than this
		exclude = {}, -- NOTE:list of file types to exclude highlighting
	},
	-- NOTE:list of named colors where we try to extract the guifg from the
	-- NOTE:list of highlight groups or use the hex color if hl not found as a fallback
	colors = {
		error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
		warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
		info = { "DiagnosticInfo", "#2563EB" },
		hint = { "DiagnosticHint", "#10B981" },
		default = { "Identifier", "#7C3AED" },
		test = { "Identifier", "#FF00FF" },
	},
	search = {
		command = "rg",
		args = {
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
		},
		-- NOTE:regex that will be used to match keywords.
		-- NOTE:don't replace the (KEYWORDS) placeholder
		pattern = [[\b(KEYWORDS):]], -- NOTE:ripgrep regex
		-- NOTE:pattern = [[\b(KEYWORDS)\b]], -- NOTE:match without the extra colon. You'll likely get false positives
	},
})
