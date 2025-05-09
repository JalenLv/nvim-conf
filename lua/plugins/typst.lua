return {
	{
		"kaarmu/typst.vim",
		ft = "typst",
		lazy = false,
	},
	{
		"chomosuke/typst-preview.nvim",
		ft = "typst",
		version = "1.*",
		config = function()
			vim.keymap.set(
				"n",
				"<leader>Tp",
				"<cmd>TypstPreview document<CR>",
				{ noremap = true, desc = "[T]ypst [P]review as document" }
			)

			vim.keymap.set(
				"n",
				"<leader>TP",
				"<cmd>TypstPreview slide<CR>",
				{ noremap = true, desc = "[T]ypst [P]review as slides" }
			)
		end,
	},
}
