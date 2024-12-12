local icons = require("icons")
local colors = require("colors")
local settings = require("settings")

local whitelist = { ["Spotify"] = true, ["Music"] = true }

local media_cover = sbar.add("item", {
	position = "right",
	background = {
		image = {
			string = "media.artwork",
			scale = 0.70,
		},
		color = colors.transparent,
	},
	label = { drawing = false },
	icon = { drawing = false },
	drawing = false,
	updates = true,
	popup = {
		align = "center",
		horizontal = true,
	},
})

local media_artist = sbar.add("item", {
	position = "right",
	drawing = false,
	padding_left = 3,
	padding_right = 0,
	width = 0,
	icon = { drawing = false },
	label = {
		width = 0,
		font = { size = 9 },
		color = colors.with_alpha(colors.theme.accent.primary, 0.6),
		max_chars = 18,
		y_offset = 6,
	},
})

local media_title = sbar.add("item", {
	position = "right",
	drawing = false,
	padding_left = 3,
	padding_right = 0,
	icon = { drawing = false },
	label = {
		font = { size = 11 },
		width = 0,
		max_chars = 16,
		y_offset = -5,
	},
})

-- Popup Controls
sbar.add("item", {
	position = "popup." .. media_cover.name,
	icon = { string = icons.media.back },
	label = { drawing = false },
	click_script = "nowplaying-cli previous",
})
local play_pause_item = sbar.add("item", {
	position = "popup." .. media_cover.name,
	icon = {
		string = icons.media.play_pause,
		color = colors.white,
		font = {
			family = settings.font.icons,
			size = settings.font.size_map["Medium"],
		},
		y_offset = 0,
	},
	label = { drawing = false },
	click_script = "nowplaying-cli togglePlayPause",
})
local stop_item = sbar.add("item", {
	position = "popup." .. media_cover.name,
	icon = {
		string = "􀛷", -- Stop icon
		color = colors.red,
		font = {
			family = settings.font.icons,
			size = settings.font.size_map["Medium"],
		},
		y_offset = 0,
	},
	label = { drawing = false },
	click_script = string.format(
		"osascript -e 'tell application \"Spotify\" to quit' && "
			.. "osascript -e 'tell application \"Music\" to quit' && "
			.. "nowplaying-cli pause && "
			.. "sketchybar --set %s drawing=off popup.drawing=off "
			.. "--set %s drawing=off "
			.. "--set %s drawing=off",
		media_cover.name,
		media_artist.name,
		media_title.name
	),
})
sbar.add("item", {
	position = "popup." .. media_cover.name,
	icon = { string = icons.media.forward },
	label = { drawing = false },
	click_script = "nowplaying-cli next",
})

-- Helper function to update media state
local function update_media_state(info)
	if whitelist[info.app] then
		local is_playing = (info.state == "playing")

		-- Update artist, title, and cover visibility
		media_artist:set({
			drawing = true,
			label = { string = info.artist, width = "dynamic" },
		})
		media_title:set({
			drawing = true,
			label = { string = info.title, width = "dynamic" },
		})
		media_cover:set({ drawing = true })

		-- Update play/pause icon
		play_pause_item:set({
			icon = {
				string = is_playing and "􀊆" or "􀊄", -- 􀊆 for pause, 􀊄 for play
				y_offset = 0,
			},
		})
	end
end

-- Handle media_change event
media_cover:subscribe("media_change", function(env)
	update_media_state(env.INFO)
end)

-- Show popup on mouse.clicked
media_cover:subscribe("mouse.clicked", function()
	media_cover:set({ popup = { drawing = true } })
end)

-- Hide popup on mouse.exited.global
media_cover:subscribe("mouse.exited.global", function()
	media_cover:set({ popup = { drawing = false } })
end)

-- Check initial state of media when script loads
sbar.exec("nowplaying-cli info", function(output)
	local app, state, artist, title = output:match("(%w+)|(%w+)|([^|]*)|([^|]*)")
	if app and state then
		update_media_state({ app = app, state = state, artist = artist, title = title })
	end
end)
