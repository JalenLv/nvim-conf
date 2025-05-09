return {
	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	opts = {},
	-- 	config = function()
	-- 		vim.cmd([[colorscheme tokyonight-night]])
	-- 	end,
	-- },
	-- {
	-- 	"catppuccin/nvim",
	-- 	name = "catppuccin",
	-- 	priority = 1000,
	-- },
	-- {
	-- 	"utilyre/barbecue.nvim",
	-- 	version = "*",
	-- 	dependencies = {
	-- 		"SmiteshP/nvim-navic",
	-- 		"nvim-tree/nvim-web-devicons",
	-- 	},
	-- 	opts = {
	-- 		theme = "tokyonight",
	-- 	},
	-- },
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			options = {
				theme = "horizon",
				-- theme = "auto",
			},
		},
	},
	{
		"JalenLv/vercel.nvim",
		config = function()
			require("vercel").colorscheme()
		end,
	},
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = {
		  "nvim-tree/nvim-web-devicons",
      "tiesen243/vercel.nvim",
		},
		config = function()
			vim.opt.termguicolors = true
			require("vercel").setup({})
			local highlights = require("vercel").highlights.bufferline
			require("bufferline").setup({
				highlights = highlights,
			})
		end,
	},
	{
		"nvim-tree/nvim-web-devicons",
		lazy = true,
	},
}
