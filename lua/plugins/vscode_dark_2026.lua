return {
    { "rktjmp/lush.nvim", lazy = true },
    {
      "etome3/vscode_dark_2026.nvim", -- ← change this
      lazy = false,
      priority = 1000,
      config = function()
        vim.cmd("colorscheme vscode_dark_2026")
      end,
    },
  }