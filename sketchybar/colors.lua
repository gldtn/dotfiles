local color_utils = require("utils.color_utils")

local theme_name = "catppuccin"
local themes = {
	catppuccin = require("themes.catppuccin"),
}

local colors = {
	transparent = "00000000",

	with_alpha = function(color, alpha)
		if alpha > 1.0 or alpha < 0.0 then
			return color
		end
		return (color & 0x00ffffff) | (math.floor(alpha * 255.0) << 24)
	end,
}
colors.theme = themes[theme_name]
color_utils.preprocess_colors(colors.theme)

return colors
