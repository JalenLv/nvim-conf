-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = general,
	desc = "Highlight when yanking (copying) text",
})

-- Disable New Line Comment
vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		-- Enable newline comment by entering <CR> in insert mode
		-- Disable it by entering o or O in normal mode
		vim.opt.formatoptions:remove({ "o" })
	end,
	group = general,
	desc = "Disable New Line Comment",
})
