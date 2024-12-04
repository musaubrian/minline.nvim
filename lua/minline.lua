local M = {}

local MODES = {
  n = "N",
  i = "I",
  v = "V",
  [""] = "V",
  V = "V",
  c = "C",
  R = "R",
  t = "T",
  ["!"] = "T",
}
local not_git_repo = "fatal: not a git repository"

function M.get_mode()
  M.current_mode = MODES[vim.fn.mode()] or "?"
  return M.current_mode
end

function M.get_git_branch()
  local ok, branch = pcall(vim.fn.systemlist, "git branch --show-current")
  if not ok or not branch[1] or branch[1]:match(not_git_repo) then
    return ""
  end

  return branch[1]
end

function M.get_filename()
  local filename = vim.fn.fnamemodify(vim.fn.expand "%", ":~")
  return filename ~= "" and filename or "<No file>"
end

function M.get_git_diff()
  return "%{get(b:,'gitsigns_status','')}"
end

local function update_statusline()
  vim.o.statusline = table.concat {
    "%#MinLineMode#",
    " [" .. M.get_mode() .. "]",
    "  ",
    "%#MinLineGitBranch#",
    "%{%v:lua.require('minline').get_git_branch()%}",
    " ",
    "%#MinLinePrimaryText#",
    "%=" .. M.get_filename() .. "%=",
    " ",
    "%#MinLineSecondaryText#",
    "%{%v:lua.require('minline').get_git_diff()%}",
    "    ",
    "%#MinLinePrimaryText#",
    "[%l:%c]",
    " ",
  }
end

function M.setup()
  local augroup = vim.api.nvim_create_augroup("MinLine", { clear = true })

  -- Update on mode changes
  vim.api.nvim_create_autocmd("ModeChanged", {
    group = augroup,
    pattern = "*:*",
    callback = update_statusline,
  })

  -- Update on entering a buffer
  vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
    group = augroup,
    pattern = "*",
    callback = update_statusline,
  })

  update_statusline()
end

return M
