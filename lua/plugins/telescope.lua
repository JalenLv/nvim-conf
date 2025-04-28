return {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	branch = "0.1.x",

	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		"nvim-telescope/telescope-ui-select.nvim",
	},

	config = function()
		require("telescope").setup({
			extensions = {
				-- To get fzf and ui-select working with telescope, call
				-- load_extension somewhere after setup function.
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
				["ui-select"] = {
					require("telescope.themes").get_dropdown({
						-- even more opts
					}),
				},
			},
		})

		-- Call load_extension to get fzf and ui-select working
		require("telescope").load_extension("fzf")
		require("telescope").load_extension("ui-select")

		-- See `:help telescope.builtin`
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
		vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
		vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
		vim.keymap.set("n", "<leader>sB", builtin.builtin, { desc = "[S]earch Telescope [B]uiltin Functions" })
		vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
		vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
		vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
		vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
		vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = "[S]earch Recent Files" })
		vim.keymap.set("n", "<leader>sb", builtin.buffers, { desc = "[S]earch existing [B]uffers" })
		vim.keymap.set("n", "<leader>sm", builtin.man_pages, { desc = "[S]earch [M]an Pages" })
		vim.keymap.set("n", "<leader>sE", builtin.diagnostics, { desc = "[S]earch Diagnostics in Open Files" })
		vim.keymap.set("n", "gl", builtin.spell_suggest, { desc = "List Spell Suggestions" })

		vim.keymap.set("n", "<leader>sGc", builtin.git_commits, { desc = "[S]earch Workspace [G]it [C]ommits" })
		vim.keymap.set("n", "<leader>sGC", builtin.git_bcommits, { desc = "[S]earch Current Buffer [G]it [C]ommits" })
		vim.keymap.set("n", "<leader>sGb", builtin.git_branches, { desc = "[S]earch [G]it [B]ranches" })
    vim.keymap.set("n", "<leader>sGs", builtin.git_status, { desc = "[S]earch [G]it [S]tatus" })
    vim.keymap.set("n", "<leader>sGS", builtin.git_stash, { desc = "[S]earch [G]it [S]tash" })

		vim.keymap.set("n", "<leader>se", function()
			builtin.diagnostics({
				bufnr = 0,
			})
		end, { desc = "[S]earch Diagnostics in Current Buffer" })

		vim.keymap.set("n", "<leader>/", function()
			-- You can pass additional configuration to Telescope to change the theme, layout, etc.
			builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				winblend = 10,
				previewer = true,
			}))
		end, { desc = "Fuzzily [S]earch in current buffer" })

		--  See `:help telescope.builtin.live_grep()` for information about particular keys
		vim.keymap.set("n", "<leader>s/", function()
			builtin.live_grep({
				grep_open_files = true,
				prompt_title = "Live Grep in Open Files",
			})
		end, { desc = "[S]earch [/] in Open Files" })

		vim.keymap.set("n", "<leader>sn", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "[S]earch [N]eovim files" })
	end,
}
