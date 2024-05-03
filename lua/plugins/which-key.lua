return {
	-- Useful plugin to show you pending keybinds.
	"folke/which-key.nvim",
	config = function()
		require("which-key").setup()

		-- Document existing key chains
		require("which-key").register({
			["<leader>c"] = { name = "[C]ode/[C]opilot", _ = "which_key_ignore" },
			["<leader>d"] = { name = "[D]ocument", _ = "which_key_ignore" },
			["<leader>r"] = { name = "[R]ename", _ = "which_key_ignore" },
			["<leader>s"] = { name = "[S]earch", _ = "which_key_ignore" },
			["<leader>w"] = { name = "[W]orkspace", _ = "which_key_ignore" },
			["<leader>t"] = { name = "[T]ree/[T]erminal", _ = "which_key_ignore" },
			["<leader>l"] = { name = "[L]atex/[L]uaSnip", _ = "which_key_ignore" },
			["<leader>u"] = { name = "[U]ltisnips", _ = "which_key_ignore" },
		})
	end,
}
