local function lsp()
  local count = {}
  local levels = {
    errors = "Error",
    warnings = "Warn",
    info = "Info",
    hints = "Hint",
  }

  for k, level in pairs(levels) do
    count[k] = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
  end

  local errors = ""
  local warnings = ""
  local hints = ""
  local info = ""

  if count["errors"] ~= 0 then
    errors = string.format(" %d", count["errors"])
  end
  if count["warnings"] ~= 0 then
    warnings = string.format(" %d", count["warnings"])
  end
  if count["hints"] ~= 0 then
    hints = string.format(" %d", count["hints"])
  end
  if count["info"] ~= 0 then
    info = string.format(" %d", count["info"])
  end

  return string.format(
    " %s %s %s %s ",
    errors,
    warnings,
    hints,
    info
  )
end

local vcs = function()
  local git_info = vim.b.gitsigns_status_dict
  if not git_info or git_info.head == "" then
    return ""
  end

  added = ""
  changed = ""
  removed = ""

  if (git_info.added and git_info.added ~= 0) then
    added = string.format("+%d", git_info.added)
  end

  if (git_info.changed and git_info.changed ~= 0) then
    changed = string.format("~%d", git_info.changed)
  end

  if (git_info.removed and git_info.removed ~= 0) then
    removed = string.format("-%d", git_info.removed)
  end

  return string.format(
    '  %s %s %s %s', git_info.head, added, changed, removed
  )
end

status_line = {}

status_line.active = function()
  return string.format(
    " %s %%= %s %%P %%l:%%c ",
    vcs(),
    lsp()
  )
end

function status_line.inactive()
  return " %f"
end

