return {
	{
		"easymotion/vim-easymotion",

		event = {
			"BufNewFile",
			"BufRead",
		},

		dependencies = {
			-- Create your own text objects
			"kana/vim-textobj-user",

			{ -- Text object for variable segments: "iv" and "av"
				-- effective for snake_case, camelCase
				"Julian/vim-textobj-variable-segment",
				dependencies = "kana/vim-textobj-user",
			},

			{
				"aykamko/vim-easymotion-segments",

				dependencies = {
					"kana/vim-textobj-user",
					"Julian/vim-textobj-variable-segment",
				},

				config = function()
					vim.keymap.set(
						"n",
						"<leader><leader>v",
						"<Plug>(easymotion-segments-LF)",
						{ desc = "Jump to start of segment forward", noremap = false }
					)
					vim.keymap.set(
						"n",
						"<leader><leader>V",
						"<Plug>(easymotion-segments-LB)",
						{ desc = "Jump to start of segment backward", noremap = false }
					)
					vim.keymap.set(
						"n",
						"<leader><leader>gv",
						"<Plug>(easymotion-segments-RF)",
						{ desc = "Jump to end of segment forward", noremap = false }
					)
					vim.keymap.set(
						"n",
						"<leader><leader>gV",
						"<Plug>(easymotion-segments-RB)",
						{ desc = "Jump to end of segment backward", noremap = false }
					)
				end,
			},
		},

		config = function()
			vim.keymap.set(
				"n",
				"<leader><leader>/",
				"<Plug>(easymotion-sn)",
				{ desc = "Search for characters", noremap = false }
			)
			vim.keymap.set(
				"n",
				"<leader><leader>2s",
				"<Plug>(easymotion-s2)",
				{ desc = "Search for 2 characters", noremap = false }
			)
			vim.keymap.set(
				"n",
				"<leader><leader>2t",
				"<Plug>(easymotion-t2)",
				{ desc = "Jump to 2 characters forward", noremap = false }
			)
			vim.keymap.set(
				"n",
				"<leader><leader>2T",
				"<Plug>(easymotion-T2)",
				{ desc = "Jump to 2 characters backward", noremap = false }
			)
			vim.keymap.set(
				"n",
				"<leader><leader><leader>j",
				"<Plug>(easymotion-jumptoanywhere)",
				{ desc = "Jump to anywhere", noremap = false }
			)
		end,
	},
	{
		"chaoren/vim-wordmotion",
		event = {
			"BufNewFile",
			"BufRead",
		},
	},
}
