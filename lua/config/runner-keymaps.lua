-- Keymaps for running files
local map = vim.keymap.set
local term = require("snacks").terminal
local term_instance

local function run_in_terminal(cmd)
  -- Check if the terminal instance exists, its buffer is loaded, AND its window is valid.
  if not (term_instance and term_instance.buf and vim.api.nvim_buf_is_loaded(term_instance.buf) and vim.api.nvim_win_is_valid(term_instance.win)) then
    term_instance = term.open(nil, {
      auto_insert = false,
      win = {
        split = "below",
        height = 15,
        position = "bottom",
        focusable = true,
        enter = false,
        show = true,
        hide = false,
      },
    })
  end

  -- It's possible term.open() failed, so check again.
  if term_instance and term_instance.buf and vim.api.nvim_win_is_valid(term_instance.win) then
    local chan = vim.bo[term_instance.buf].channel
    vim.fn.chansend(chan, { cmd .. "\r\n" })
    -- Focus the terminal window
    vim.api.nvim_set_current_win(term_instance.win)
  else
    vim.notify("Failed to open or reuse terminal", vim.log.levels.ERROR)
  end
end

-- Run File
-- Runs the current file based on its filetype
map("n", "<leader>r", function()
  local file = vim.fn.expand("%")
  local file_no_ext = vim.fn.expand("%:r")
  local filetype = vim.bo.filetype
  local cmd

  if filetype == "python" then
    cmd = "python " .. vim.fn.shellescape(file)
  elseif filetype == "go" then
    cmd = "go run " .. vim.fn.shellescape(file)
  elseif filetype == "javascript" or filetype == "typescript" then
    cmd = "bun run " .. vim.fn.shellescape(file)
  elseif filetype == "rust" then
    cmd = "rustc " .. vim.fn.shellescape(file) .. " -o " .. vim.fn.shellescape(file_no_ext) .. " && " .. vim.fn.shellescape(file_no_ext)
  elseif filetype == "c" then
    cmd = "gcc " .. vim.fn.shellescape(file) .. " -o " .. vim.fn.shellescape(file_no_ext) .. " && " .. vim.fn.shellescape(file_no_ext)
  elseif filetype == "cpp" then
    cmd = "g++ " .. vim.fn.shellescape(file) .. " -o " .. vim.fn.shellescape(file_no_ext) .. " && " .. vim.fn.shellescape(file_no_ext)
  elseif filetype == "java" then
    cmd = "java " .. vim.fn.shellescape(file)
  elseif filetype == "sh" then
    cmd = "sh " .. vim.fn.shellescape(file)
  elseif filetype == "lua" then
    cmd = "lua " .. vim.fn.shellescape(file)
  else
    vim.notify("Unsupported filetype for running: " .. filetype, vim.log.levels.WARN)
    return
  end

  run_in_terminal(cmd)
end, { desc = "Run Current File" })