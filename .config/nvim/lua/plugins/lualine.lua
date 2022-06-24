-- local colors = {
--   yellow      = "#FAC03B",
--   -- special     = "#ffb354",
--   -- preproc     = "#a29bfe",
--   lightgreen  = "#a3db81",
--   white       = "#d1d1d1",
--   -- fg_alt      = "#a1a1a1",
--   -- statusline  = "#34373a",
--   -- darker      = "#131515",
--   black       = "#181a1b",
--   -- darkgray    = "#1d2023",
--   darkgray    = "#242629",
--   -- darkgray    = "#4c5356",
--   lightgray   = "#2D3032",
--   darkgreen   = "#37ad82",
--   blue        = "#7398dd",
--   purple      = "#ca70d6",
--   red         = "#c15959",
-- }
--
-- local sitruuna = {
--   normal = {
--     a = {bg = colors.lightgray, fg = colors.yellow, gui = 'bold'},
--     b = {bg = colors.darkgray, fg = colors.white},
--     c = {bg = colors.black, fg = colors.white}
--   },
--   insert = {
--     a = {bg = colors.lightgray, fg = colors.darkgreen, gui = 'bold'},
--     b = {bg = colors.darkgray, fg = colors.white},
--     c = {bg = colors.black, fg = colors.white}
--   },
--   visual = {
--     a = {bg = colors.lightgray, fg = colors.blue, gui = 'bold'},
--     b = {bg = colors.darkgray, fg = colors.white},
--     c = {bg = colors.black, fg = colors.white}
--   },
--   replace = {
--     a = {bg = colors.lightgray, fg = colors.lightgreen, gui = 'bold'},
--     b = {bg = colors.darkgray, fg = colors.white},
--     c = {bg = colors.black, fg = colors.white}
--   },
--   command = {
--     a = {bg = colors.lightgray, fg = colors.purple, gui = 'bold'},
--     b = {bg = colors.darkgray, fg = colors.white},
--     c = {bg = colors.black, fg = colors.white}
--   },
--   inactive = {
--     a = {bg = colors.darkgray, fg = colors.gray, gui = 'bold'},
--     b = {bg = colors.darkgray, fg = colors.white},
--     c = {bg = colors.black, fg = colors.white}
--   }
-- }

require"lualine".setup {
  options = {
      theme = "vscode",
      -- theme = sitruuna,
      globalstatus = true,
  },
}

