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
	{
		"malewicz1337/oil-git.nvim",
		opts = {
			symbol_position = "signcolumn",
			can_use_signcolumn = function()
				return "yes"
			end,
		},
	},
}
