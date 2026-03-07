return {
	"let-def/texpresso.vim",
	ft = { "tex" },
	config = function()
		-- Keybindings
		vim.keymap.set("n", "<leader>lp", "<cmd>TeXpresso %<CR>", { desc = "Run [T]ex[P]resso in root dir" })
	end,
}
