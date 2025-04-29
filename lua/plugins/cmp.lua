return {
	"hrsh7th/nvim-cmp",
	version = false, -- last release is way too old

	event = { "BufReadPre", "BufNewFile" },

	dependencies = {
		"L3MON4D3/LuaSnip",
		"onsails/lspkind.nvim",

		"hrsh7th/cmp-nvim-lsp",
		"micangl/cmp-vimtex",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-calc",
		-- "quangnguyen30192/cmp-nvim-ultisnips",
	},

	opts = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local defaults = require("cmp.config.default")()
		local lspkind = require("lspkind")

		return {
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},

			completion = { completeopt = "menu,menuone,noinsert" },

			mapping = cmp.mapping.preset.insert({
				["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
				["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-e>"] = cmp.mapping.abort(),

				["<CR>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						if luasnip.expandable() then
							luasnip.expand()
						else
							cmp.confirm({ select = true })
						end
					else
						fallback()
					end
				end),

				["<Tab>"] = cmp.mapping(function(fallback)
					if luasnip.locally_jumpable(1) then
						luasnip.jump(1)
					else
						fallback()
					end
				end, { "i", "s" }),

				["<S-Tab>"] = cmp.mapping(function(fallback)
					if luasnip.locally_jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),

			sources = {
				{ name = "nvim_lsp" },
				{ name = "lazydev", group_index = 0 }, -- set group index to 0 to skip loading LuaLS completions
				{ name = "vimtex" },

				{ name = "luasnip" },

				{ name = "path" },
				{ name = "buffer" },
				{ name = "calc" },
			},

			sorting = defaults.sorting,

			formatting = {
				format = lspkind.cmp_format({
					mode = "symbol_text", -- show symbol and text
					menu = {
						nvim_lsp = "[LSP]",
						lazydev = "[LazyDev]",
						vimtex = "[Vimtex]",

						luasnip = "[LuaSnip]",

						path = "[Path]",
						buffer = "[Buffer]",
						calc = "[Calc]",
						cmdline = "[Cmd]",
					},
				}),
			},

			view = {
				entries = { name = "custom", selection_order = "near_cursor" },
			},
		}
	end,

	---@param opts cmp.ConfigSchema | {auto_brackets?: string[]}
	config = function(_, opts)
		for _, source in ipairs(opts.sources) do
			source.group_index = source.group_index or 1
		end

		local cmp = require("cmp")
		local Kind = cmp.lsp.CompletionItemKind
		cmp.setup(opts)

		-- Completions for `/`
		require("cmp").setup.cmdline({ "/" }, {
			mapping = require("cmp").mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})

		-- Completions for `:`
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "path" },
				{ name = "cmdline" },
			},
		})
	end,
}
