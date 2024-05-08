-- local colors = require("tokyonight.colors").setup({ style = "moon" })
-- local bg_highlight = colors.bg_highlight
-- local colors = require("rose-pine.colors").setup({ variant = "moon" })
return {
  normal = {
    a = { fg = colors.blue, bg = bg_highlight },
    b = { fg = colors.magenta, bg = bg_highlight },
    c = { fg = colors.fg_dark, bg = bg_highlight },
  },
  insert = {
    a = { fg = colors.green, bg = bg_highlight },
  },
  command = {
    a = { fg = colors.yellow, bg = bg_highlight },
  },
  visual = {
    a = { fg = colors.magenta, bg = bg_highlight },
  },
  replace = {
    a = { fg = colors.red, bg = bg_highlight },
  },
  terminal = {
    a = { fg = colors.green1, bg = bg_highlight },
  },
  inactive = {
    a = { fg = colors.fg_dark, bg = bg_highlight },
  },
}
