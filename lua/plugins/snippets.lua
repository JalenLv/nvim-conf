return {
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp",

    event = "InsertEnter",

		config = function()
			local ls = require("luasnip")

			-- Super-tab-like mappings
			vim.keymap.set({ "i", "s" }, "<Tab>", function()
				if ls.expandable() then
					ls.expand()
				elseif ls.locally_jumpable(1) then
					ls.jump(1)
				end
			end, { silent = true })

			vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
				if ls.jumpable(-1) then
					ls.jump(-1)
				end
			end, { silent = true })

      -- Use <ctrl-k> to change the active choice
      vim.keymap.set({ "i", "s" }, "<C-K>", function()
        if ls.choice_active() then
          ls.change_choice(1)
        end
      end, { silent = true })
		end,
	},
	{
		"SirVer/ultisnips",
		ft = { "tex", "snippets" },
		init = function()
			vim.g.UltiSnipsExpandTrigger = "<Tab>"
			vim.g.UltiSnipsJumpForwardTrigger = "<Tab>"
			vim.g.UltiSnipsJumpBackwardTrigger = "<S-Tab>"
			vim.g.UltiSnipsSnippetDirectories = { "~/.config/nvim/UltiSnips/" }
		end,
		config = function()
			-- key mappings
			vim.keymap.set(
				"n",
				"<leader>ur",
				"<Cmd>call UltiSnips#RefreshSnippets()<CR>",
				{ noremap = true, desc = "[U]ltisnips [R]efresh" }
			)
			vim.keymap.set(
				"n",
				"<leader>ue",
				"<Cmd>UltiSnipsEdit<CR>",
				{ noremap = true, silent = true, desc = "[U]ltisnips [E]dit snippets" }
			)
		end,
	},
}
