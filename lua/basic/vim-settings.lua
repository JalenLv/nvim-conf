-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: For more options, see `:help option-list`

-- Set <space> as the leader key
-- NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true

vim.opt.number = true
-- vim.opt.relativenumber = true

vim.opt.mouse = "a"

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

vim.opt.clipboard = "unnamedplus"

-- Disable line wrapping
vim.opt.wrap = true
-- Smart wrap with correct indentation
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wildignorecase = true

vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 100

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
vim.opt.list = false
-- vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.g.rust_recommended_style = 0

-- Show substitution effects in a split window
vim.opt.inccommand = "split"

-- Disable current line highlighting
vim.opt.cursorline = false

vim.opt.scrolloff = 5

-- Disable the default Vim startup message.
vim.opt.shortmess:append("I")

-- Enable spell checker
vim.opt.spell = true
-- Set the language for spell checking: en_us, cjk
vim.opt.spelllang = { "en_us", "cjk" }

-- Neovide settings
if vim.g.neovide then
	vim.o.guifont = "JetBrainsMono Nerd Font:h12"
end

-- Disable "Press ENTER or type command to continue" prompt
vim.opt.shortmess:append("T")
-- vim.opt.cmdheight = 2

