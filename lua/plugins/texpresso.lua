return {
	"let-def/texpresso.vim",
	ft = { "tex" },
	config = function()
		-- Set the path to the texpresso binary
		vim.g.texpresso_path = "/opt/texpresso/build/texpresso"
		-- or
		-- require("texpresso").texpresso_path = "/usr/bin/texpresso"

		-- Keybindings
		vim.keymap.set("n", "<leader>tp", "<cmd>TeXpresso %<CR>", { desc = "Run [T]ex[P]resso in root dir" })
	end,
}
