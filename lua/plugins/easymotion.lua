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

			{ -- Use <leader><leader>v to jump forward to start of variable segments
				-- Use <leader><leader>V to jump backward to start of variable segments
				-- Use <leader><leader>gv to jump forward to end of variable segments
				-- Use <leader><leader>gV to jump backward to end of variable segments
				"aykamko/vim-easymotion-segments",
				dependencies = {
					"kana/vim-textobj-user",
					"Julian/vim-textobj-variable-segment",
				},
			},
		},
		config = function()
			vim.cmd([[
        nmap <leader><leader>/ <Plug>(easymotion-sn)
        nmap <leader><leader>2s <Plug>(easymotion-s2)
        nmap <leader><leader>2f <Plug>(easymotion-f2)
        nmap <leader><leader>2F <Plug>(easymotion-F2)
        nmap <leader><leader>2t <Plug>(easymotion-t2)
        nmap <leader><leader>2T <Plug>(easymotion-T2)
        nmap <leader><leader><leader>j <Plug>(easymotion-jumptoanywhere)
			]])
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
