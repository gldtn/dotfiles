local schema = require("themes.highlights-schema")

local M = {}

M.on_highlights = function(hl, c)
	-- theme colors
	local accent = {
		color1 = c.blue,
		color2 = c.cyan,
		color3 = c.magenta,
	}
	local neutral = {
		color1 = c.fg,
		color2 = c.fg_dark,
		color3 = c.comment,
	}
	local primary = {
		color1 = c.bg,
		color2 = c.bg_dark,
		color3 = c.bg_highlight,
	}
	local title = {
		float = { fg = primary.color1, bg = c.blue },
		preview = { fg = primary.color1, bg = c.green },
	}

	schema.setup(hl, accent, neutral, primary, title)
end

return M
