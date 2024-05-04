return {
	"zbirenbaum/copilot.lua",
	build = ":Copilot auth",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local accept = nil
		if vim.fn.has("mac") == 1 then
			accept = "<D-l>"
		elseif vim.fn.has("unix") == 1 then
			accept = "<M-l>"
		elseif vim.fn.has("win32") == 1 or vim.fn.has("wim64") == 1 then
			accept = "<A-l>"
		end
		require("copilot").setup({
			suggestion = {
				auto_trigger = true,
				keymap = {
					accept = accept,
				},
			},
			filetypes = {
				markdown = true,
				help = true,
			},
		})
	end,
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
