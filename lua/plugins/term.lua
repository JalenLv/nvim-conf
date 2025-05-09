return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function ()
      require("toggleterm").setup()

      vim.keymap.set(
        "n",
        "<leader>th",
        "<cmd>ToggleTerm<CR><C-\\><C-n><Cmd>setlocal nospell<CR>",
        { desc = "Toggle [T]erminal [H]orizontal" }
      )

      vim.keymap.set(
        "n",
        "<leader>tv",
        "<cmd>ToggleTerm direction=vertical<CR><C-\\><C-n><Cmd>setlocal nospell<CR>",
        { desc = "Toggle [T]erminal [V]ertical" }
      )

      vim.keymap.set(
        "n",
        "<leader>tf",
        "<cmd>ToggleTerm direction=float<CR><C-\\><C-n><Cmd>setlocal nospell<CR>",
        { desc = "Toggle [T]erminal [F]loat" }
      )

      vim.keymap.set(
        "n",
        "<leader>tt",
        "<cmd>ToggleTerm direction=tab<CR><C-\\><C-n><Cmd>setlocal nospell<CR>",
        { desc = "Toggle [T]erminal [T]ab/[T]oggle" }
      )
    end,
  }
}
