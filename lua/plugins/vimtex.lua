return {
	"lervag/vimtex",
    lazy = false,
	init = function()
		-- Use init for configuration, don't use the more common "config".
		-- keybindings
		vim.keymap.set(
			"n",
			"<leader>lc",
			":VimtexStop<CR>:VimtexClean<CR>",
			{ noremap = true, desc = "[L]atex stop and [C]lean" }
		)

		-- basic configuration
		local view_method = nil
		if vim.fn.has("mac") == 1 then
			view_method = "skim"
		elseif vim.fn.has("linux") == 1 then
			view_method = "zathura"
		end
		vim.g.tex_flavor = "latex"
		vim.g.vimtex_view_method = view_method
		vim.g.vimtex_quickfix_mode = 0
		vim.opt.conceallevel = 1
		vim.g.tex_conceal = "abdmgs"
		vim.g.vimtex_compiler_latexmk_engines = {
			_ = "-xelatex",
			pdfdvi = "-pdfdvi",
			pdfps = "-pdfps",
			pdflatex = "-pdf",
			luatex = "-lualatex",
			lualatex = "-lualatex",
			xelatex = "-xelatex",
			["context (pdftex)"] = "-pdf -pdflatex=texexec",
			["context (luatex)"] = "-pdf -pdflatex=context",
			["context (xetex)"] = "-pdf -pdflatex='texexec --xtx'",
		}

		-- macOS: refocus terminal after inverse search with skim
		if vim.fn.has("mac") == 1 then
			local terminal_app = "iTerm"

			local function tex_focus_vim()
				vim.fn.system({ "open", "-a", terminal_app })
				vim.cmd("redraw!")
			end

			local group = vim.api.nvim_create_augroup("vimtex_event_focus", { clear = true })

			vim.api.nvim_create_autocmd("User", {
				group = group,
				pattern = "VimtexEventViewReverse",
				callback = tex_focus_vim,
			})
		end
	end,
}
