return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	init = function()
		-- disable netrw
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
		-- optionally enable 24-bit colour
		vim.opt.termguicolors = true
	end,

	config = function()
		-- global mappings
		vim.keymap.set("n", "<leader>tt", "<cmd>NvimTreeToggle<CR>", { desc = "[T]ree [T]oggle" })

		-- custom on_attach function
		-- on_attach means that this function will be called when the nvim-tree is opened
		local function on_attach(bufnr)
			local api = require("nvim-tree.api")

			local function opts(desc)
				return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
			end

			-- default mappings
			api.config.mappings.default_on_attach(bufnr)

			-- custom mappings
			vim.keymap.set("n", "<C-t>", api.tree.change_root_to_parent, opts("Up"))
			vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
		end

		-- pass to setup along with your other options
		require("nvim-tree").setup({
			on_attach = on_attach,
		})
	end,
}
