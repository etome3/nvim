return {
  {
    "saghen/blink.cmp", -- or "hrsh7th/nvim-cmp" if you are using nvim-cmp
    opts = function(_, opts)
      opts.keymap = {
        preset = "super-tab", -- Enables a preset of keymaps including Tab for selection/acceptance
        ["<Tab>"] = { "select_and_accept" }, -- Explicitly map Tab to select and accept
        ["<S-Tab>"] = { "select_prev" }, -- Map Shift-Tab to select previous
      }
    end,
  },
}
