local setup, conform = pcall(require, "conform")
if not setup then
	return
end
conform.setup({
	notify_on_error = false,
	format_on_save = function(bufnr)
		-- NOTE:Disable "format_on_save lsp_fallback" for languages that don't
		-- NOTE:have a well standardized coding style. You can add additional
		-- NOTE:languages here or re-enable it for the disabled ones.
		local disable_filetypes = { c = true, cpp = true }
		return {
			timeout_ms = 500,
			lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
		}
	end,
	formatters_by_ft = {
		lua = { "stylua" },
		-- NOTE:Conform can also run multiple formatters sequentially
		-- NOTE:python = { "isort", "black" },
		--
		-- NOTE:You can use a sub-list to tell conform to run *until* a formatter
		-- NOTE:is found.
		-- NOTE:javascript = { { "prettierd", "prettier" } },
	},
})
