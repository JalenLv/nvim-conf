return {
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		-- install with yarn or npm
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
		config = function()
			vim.keymap.set(
				"n",
				"<leader>mp",
				":MarkdownPreviewToggle<CR>",
				{ noremap = true, desc = "[M]arkdown [P]review" }
			)
		end,
	},
}
