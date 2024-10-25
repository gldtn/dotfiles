local colors = require("themes." .. _G.active_theme .. "." .. _G.active_theme .. "-feline-theme")

local component = {}
local left_separator = ""
local right_separator = ""

-- File info component
component.file_info = {
	provider = {
		name = "file_info",
		opts = { type = "relative" },
	},
	hl = { fg = colors.color.fileinfo_text, bg = colors.color.fileinfo_bg },
	left_sep = left_separator,
	right_sep = right_separator,
}

return component
