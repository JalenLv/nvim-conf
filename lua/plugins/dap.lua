return {
	{
		"mfussenegger/nvim-dap",
		event = "VimEnter",
		lazy = true,

		dependencies = {
			-- Mason stuff
			"williamboman/mason.nvim",
			"jay-babu/mason-nvim-dap.nvim",
		},

		config = function()
			-- Setup mason
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})

			-- See https://github.com/jay-babu/mason-nvim-dap.nvim/blob/main/lua/mason-nvim-dap/mappings/source.lua for all available adapters
			local adapters = {
				-- java
				-- jdtls is the Java Language Server, which can also be used for debugging Java applications. It depends on javadbg and javatest.
				-- See https://github.com/mfussenegger/nvim-jdtls?tab=readme-ov-file#debugger-via-nvim-dap for more details
				"javadbg",
				"javatest",

				-- python
				"python",

				-- cpp
				"cppdbg",
			}

			require("mason-nvim-dap").setup({
				ensure_installed = adapters,
				automatic_installation = false,

				-- Automatic server setup handler
				-- See https://github.com/jay-babu/mason-nvim-dap.nvim?tab=readme-ov-file#handlers-usage-automatic-setup for more details.
				handlers = {
					function(config)
						-- default handler

						-- Keep original functionality
						require("mason-nvim-dap").default_setup(config)
					end,

					-- You can provide custom handlers for each adapter.
					-- For example, to override the default handler for the `python` adapter:
					-- python = function(config)
					-- 	config.adapters = {
					-- 		type = "executable",
					-- 		command = "/usr/bin/python3",
					-- 		args = {
					-- 			"-m",
					-- 			"debugpy.adapter",
					-- 		},
					-- 	}
					-- 	require("mason-nvim-dap").default_setup(config) -- don't forget this!
					-- end,
				},
			})

			-- Keymaps
			local dap = require("dap")
			local dapui = require("dapui")
			local widgets = require("dap.ui.widgets")

			vim.keymap.set("n", "<F5>", function()
				dap.continue()
			end)
			vim.keymap.set("n", "<F6>", function()
				dap.terminate({ on_done = dapui.close() })
			end)
			vim.keymap.set("n", "<F7>", function()
				dap.step_back()
			end)
			vim.keymap.set("n", "<F8>", function()
				dap.step_over()
			end)
			vim.keymap.set("n", "<F9>", function()
				dap.step_into()
			end)
			vim.keymap.set("n", "<F10>", function()
				dap.step_out()
			end)

			vim.keymap.set("n", "<Leader>db", function()
				dap.toggle_breakpoint()
			end, { desc = "Toggle [B]reakpoint" })
			vim.keymap.set("n", "<Leader>dB", function()
				dap.set_breakpoint()
			end, { desc = "Set [B]reakpoint" })
			vim.keymap.set("n", "<Leader>dl", function()
				dap.list_breakpoints()
			end, { desc = "[L]ist Breakpoint" })
			vim.keymap.set("n", "<Leader>dL", function()
				dap.set_breakpoint(nil, nil, vim.fn.input("[L]og point message: "))
			end, { desc = "Set [L]og Point" })

			vim.keymap.set("n", "<Leader>dc", function()
				-- dap.repl.open()
				dap.repl.toggle()
			end, { desc = "Toggle REPL/Debug-[C]onsole" })
			vim.keymap.set("n", "<Leader>dr", function()
				dap.run_last()
			end, { desc = "[R]un Last" })

			vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
				widgets.hover()
			end, { desc = "[H]over" })
			vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
				widgets.preview()
			end, { desc = "[P]review" })
			vim.keymap.set("n", "<Leader>df", function()
				widgets.centered_float(widgets.frames)
			end, { desc = "View current [F]rames" })
			vim.keymap.set("n", "<Leader>ds", function()
				widgets.centered_float(widgets.scopes)
			end, { desc = "View current [S]cope" })
		end,
	},
	{
		"rcarriga/nvim-dap-ui",

		event = "LspAttach",
		lazy = true,

		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
			{
				"folke/lazydev.nvim",
				opts = {
					library = { "nvim-dap-ui" },
				},
			},
		},

		config = function()
			require("dapui").setup()

			local dap, dapui = require("dap"), require("dapui")
			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end
		end,
	},
}
