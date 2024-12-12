local colors = require("colors")
local sbar = require("sketchybar")
local settings = require("settings")

-- Add aerospace mode change event
sbar.add("event", "aerospace_mode_change")

-- Mode mappings
local mode_definitions = {
	main = { icon = "", label = "Main" },
	layout = { icon = "󰙀", label = "Layout" },
	resize = { icon = "􂁟", label = "Resize" },
	service = { icon = "", label = "Service" },
	workspace = { icon = "󰨑", label = "Workspace" },
	unknown = { icon = "", label = "Unknown Mode" },
}

-- Add aerospace_mode item
local aerospace_mode = sbar.add("item", "aerospace_mode", {
	position = "center",
	icon = {
		drawing = true,
		padding_left = 8,
		padding_right = 0,
		color = colors.theme.icon.vibrant,
		highlight_color = colors.theme.highlight,
		font = { family = settings.font.icons, size = settings.font.size_map["Medium"] },
	},
	label = {
		drawing = true,
		padding_left = 6,
		padding_right = 8,
		color = colors.theme.text.dimmed,
		highlight_color = colors.theme.highlight,
		font = {
			style = settings.font.style_map["Semibold"],
		},
	},
})

-- Helper function to update mode icon and label
local function update_aerospace_mode_state(env)
	local mode = env.MODE or "main" -- Default to "main" if mode is not set
	local definition = mode_definitions[mode] or mode_definitions["unknown"]

	aerospace_mode:set({
		icon = { string = definition.icon },
		label = { string = definition.label },
	})
end

-- Set default mode to "main" at startup
update_aerospace_mode_state({ MODE = "main" })

-- Subscribe to aerospace_mode_change event
aerospace_mode:subscribe("aerospace_mode_change", update_aerospace_mode_state)

return aerospace_mode
