return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "",
			desc = "[F]ormat buffer",
		},
	},
	opts = {
		notify_on_error = false,

		--    -- format_on_save can be a function
		-- format_on_save = function(bufnr)
		--   local disable_filetypes = { c = true, cpp = true }
		--   return {
		--     timeout_ms = 500,
		--     lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype]
		--   }
		-- end,
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = true,
		},

		formatters_by_ft = {
			lua = { "stylua" },
			python = { "isort", "black", "ruff" },
			c = { "clang-format" },
			cpp = { "clang-format" },
			cuda = { "clang-format" },
			cmake = { "cmakelang" },
			-- tex = { "texlab" },
		},
	},
}
