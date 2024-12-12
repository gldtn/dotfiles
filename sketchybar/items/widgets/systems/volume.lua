local sbar = require("sketchybar")
local colors = require("colors")
local icons = require("icons")
local settings = require("settings")

local M = {} -- Module table

local popup_width = 250

function M.setup()
	-- Main items
	local volume_percent = sbar.add("item", "widgets.volume1", {
		position = "right",
		icon = { drawing = false },
		label = {
			string = "??%",
			padding_left = -1,
			font = { family = settings.font.numbers },
		},
	})

	local volume_icon = sbar.add("item", "widgets.volume2", {
		position = "right",
		padding_right = -1,
		icon = {
			string = icons.volume._100,
			width = 0,
			align = "left",
			color = colors.theme.icon.muted, -- Default color
			font = {
				style = settings.font.style_map["Regular"],
				size = settings.font.size_map["Medium"],
			},
		},
		label = {
			width = 25,
			align = "left",
			font = {
				style = settings.font.style_map["Regular"],
				size = settings.font.size_map["Medium"],
			},
			color = colors.theme.icon.vibrant,
		},
	})

	-- Bracket for the widget
	local volume_bracket = sbar.add("bracket", "widgets.volume.bracket", {
		volume_icon.name,
		volume_percent.name,
	}, {
		background = { color = "NONE" },
		popup = { align = "center" },
	})

	-- Popup slider
	local volume_slider = sbar.add("slider", popup_width, {
		position = "popup." .. volume_bracket.name,
		slider = {
			background = {
				height = 8,
				corner_radius = 3,
				color = colors.theme.widgets.volume.slider.bg,
			},
			knob = {
				string = "􀀁",
				drawing = true,
				color = colors.theme.widgets.volume.slider.knob,
			},
			highlight_color = colors.theme.widgets.volume.slider.bar,
		},
		background = { color = colors.theme.widgets.volume.slider.bar, height = 2, y_offset = -20 },
		click_script = 'osascript -e "set volume output volume $PERCENTAGE"',
	})

	-- Volume update logic
	volume_percent:subscribe("volume_change", function(env)
		local volume = tonumber(env.INFO)
		local icon = icons.volume._0
		if volume > 60 then
			icon = icons.volume._100
		elseif volume > 30 then
			icon = icons.volume._66
		elseif volume > 10 then
			icon = icons.volume._33
		elseif volume > 0 then
			icon = icons.volume._10
		end

		local lead = volume < 10 and "0" or ""
		volume_icon:set({ label = icon })
		volume_percent:set({ label = lead .. volume .. "%" })
		volume_slider:set({ slider = { percentage = volume } })
	end)

	-- Expand/collapse popup
	local function volume_collapse_details()
		local drawing = volume_bracket:query().popup.drawing == "on"
		if not drawing then
			return
		end
		volume_bracket:set({ popup = { drawing = false } })
		sbar.remove("/volume.device\\.*/")
	end

	local current_audio_device = "None"
	local function volume_toggle_details(env)
		if env.BUTTON == "right" then
			sbar.exec("open /System/Library/PreferencePanes/Sound.prefpane")
			return
		end

		local should_draw = volume_bracket:query().popup.drawing == "off"
		if should_draw then
			volume_bracket:set({ popup = { drawing = true } })
			sbar.exec("SwitchAudioSource -t output -c", function(result)
				current_audio_device = result:sub(1, -2)
				sbar.exec("SwitchAudioSource -a -t output", function(available)
					local color = colors.theme.text.subtle
					local counter = 0

					for device in string.gmatch(available, "[^\r\n]+") do
						color = (device == current_audio_device) and colors.theme.accent.secondary
							or colors.theme.text.subtle
						sbar.add("item", "volume.device." .. counter, {
							position = "popup." .. volume_bracket.name,
							width = popup_width,
							align = "center",
							label = { string = device, color = color },
							click_script = 'SwitchAudioSource -s "'
								.. device
								.. '" && sketchybar --set /volume.device\\.*/ label.color='
								.. colors.theme.text.subtle
								.. " --set $NAME label.color="
								.. colors.theme.accent.secondary,
						})
						counter = counter + 1
					end
				end)
			end)
		else
			volume_collapse_details()
		end
	end

	local function volume_scroll(env)
		local delta = env.INFO.delta
		if not (env.INFO.modifier == "ctrl") then
			delta = delta * 10.0
		end

		sbar.exec('osascript -e "set volume output volume (output volume of (get volume settings) + ' .. delta .. ')"')
	end

	-- Subscriptions
	volume_icon:subscribe("mouse.clicked", volume_toggle_details)
	volume_icon:subscribe("mouse.scrolled", volume_scroll)
	volume_percent:subscribe("mouse.clicked", volume_toggle_details)
	volume_percent:subscribe("mouse.exited.global", volume_collapse_details)
	volume_percent:subscribe("mouse.scrolled", volume_scroll)

	-- Return both widget names for the bracket
	return { "widgets.volume1", "widgets.volume2" }
end

return M
