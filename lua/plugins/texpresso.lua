return {
	"let-def/texpresso.vim",
	ft = { "tex" },
	config = function()
		-- Set the path to the texpresso binary
		require("texpresso").texpresso_path = "/opt/texpresso/build/texpresso"

		-- Keybindings
		vim.keymap.set("n", "<leader>lp", "<cmd>TeXpresso %<CR>", { desc = "Run [T]ex[P]resso in root dir" })
	end,
}
