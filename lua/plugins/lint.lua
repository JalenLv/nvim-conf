return {
	{
		"rshkarin/mason-nvim-lint",
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-lint",
		},
		event = "LspAttach",
		config = function()
			-- setup mason
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})

			-- setup nvim-lint
			local lint = require("lint")
			lint.linters_by_ft = {
				-- clang-tidy should be installed manually and
				-- enabled in the lsp config as an argument of clangd
				-- c = { "clangtidy" },
				-- cpp = { "clangtidy" },
				-- cuda = { "clangtidy" },
				python = { "ruff" },
				markdown = { "markdownlint" },
			}

			-- To allow other plugins to add linters to require('lint').linters_by_ft,
			-- instead set linters_by_ft like this:
			-- lint.linters_by_ft = lint.linters_by_ft or {}
			-- lint.linters_by_ft['markdown'] = { 'markdownlint' }
			--
			-- However, note that this will enable a set of default linters,
			-- which will cause errors unless these tools are available:
			-- {
			--   clojure = { 'clj-kondo' },
			--   dockerfile = { 'hadolint' },
			--   inko = { 'inko' },
			--   janet = { 'janet' },
			--   json = { 'jsonlint' },
			--   markdown = { 'vale' },
			--   rst = { 'vale' },
			--   ruby = { 'ruby' },
			--   terraform = { 'tflint' },
			--   text = { 'vale' }
			-- }
			--
			-- You can disable the default linters by setting their filetypes to nil:
			-- lint.linters_by_ft['clojure'] = nil

			-- Create autocommand which carries out the actual linting on the specified events.
			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				group = lint_augroup,
				callback = function()
					lint.try_lint()
				end,
			})

			-- setup mason-nvim-lint
			require("mason-nvim-lint").setup({
				ensure_installed = {
					-- "clangtidy", -- clang-tidy is not available in mason, install it manually
					"ruff",
					"markdownlint",
				},
			})
		end,
	},
}
