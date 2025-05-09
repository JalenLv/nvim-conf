local function config_jdtls()
	local config = {
		-- cmd = { vim.fn.expand("~") .. "/.local/share/nvim/mason/bin/jdtls" },
		-- root_dir = vim.fn.getcwd(),
		-- root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
		init_options = {
			bundles = {},
		},
	}

	local java_debug =
		"/.local/share/nvim/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar"
	local vscode_java_test = "/.local/share/nvim/mason/packages/java-test/extension/server/*.jar"
	local bundles = {
		vim.fn.glob(vim.fn.expand("~") .. java_debug, 1),
	}
	vim.list_extend(bundles, vim.split(vim.fn.glob(vim.fn.expand("~") .. vscode_java_test, 1), "\n"))
	config.init_options.bundles = bundles

	return config
end

return {
	{
		"neovim/nvim-lspconfig",

		dependencies = {
			-- Mason stuff
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",

			{ -- Configures LuaLS for editing your Neovim config.
				ft = "lua", -- only load on lua files
				"folke/lazydev.nvim",
				opts = {
					library = {
						-- See the configuration section for more details
						-- Load luvit types when the `vim.uv` word is found
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
						{ "nvim-dap-ui" },
					},
				},
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

			-- See `:h mason-lspconfig-server-map` for all available servers
			-- See `:h lspconfig-all` for all available settings for each server
			local servers = {
				-- c, cpp, cuda
				clangd = {
					cmd = {
						"clangd",
						"--clang-tidy",
						"--header-insertion=never",
					},
					-- root_dir = vim.fn.getcwd(),
				},

				-- CMake
				cmake = {}, -- cmake-language-server

				-- python
				pyright = {},

				-- java
				jdtls = config_jdtls(),

				-- lua
				lua_ls = {},

				-- rust
				rust_analyzer = {},

				-- markdown
				marksman = {},

				-- typst
				tinymist = {
					settings = {
						formatterMode = "typstyle",
						exportPdf = "onType",
						semanticTokens = "disable",
					},
				},
			}
			require("mason-lspconfig").setup({
				ensure_installed = vim.tbl_keys(servers),
				automatic_installation = false,
			})

			-- Now use vim.lsp.config() to setup the servers
			vim.lsp.enable(vim.tbl_keys(servers))
			for server_name, config in pairs(servers) do
				vim.lsp.config(server_name, config)
			end

			-- Setup lspconfig
			-- Enable inlay hints for all LSP servers
			vim.lsp.inlay_hint.enable(true)

			-- Diagnostic keymaps
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
			vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
			vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
				callback = function(event)
					-- Key mapping helper function
					local map = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
					map("gR", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
					map("K", vim.lsp.buf.hover, "Hover Documentation")
					map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

					-- Jump to the implementation of the word under your cursor.
					--  Useful when your language has ways of declaring types without an actual implementation.
					map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")

					-- Jump to the type of the word under your cursor.
					--  Useful when you're not sure what type a variable is and you want to see
					--  the definition of its *type*, not where it was *defined*.
					map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")

					-- Fuzzy find all the symbols in your current document.
					map("<leader>ss", require("telescope.builtin").lsp_document_symbols, "Document [S]ymbols")

					-- Fuzzy find all the symbols in your current workspace.
					map("<leader>sS", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Workspace [S]ymbols")

					-- Rename the variable under your cursor.
					map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

					-- Execute a code action, usually your cursor needs to be on top of an error
					-- or a suggestion from your LSP for this to activate.
					map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

					-- The following two autocommands are used to highlight reference of the
					-- word under your cursor. See `:help Cursor Hold` for info about when this is executed.
					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if client and client.server_capabilities.documentHighlightProvider then
						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
							buffer = event.buf,
							callback = vim.lsp.buf.document_highlight,
						})
						vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
							buffer = event.buf,
							callback = vim.lsp.buf.clear_references,
						})
					end
				end,
			})
		end,
	},
	-- { -- Extensible UI for Neovim notifications and LSP progress messages.
	-- 	"j-hui/fidget.nvim",
	-- 	opts = {
	-- 		progress = {
	-- 			-- Suppress new messages while in insert mode
	-- 			suppress_on_insert = true,
	-- 		},
	-- 	},
	-- },
}
