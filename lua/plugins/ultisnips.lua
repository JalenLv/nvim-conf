return {
	"SirVer/ultisnips",
	ft = { "tex", "snippets" },
	init = function()
		vim.g.UltiSnipsExpandTrigger = "<tab>"
		vim.g.UltiSnipsJumpForwardTrigger = "<tab>"
		vim.g.UltiSnipsJumpBackwardTrigger = "<s-tab>"
		vim.g.UltiSnipsSnippetDirectories = { "~/.config/nvim/UltiSnips/" }
	end,
	config = function()
		-- key mappings
		vim.keymap.set(
			"n",
			"<leader>ur",
			":call UltiSnips#RefreshSnippets()<CR>",
			{ noremap = true, desc = "[U]ltisnips [R]efresh" }
		)
		vim.keymap.set(
			"n",
			"<leader>ue",
			":UltiSnipsEdit<CR>",
			{ noremap = true, silent = true, desc = "[U]ltisnips [E]dit snippets" }
		)
	end,
}
