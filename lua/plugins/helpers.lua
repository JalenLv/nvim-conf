return {
	{
		"numToStr/Comment.nvim",
		event = "InsertEnter",
		config = function()
			require("Comment").setup()

			-- now neovim has built-in commentstring
      -- but treesitter doesn't have a comentstring for cuda
			local ft = require("Comment.ft")
			ft({ "cuda" }, ft.get("c"))
		end,
	},
	-- { -- Adds git related signs to the gutter, as well as utilities for managing changes
	-- 	"lewis6991/gitsigns.nvim",
	--  event = "BufReadPre",
	-- 	opts = {
	-- 		signs = {
	-- 			add = { text = "+" },
	-- 			change = { text = "~" },
	-- 			delete = { text = "_" },
	-- 			topdelete = { text = "‾" },
	-- 			changedelete = { text = "~" },
	-- 			untracked = { text = "┆" },
	-- 		},
	-- 	},
	-- 	config = function(_, opts)
	-- 		require("gitsigns").setup(opts)
	-- 	end,
	-- },
	{
		"kevinhwang91/nvim-hlslens",
		event = "BufReadPre",
		opts = {
			calm_down = true,
			nearest_only = true,
			nearest_float_when = "always",
		},
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
		event = "BufReadPre",
		config = function()
      require("todo-comments").setup()

			vim.keymap.set("n", "]]t", function()
				require("todo-comments").jump_next({ keywords = { "TODO" } })
			end, { desc = "Next [T]odo comment" })

			vim.keymap.set("n", "[[t", function()
				require("todo-comments").jump_prev({ keywords = { "TODO" } })
			end, { desc = "Previous [T]odo comment" })

			vim.keymap.set("n", "]]f", function()
				require("todo-comments").jump_next({ keywords = { "FIXME" } })
			end, { desc = "Next [F]ixme comment" })

			vim.keymap.set("n", "[[f", function()
				require("todo-comments").jump_prev({ keywords = { "FIXME" } })
			end, { desc = "Previous [F]ixme comment" })

			vim.keymap.set("n", "<leader>st", "<cmd>TodoTelescope<CR>", { desc = "[S]earch [T]odo comments" })
		end,
	},
	{
		"echasnovski/mini.nvim",
		version = false,
		event = "BufReadPre",
		config = function()
			-- Extend and create a/i text objects
			require("mini.ai").setup()

      -- Move any selection in any direction
      -- Use <M-h/j/k/l> to move selected text/lines
      require("mini.move").setup()

      -- Responsible for gx/gm/gr mappings 
			require("mini.operators").setup()

      -- Split and join arguments using gS
			require("mini.splitjoin").setup()

      -- Tabline
			require("mini.tabline").setup()

      -- Responsible for [ and ] mappings
			require("mini.bracketed").setup()

      -- Git integration
      -- require("mini.git").setup()
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
