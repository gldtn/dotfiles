local colors = require("colors")

return {
	paddings = 3,
	group_paddings = 6,

	bracket = {
		height = 27,
		border_width = 1,
		corner_radius = 4,
		color = colors.theme.bracket.bg,
		border_color = colors.theme.bracket.border,
	},

	icons = "nerdfont", -- alternatively available: NerdFont

	-- This is a font configuration for SF Pro and SF Mono (installed manually)
	font = {
		default = {},
		text = "SF Pro", -- Used for text
		numbers = "SF Mono", -- Used for numbers
		icons = "Symbols Nerd Font Mono", -- Used for icons

		-- Font style map
		style_map = {
			["Regular"] = "Regular",
			["Semibold"] = "Semibold",
			["Bold"] = "Bold",
			["Heavy"] = "Heavy",
			["Black"] = "Black",
		},

		-- Font size map
		size_map = {
			["Small"] = 12.0,
			["Medium"] = 14.0,
			["Large"] = 16.0,
		},
	},
}
