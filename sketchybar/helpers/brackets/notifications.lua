local sbar = require("sketchybar")
local settings = require("settings")

local M = {}

function M.create_notifications_bracket(widget_names)
	if #widget_names == 0 then
		print("No widgets to create notifications bracket.")
		return
	end

	sbar.add("bracket", "widgets.notifications.bracket", widget_names, {
		background = {
			color = settings.bracket.color,
			height = settings.bracket.height,
			border_color = settings.bracket.border_color,
			border_width = settings.bracket.border_width,
			corner_radius = settings.bracket.corner_radius,
		},
	})

	sbar.add("item", "widgets.notifications.padding", {
		position = "right",
		width = settings.group_paddings,
	})
end

return M
