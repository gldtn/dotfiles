local colors = require("colors")
local settings = require("settings")

-- Define initial microphone state
local microphone_on = true -- Assume it's on initially
local config = {
	icon = {
		on = "",
		off = " ",
	},
	color = {
		on = colors.theme.widgets.mic.on,
		off = colors.theme.widgets.mic.off,
	},
}
-- Add the microphone widget
local microphone_item = sbar.add("item", "widgets.microphone", {
	position = "right",
	icon = {
		string = config.icon.on, -- Default
		color = config.color.on,
		font = {
			family = settings.font.default.icons,
			size = settings.font.default.size_map["Medium"],
		},
	},
	label = { drawing = false },
})

-- Toggle the microphone state
local function toggle_microphone()
	microphone_on = not microphone_on

	-- Set the icon and color
	if microphone_on then
		microphone_item:set({
			icon = {
				string = config.icon.on,
				color = config.color.on,
			},
		})
	else
		microphone_item:set({
			icon = {
				string = config.icon.off,
				color = config.color.off,
			},
		})
	end

	-- Adjust `input volume`
	local command = microphone_on and "osascript -e 'set volume input volume 100'"
		or "osascript -e 'set volume input volume 0'"
	sbar.exec(command)
end

-- Subscribe to mouse click event to toggle microphone
microphone_item:subscribe("mouse.clicked", toggle_microphone)

-- Initial state setup
if microphone_on then
	microphone_item:set({
		icon = { string = config.icon.on, color = config.color.on },
	})
else
	microphone_item:set({
		icon = { string = config.icon.off, color = colors.color.off },
	})
end
