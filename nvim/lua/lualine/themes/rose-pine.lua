local p = require("rose-pine.palette")
-- local config = require("rose-pine.config")

local bg_default = p.highlight_low
local overlay = p.overlay

-- if config.options.styles.transparency then
--   bg_base = "NONE"
-- end

return {
  normal = {
    a = { bg = bg_default, fg = p.muted, gui = "bold" },
    b = { bg = bg_default, fg = p.iris },
    c = { bg = bg_default, fg = p.muted },
    x = { bg = bg_default, fg = p.muted },
    y = { bg = bg_default, fg = p.muted },
    z = { bg = bg_default, fg = p.love, gui = "bold" },
  },
  insert = {
    a = { bg = overlay, fg = p.gold, gui = "bold" },
    b = { bg = overlay, fg = p.foam },
    c = { bg = overlay, fg = p.muted },
    x = { bg = overlay, fg = p.muted },
    y = { bg = overlay, fg = p.muted },
    z = { bg = overlay, fg = p.gold, gui = "bold" },
  },
  visual = {
    a = { bg = overlay, fg = p.rose, gui = "bold" },
    b = { bg = overlay, fg = p.foam },
    c = { bg = overlay, fg = p.muted },
    x = { bg = overlay, fg = p.muted },
    y = { bg = overlay, fg = p.muted },
    z = { bg = overlay, fg = p.rose, gui = "bold" },
  },
  replace = {
    a = { bg = overlay, fg = p.pine, gui = "bold" },
    b = { bg = overlay, fg = p.foam },
    c = { bg = overlay, fg = p.muted },
    x = { bg = overlay, fg = p.muted },
    y = { bg = overlay, fg = p.muted },
    z = { bg = overlay, fg = p.pine, gui = "bold" },
  },
  command = {
    a = { bg = overlay, fg = p.text, gui = "bold" },
    b = { bg = overlay, fg = p.foam },
    c = { bg = overlay, fg = p.muted },
    x = { bg = overlay, fg = p.muted },
    y = { bg = overlay, fg = p.muted },
    z = { bg = overlay, fg = p.text, gui = "bold" },
  },
  inactive = {
    a = { bg = overlay, fg = p.muted, gui = "bold" },
    b = { bg = overlay, fg = p.muted },
    c = { bg = overlay, fg = p.muted },
    x = { bg = overlay, fg = p.muted },
    y = { bg = overlay, fg = p.muted },
    z = { bg = overlay, fg = p.muted, gui = "bold" },
  },
}
