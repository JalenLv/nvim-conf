return {
	{
		"mfussenegger/nvim-jdtls",
		dependencies = { "mfussenegger/nvim-dap" },
		ft = "java",
		-- nvim-jdtls should only do dap config. Lsp config is done in lsp.lua
		config = true,
	},
}
