-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Map ctrl+a to select all
vim.keymap.set("n", "<C-a>", "ggVG")

-- Jump to start and end of line using the home row keys
vim.keymap.set({ "n", "v", "o" }, "H", "^")
vim.keymap.set({ "n", "v", "o" }, "L", "$")

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Exit terminal mode with <Esc><Esc>
-- NOTE: This won't work in all terminal emulators/tmux/etc.
-- Try your own mapping or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

--  Use CTRL+<hjkl> to switch between windows
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Use CTRL+<arrow keys> to resize the windows
vim.keymap.set("n", "<C-Up>", "2<C-w>+", { desc = "Increase window height", noremap = true, silent = true })
vim.keymap.set("n", "<C-Down>", "2<C-w>-", { desc = "Decrease window height", noremap = true, silent = true })
vim.keymap.set("n", "<C-Left>", "3<C-w><", { desc = "Decrease window width", noremap = true, silent = true })
vim.keymap.set("n", "<C-Right>", "3<C-w>>", { desc = "Increase window width", noremap = true, silent = true })

-- Map j to gj and k to gk in normal mode and visual mode to move visual lines instead of actual lines
vim.keymap.set("n", "j", "gj", { silent = true })
vim.keymap.set("n", "k", "gk", { silent = true })
vim.keymap.set("v", "j", "gj", { silent = true })
vim.keymap.set("v", "k", "gk", { silent = true })

-- Correcting spelling mistakes on the fly
vim.keymap.set("i", "<C-l>", "<C-g>u<Esc>[s1z=`]a<C-g>u", { silent = true })
