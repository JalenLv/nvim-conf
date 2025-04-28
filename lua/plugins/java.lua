return {
	{
		"mfussenegger/nvim-jdtls",

		dependencies = { "mfussenegger/nvim-dap" },

		ft = "java",

		config = function()
			local config = {
				cmd = { vim.fn.expand("~") .. "/.local/share/nvim/mason/bin/jdtls" },
				root_dir = vim.fn.getcwd(),
				-- root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
				init_options = {
					bundles = {},
				},
			}

			local bundles = {
				vim.fn.glob(
					vim.fn.expand("~")
						.. "/.local/share/nvim/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar",
					1
				),
			}
			vim.list_extend(
				bundles,
				vim.split(
					vim.fn.glob(
						vim.fn.expand("~") .. "/.local/share/nvim/mason/packages/java-test/extension/server/*.jar",
						1
					),
					"\n"
				)
			)
			config.init_options.bundles = bundles

			require("jdtls").start_or_attach(config)

			-- Example configuration to launch a main class
			-- local dap = require("dap")
			-- dap.configurations.java = {
			-- 	{
			-- 		-- You need to extend the classPath to list your dependencies.
			-- 		-- `nvim-jdtls` would automatically add the `classPaths` property if it is missing
			-- 		classPaths = {},
			--
			-- 		-- If using multi-module projects, remove otherwise.
			-- 		projectName = "yourProjectName",
			--
			-- 		javaExec = "/usr/bin/java",
			-- 		mainClass = "yourMainClassName",
			-- 		-- mainClass = "your.package.name.MainClassName",
			--
			-- 		-- If using the JDK9+ module system, this needs to be extended
			-- 		-- `nvim-jdtls` would automatically populate this property
			-- 		modulePaths = {},
			-- 		name = "Launch YourClassName",
			-- 		request = "launch",
			-- 		type = "java",
			-- 	},
			-- }
		end,
	},
}
