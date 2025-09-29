return {
	"stevearc/conform.nvim",

	event = { "LspAttach" },
	cmd = { "ConformInfo" },

	dependencies = {
		-- Use mason to install formatters
		"williamboman/mason.nvim",
		-- Use mason-tool installer to automate installation
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},

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

	config = function()
		-- Setup mason
		require("mason").setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		local formatters_by_ft = {
			lua = { "stylua" },
			python = { "black" },
			c = { "clang-format" },
			cpp = { "clang-format" },
			cuda = { "clang-format" },
			cmake = { "cmakelang" },
			-- tex = { "texlab" },
			typst = { "tinymist" },
		}

		require("mason-tool-installer").setup({
			-- ensure_installed = vim.tbl_flatten(vim.tbl_values(formatters_by_ft or {})),
			ensure_installed = vim.iter(vim.tbl_values(formatters_by_ft or {})):flatten():totable(), -- above is deprecated
		})
		vim.cmd("MasonToolsInstall")

		formatters_by_ft = vim.tbl_deep_extend("force", formatters_by_ft, { rust = { "rustfmt" } })
		formatters_by_ft["typst"] = vim.tbl_deep_extend("force", formatters_by_ft["typst"], { lsp_format = "prefer" })

		-- Setup conform with the options
		require("conform").setup({
			notify_on_error = false,

			--    -- format_on_save can be a function
			-- format_on_save = function(bufnr)
			--   local disable_filetypes = { c = true, cpp = true }
			--   return {
			--     timeout_ms = 500,
			--     lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype]
			--   }
			-- end,
			-- format_on_save = {
			-- 	timeout_ms = 500,
			-- 	lsp_fallback = true,
			-- },

			default_format_opts = {
				lsp_format = "fallback",
			},

			formatters = {
				rustfmt = {
					command = "rustfmt",
					args = {
						"--config",
						"tab_spaces=4",
					},
				},
				cmakelang = {
					command = "cmake-format",
					args = {
						"$FILENAME",
					},
				},
			},

			formatters_by_ft = formatters_by_ft,
		})
	end,
}
