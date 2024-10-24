local schema = require("themes.highlights-schema")

local M = {}

M.setup = function(c)
	local accent = {
		color1 = c.blue,
		color2 = c.sky,
		color3 = c.mauve,
	}
	local neutral = {
		color1 = c.text,
		color2 = c.subtext1,
		color3 = c.surface3,
	}
	local primary = {
		color1 = c.base,
		color2 = c.mantle,
		color3 = c.surface1,
	}
	local title = {
		float = { fg = primary.color1, bg = c.blue },
		preview = { fg = primary.color1, bg = c.green },
	}

	return schema.get_highlights(accent, neutral, primary, title)
end

return M
