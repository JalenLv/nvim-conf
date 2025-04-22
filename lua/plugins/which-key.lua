return {
	-- Useful plugin to show you pending keybinds.
	"folke/which-key.nvim",
	config = function()
		require("which-key").setup()

		-- Document existing key chains
		-- require("which-key").register({
		-- 	["<leader>c"] = { name = "[C]ode/[C]opilot", _ = "which_key_ignore" },
		-- 	["<leader>d"] = { name = "[D]ocument", _ = "which_key_ignore" },
		-- 	["<leader>r"] = { name = "[R]ename", _ = "which_key_ignore" },
		-- 	["<leader>s"] = { name = "[S]earch", _ = "which_key_ignore" },
		-- 	["<leader>w"] = { name = "[W]orkspace", _ = "which_key_ignore" },
		-- 	["<leader>t"] = { name = "[T]ree/[T]erminal", _ = "which_key_ignore" },
		-- 	["<leader>l"] = { name = "[L]atex/[L]uaSnip", _ = "which_key_ignore" },
		-- 	["<leader>u"] = { name = "[U]ltisnips", _ = "which_key_ignore" },
		-- })
		require("which-key").add({
			{ "<leader>c", group = "[C]ode/[C]opilot" },
			{ "<leader>c_", hidden = true },
			{ "<leader>d", group = "[D]ocument" },
			{ "<leader>d_", hidden = true },
			{ "<leader>l", group = "[L]atex/[L]uaSnip" },
			{ "<leader>l_", hidden = true },
			{ "<leader>m", group = "[M]arkdown" },
			{ "<leader>m_", hidden = true },
			{ "<leader>r", group = "[R]ename" },
			{ "<leader>r_", hidden = true },
			{ "<leader>s", group = "[S]earch" },
			{ "<leader>s_", hidden = true },
			{ "<leader>t", group = "[T]ree/[T]erminal" },
			{ "<leader>t_", hidden = true },
			{ "<leader>u", group = "[U]ltisnips" },
			{ "<leader>u_", hidden = true },
			{ "<leader>w", group = "[W]orkspace" },
			{ "<leader>w_", hidden = true },
		})
	end,
}
