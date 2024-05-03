return {
	"lervag/vimtex",
	ft = "tex",
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
		vim.g.tex_flavor = "latex"
		vim.g.vimtex_view_method = "zathura"
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
	end,
}
