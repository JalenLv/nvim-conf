return {
	"zbirenbaum/copilot.lua",
	build = ":Copilot auth",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		suggestion = {
			auto_trigger = true,
		},
		filetypes = {
			markdown = true,
			help = true,
		},
	},
	keys = {
		{
			"<leader>ce",
			"<cmd>Copilot enable<CR>",
			desc = "[C]opilot [E]nable",
		},
		{
			"<leader>cd",
			"<cmd>Copilot disable<CR>",
			desc = "[C]opilot [D]isable",
		},
		{
			"<leader>cs",
			"<cmd>Copilot status<CR>",
			desc = "[C]opilot [S]tatue",
		},
	},
}
