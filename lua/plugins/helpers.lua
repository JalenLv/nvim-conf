return {
	{ -- 'gc' to comment visual regions/lines
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()

			local ft = require("Comment.ft")
			ft({ "cuda" }, ft.get("c"))
		end,
	},
	{ -- Adds git related signs to the gutter, as well as utilities for managing changes
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},
		},
		config = function(_, opts)
			require("gitsigns").setup(opts)
		end,
	},
	{
		"kevinhwang91/nvim-hlslens",
		opts = {},
	},
	-- {
	-- 	"petertriho/nvim-scrollbar",
	-- 	dependencies = {
	-- 		"lewis6991/gitsigns.nvim",
	-- 		"kevinhwang91/nvim-hlslens",
	-- 	},
	-- 	config = function()
	-- 		local colors = require("tokyonight.colors").setup()
	-- 		require("scrollbar").setup({
	-- 			handle = {
	-- 				color = colors.bg_highlight,
	-- 			},
	-- 			marks = {
	-- 				Search = { color = colors.orange },
	-- 				Error = { color = colors.error },
	-- 				Warn = { color = colors.warning },
	-- 				Info = { color = colors.info },
	-- 				Hint = { color = colors.hint },
	-- 				Misc = { color = colors.purple },
	-- 			},
	-- 		})
	-- 	end,
	-- },
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			signs = false,
		},
		keys = {
			{
				"]t",
				function()
					require("todo-comments").jump_next()
				end,
				desc = "Next [T]odo comment",
			},
			{
				"[t",
				function()
					require("todo-comments").jump_prev()
				end,
				desc = "Previous [T]odo comment",
			},
			{
				"<leader>st",
				"<cmd>TodoTelescope<CR>",
				desc = "[S]earch [T]odo comments",
			},
		},
	},
	{
		"echasnovski/mini.nvim",
		version = false,
		config = function()
			require("mini.ai").setup()
			require("mini.operators").setup()
			require("mini.splitjoin").setup()
			require("mini.tabline").setup()
			require("mini.bracketed").setup()
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({
				disable_filetype = {
					"TelescopePrompt",
					"spectre_panel",
					"tex", -- disable autopair for latex files
				},
			})

			-- If you want insert `(` after select function or method item
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local cmp = require("cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability;
		-- omit to use `main` branch for the latest features
		event = "VeryLazy",
		opts = {},
	},
}
