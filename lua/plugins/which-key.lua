return {
	-- Useful plugin to show you pending keybinds.
	"folke/which-key.nvim",
	config = function()
		require("which-key").setup()

		-- Document existing key chains
		require("which-key").add({
			{ "<leader>c", group = "[C]ode/[C]opilot" },
			{ "<leader>c_", hidden = true },
			{ "<leader>d", group = "[D]ebug" },
			{ "<leader>d_", hidden = true },
			{ "<leader>l", group = "[L]atex/[L]uaSnip" },
			{ "<leader>l_", hidden = true },
			{ "<leader>m", group = "[M]arkdown" },
			{ "<leader>m_", hidden = true },
			{ "<leader>r", group = "[R]efactor" },
			{ "<leader>r_", hidden = true },
			{ "<leader>s", group = "[S]earch" },
			{ "<leader>s_", hidden = true },
			{ "<leader>sG", group = "[S]earch [G]it" },
			{ "<leader>sG_", hidden = true },
			{ "<leader>t", group = "[T]erminal" },
			{ "<leader>t_", hidden = true },
			{ "<leader>T", group = "[T]ree/[T]ypst" },
			{ "<leader>T_", hidden = true },
			{ "<leader>u", group = "[U]ltisnips" },
			{ "<leader>u_", hidden = true },
			{ "<leader><leader>", group = "Easymotion" },
			{ "<leader><leader>_", hidden = true },
			{ "]]", group = "Next TODO" },
			{ "]]_", hidden = true },
			{ "[[", group = "Previous TODO" },
			{ "[[_", hidden = true },
		})
	end,
}
