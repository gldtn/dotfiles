local colors = require("themes." .. _G.active_theme .. "." .. _G.active_theme .. "-feline-theme")

local component = {}
local left_separator = ""
local right_separator = ""

-- File type component
component.file_type = {
	provider = {
		name = "file_type",
		opts = {
			filetype_icon = true,
		},
	},
	hl = {
		fg = colors.theme.component_fg,
		bg = colors.theme.component_bg,
	},
	left_sep = left_separator,
	right_sep = right_separator,
}

return component
