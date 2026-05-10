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
	{ -- Adds git related signs to the gutter, as well as utilities for managing changes
		"lewis6991/gitsigns.nvim",
		event = "BufReadPre",
		config = function()
			require("gitsigns").setup({
				current_line_blame = true,
				current_line_blame_opts = {
					delay = 0,
				},

				on_attach = function(bufnr)
					local gitsigns = require("gitsigns")
					local function map(mode, l, r, desc)
						vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
					end

					-- Navigation
					map("n", "]h", function()
						if vim.wo.diff then
							vim.cmd.normal({ "]h", bang = true })
						else
							gitsigns.nav_hunk("next")
						end
					end, "Next hunk")

					map("n", "[h", function()
						if vim.wo.diff then
							vim.cmd.normal({ "[h", bang = true })
						else
							gitsigns.nav_hunk("prev")
						end
					end, "Previous hunk")

					-- Stage
					map("n", "<leader>gs", gitsigns.stage_hunk, "[G]it [S]tage hunk")
					map("v", "<leader>gs", function()
						gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
					end, "[G]it [S]tage hunk")
					map("n", "<leader>gS", gitsigns.stage_buffer, "[G]it [S]tage buffer")

					-- Reset
					map("n", "<leader>gr", gitsigns.reset_hunk, "[G]it [R]eset hunk")
					map("v", "<leader>gr", function()
						gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
					end, "[G]it [R]eset hunk")
					map("n", "<leader>gR", gitsigns.reset_buffer, "[G]it [R]eset buffer")

					-- Preview
					map("n", "<leader>gp", gitsigns.preview_hunk, "[G]it [P]review hunk")
					map("n", "<leader>gP", gitsigns.preview_hunk_inline, "[G]it [P]review hunk inline")

					-- Diff
					map("n", "<leader>gd", function()
						gitsigns.diffthis("~")
					end, "[G]it [D]iff")

					-- Text objects
					map({ "o", "x" }, "ih", gitsigns.select_hunk, "Git hunk")
				end,
			})
		end,
	},
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
			local todo = require("todo-comments")
			todo.setup()

			-- Todo
			vim.keymap.set("n", "]t", function()
				todo.jump_next({ keywords = { "TODO" } })
			end, { desc = "Next TODO" })

			vim.keymap.set("n", "[t", function()
				todo.jump_prev({ keywords = { "TODO" } })
			end, { desc = "Previous TODO" })

			-- Fixme
			vim.keymap.set("n", "]f", function()
				todo.jump_next({ keywords = { "FIXME" } })
			end, { desc = "Next Fixme" })

			vim.keymap.set("n", "[f", function()
				todo.jump_prev({ keywords = { "FIXME" } })
			end, { desc = "Previous Fixme" })

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
			require("mini.bracketed").setup({
				file = { suffix = "", options = {} },
				treesitter = { suffix = "", options = {} },
			})

			-- Align text using ga
			require("mini.align").setup({
				mappings = {
					start = "",
					start_with_preview = "ga",
				},
			})

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
