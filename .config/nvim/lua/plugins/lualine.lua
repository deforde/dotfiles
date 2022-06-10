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
--   darkgray  = "#242629",
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
--     a = {bg = colors.yellow, fg = colors.black, gui = 'bold'},
--     b = {bg = colors.darkgray, fg = colors.white},
--     c = {bg = colors.black, fg = colors.white}
--   },
--   insert = {
--     a = {bg = colors.darkgreen, fg = colors.black, gui = 'bold'},
--     b = {bg = colors.darkgray, fg = colors.white},
--     c = {bg = colors.black, fg = colors.white}
--   },
--   visual = {
--     a = {bg = colors.blue, fg = colors.black, gui = 'bold'},
--     b = {bg = colors.darkgray, fg = colors.white},
--     c = {bg = colors.black, fg = colors.white}
--   },
--   replace = {
--     a = {bg = colors.lightgreen, fg = colors.black, gui = 'bold'},
--     b = {bg = colors.darkgray, fg = colors.white},
--     c = {bg = colors.black, fg = colors.white}
--   },
--   command = {
--     a = {bg = colors.purple, fg = colors.black, gui = 'bold'},
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

