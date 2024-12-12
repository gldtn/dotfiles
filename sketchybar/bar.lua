local colors = require("colors")

-- Equivalent to the --bar domain
sbar.bar({
	height = 36,
	border_width = 1,
	padding_left = 2,
	padding_right = 2,
	color = colors.theme.bar.bg,
	border_color = colors.theme.bar.border,
})
