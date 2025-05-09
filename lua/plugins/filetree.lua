function _G.get_oil_winbar()
  local bufnr = vim.api.nvim_win_get_buf(vim.g.statusline_winid)
  local dir = require("oil").get_current_dir(bufnr)
  if dir then
    return vim.fn.fnamemodify(dir, ":~")
  else
    -- If there is no current directory (e.g. over ssh), just show the buffer name
    return vim.api.nvim_buf_get_name(0)
  end
end

return {
	{
		"stevearc/oil.nvim",
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {},
		-- Optional dependencies
		-- dependencies = { { "echasnovski/mini.icons", opts = {} } },
		dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
		-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
		lazy = false,

		config = function()
			local oil = require("oil")
			oil.setup({
				columns = {
					"permissions",
					"size",
					"mtime",
					"icon",
				},
				win_options = {
					winbar = "%!v:lua.get_oil_winbar()",
				},
			})

			local oil_toggle = function()
				if vim.bo.filetype == "oil" then
					oil.close()
				else
					oil.open()
				end
			end
			vim.keymap.set("n", "T", oil_toggle, { desc = "[T]oggle Oil" })
		end,
	},
	-- {
	--   "nvim-tree/nvim-tree.lua",
	--   version = "*",
	--   lazy = false,
	--   dependencies = {
	--     "nvim-tree/nvim-web-devicons",
	--   },
	--
	--   init = function()
	--     -- disable netrw
	--     vim.g.loaded_netrw = 1
	--     vim.g.loaded_netrwPlugin = 1
	--     -- optionally enable 24-bit colour
	--     vim.opt.termguicolors = true
	--   end,
	--
	--   config = function()
	--     -- global mappings
	--     -- vim.keymap.set("n", "<leader>Tt", "<cmd>NvimTreeToggle<CR>", { desc = "[T]ree [T]oggle" })
	--     vim.keymap.set("n", "T", "<cmd>NvimTreeToggle<CR>", { desc = "[T]ree [T]oggle" })
	--
	--     -- custom on_attach function
	--     -- on_attach means that this function will be called when the nvim-tree is opened
	--     local function on_attach(bufnr)
	--       local api = require("nvim-tree.api")
	--
	--       local function opts(desc)
	--         return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	--       end
	--
	--       -- default mappings
	--       api.config.mappings.default_on_attach(bufnr)
	--
	--       -- custom mappings
	--       vim.keymap.set("n", "<C-t>", api.tree.change_root_to_parent, opts("Up"))
	--       vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
	--     end
	--
	--     -- pass to setup along with your other options
	--     require("nvim-tree").setup({
	--       on_attach = on_attach,
	--     })
	--   end,
	-- },
}
