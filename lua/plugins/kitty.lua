M = {}

if vim.fn.has("unix") then
	M = {
		"fladson/vim-kitty",
		ft = "kitty",
		-- tag = "*", -- You can select a tagged version
	}
end

return M
