return {
	{
		"nvim-tree/nvim-web-devicons",
		lazy = true,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				color_overrides = {
					mocha = {
						base = "#1b1b1b",
						mantle = "#1b1b1b",
						crust = "#1b1b1b",
					},
				},
				integrations = {
					mason = true,
					nvim_surround = true,
					which_key = true,
				},
			})
			vim.cmd.colorscheme("catppuccin-mocha")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"catppuccin/nvim",
		},
		opts = {
			options = {
				-- theme = "horizon",
				theme = "catppuccin",
			},
		},
	},
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"catppuccin/nvim",
		},
		config = function()
			local highlights = require("catppuccin.groups.integrations.bufferline").get()
			require("bufferline").setup({
				highlights = highlights,
			})
		end,
	},
}
