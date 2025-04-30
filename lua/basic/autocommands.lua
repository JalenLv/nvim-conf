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

-- Install `lazy.nvim` plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		lazyrepo,
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
--
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
