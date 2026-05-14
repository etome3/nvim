return {
  "folke/snacks.nvim",

  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    dashboard = {
      enabled = true,
      preset = {
        header = [[
███    ██ ███████  ██████  ██    ██ ██ ███    ███ 
████   ██ ██      ██    ██ ██    ██ ██ ████  ████ 
██ ██  ██ █████   ██    ██ ██    ██ ██ ██ ████ ██ 
██  ██ ██ ██      ██    ██  ██  ██  ██ ██  ██  ██ 
██   ████ ███████  ██████    ████   ██ ██      ██ 
                                                  

        ]],
      },
    },
    terminal = {
      enabled = true,
      win = {
        position = "bottom",
        height = 0.3,
      },
    },
  },
}
