return {
  name = "uv run current file",
  desc = "Run the current python file using Astral's uv",
  builder = function()
    -- Get the absolute path of the currently active buffer/file
    local current_file = vim.fn.expand("%:p")

    return {
      cmd = { "uv" },
      args = { "run", current_file },
      -- 'default' component gives standard task behavior (opens in Overseer window, tracks exit code)
      components = { "default" },
    }
  end,
  -- This condition ensures the task only shows up when you are inside a Python file
  condition = {
    filetype = { "python" },
  },
}
