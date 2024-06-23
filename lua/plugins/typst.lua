return {
	{
		"kaarmu/typst.vim",
		ft = "typst",
		lazy = false,
	},
	{
		"chomosuke/typst-preview.nvim",
		lazy = false,
		version = "0.3.*",
		build = function()
			require("typst-preview").update()
		end,
		config = function()
			vim.keymap.set(
				"n",
				"<leader>tp",
				"<cmd>TypstPreview document<CR>",
				{ noremap = true, desc = "[T]ypst [P]review as document" }
			)

			vim.keymap.set(
				"n",
				"<leader>tP",
				"<cmd>TypstPreview slide<CR>",
				{ noremap = true, desc = "[T]ypst [P]review as slides" }
			)
		end,
	},
}
