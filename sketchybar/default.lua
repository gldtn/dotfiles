local settings = require("settings")
local colors = require("colors")

-- Equivalent to the --default domain
sbar.default({
	updates = "when_shown",
	icon = {
		font = {
			family = settings.font.icons,
			style = settings.font.style_map["Regular"],
			size = settings.font.size_map["Medium"],
		},
		color = colors.theme.icon.subtle,
		padding_left = settings.paddings,
		padding_right = settings.paddings,
		background = { image = { corner_radius = 5 } },
	},
	label = {
		font = {
			family = settings.font.text,
			style = settings.font.style_map["Semibold"],
			size = settings.font.size_map["Small"],
		},
		color = colors.theme.text.subtle,
		padding_left = settings.paddings,
		padding_right = settings.paddings,
	},
	-- controls app menu bracket
	background = {
		height = 27,
		border_width = 1,
		corner_radius = 4,
		border_color = colors.theme.bracket.border,
		image = {
			corner_radius = 5,
			border_width = 1,
			border_color = colors.theme.bracket.border,
		},
	},
	popup = {
		background = {
			border_width = 2,
			corner_radius = 5,
			shadow = { drawing = true },
			color = colors.theme.popup.bg,
			border_color = colors.theme.popup.border,
		},
		blur_radius = 50,
	},
	padding_left = 6,
	padding_right = 6,
	scroll_texts = true,
})
