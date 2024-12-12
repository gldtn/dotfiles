local colors = require("colors")
local sbar = require("sketchybar")
local settings = require("settings")

-- get API_KEY from secret.lua
local secret = nil
pcall(function()
	secret = require("helpers.secret")
end)
local KEY = secret and secret.weather.API_KEY or nil

local config = {
	widget = {
		padding = 16,
		icon_font = settings.font.icons.alt,
		icon_color = colors.theme.widgets.weather,
		label_color = colors.theme.text.subtle,
	},
	popup = {
		width = 220,
		headers = {
			padding_left = 0,
			color = colors.theme.text.vivid,
			font = { size = settings.font.size_map["Large"] },
		},
		icon_color = colors.theme.icon.vibrant,
		icon_padding = {
			left = 12,
			right = 8,
		},
	},
}

local CITY = "Attleboro"
local STATE = "MA"
local ZIP_CODE = "02703"
local COUNTRY = "US"
local API_KEY = KEY
local UNITS = "imperial"
local DEGREE = "°F"

local function map_icon(code)
    -- stylua: ignore
	local icon_map = {
		["01d"] = "􀆭 ", ["01n"] = "􀇀 ",
		["02d"] = "􀇔 ", ["02n"] = "􀇚 ",
		["03d"] = "􀇂 ", ["03n"] = "􀇚 ",
		["04d"] = "􀇢 ", ["04n"] = "􀇢 ",
		["09d"] = "􀇆 ", ["09n"] = "􀇆 ",
		["10d"] = "􀇖 ", ["10n"] = "􀇜 ",
		["11d"] = "􀇘 ", ["11n"] = "􀇠 ",
		["13d"] = "􁷐 ", ["13n"] = "􀇎 ",
		["50d"] = "􀆷 ", ["50n"] = "􁑰 ",
	}
	return icon_map[code] or "􀌑"
end

local function fetch_weather(callback)
	local current_url = "http://api.openweathermap.org/data/2.5/weather?q="
		.. CITY
		.. ","
		.. COUNTRY
		.. "&appid="
		.. API_KEY
		.. "&units="
		.. UNITS
	local forecast_url = "http://api.openweathermap.org/data/2.5/forecast?q="
		.. CITY
		.. ","
		.. COUNTRY
		.. "&appid="
		.. API_KEY
		.. "&units="
		.. UNITS

	sbar.exec("curl -s '" .. current_url .. "'", function(current_data)
		local temp = math.floor(current_data.main.temp or 0)
		local feels_like = math.floor(current_data.main.feels_like or 0)
		local condition_text = current_data.weather[1].main or "Unknown"
		local humidity = current_data.main.humidity or 0
		local location = current_data.name .. ", " .. STATE .. " " .. ZIP_CODE
		local icon_code = current_data.weather[1].icon or ""
		local icon = map_icon(icon_code)

		sbar.exec("curl -s '" .. forecast_url .. "'", function(forecast_data)
			local forecast = {}
			for i, entry in ipairs(forecast_data.list) do
				if i % 8 == 0 then
					local dt_txt = entry.dt_txt or ""
					local temp_day = math.floor(entry.main.temp or 0)
					local condition_text = entry.weather[1].main or "Unknown"
					local icon_code = entry.weather[1].icon or ""
					local day = os.date(
						"%a. %b. %d,",
						os.time({
							year = tonumber(dt_txt:sub(1, 4)) or 0,
							month = tonumber(dt_txt:sub(6, 7)) or 0,
							day = tonumber(dt_txt:sub(9, 10)) or 0,
						})
					)
					table.insert(forecast, {
						day = day,
						temp = temp_day,
						condition = condition_text,
						icon = map_icon(icon_code),
					})
				end
			end

			callback({
				temp = temp,
				feels_like = feels_like,
				condition = condition_text,
				humidity = humidity,
				location = location,
				icon = icon,
				forecast = forecast,
			})
		end)
	end)
end

local function create_weather_widget()
	local weather = sbar.add("item", "widgets.weather", {
		position = "right",
		icon = {
			string = "􀌑 ",
			font = config.widget.icon_font,
			color = config.widget.icon_color,
		},
		label = {
			align = "right",
			string = "??°F",
			color = config.widget.label_color,
		},
	})

	local weather_bracket = sbar.add("bracket", "widgets.weather.bracket", {
		weather.name,
	}, {
		background = {
			color = settings.bracket.color,
			height = settings.bracket.height,
			border_color = settings.bracket.border_color,
			border_width = settings.bracket.border_width,
			corner_radius = settings.bracket.corner_radius,
		},
		popup = { align = "center" },
	})

	sbar.add("item", "widgets.weather.padding", {
		position = "right",
		width = settings.group_paddings,
	})

	local popup_items = {
		current_label = sbar.add("item", "weather.current_label", {
			position = "popup." .. weather_bracket.name,
			width = config.popup.width - 2,
			label = {
				string = "Current Weather",
				color = config.popup.headers.color,
				padding_left = config.popup.headers.padding_left,
				font = { size = settings.font.size_map["Large"] },
			},
		}),
		condition = sbar.add("item", "weather.condition", {
			position = "popup." .. weather_bracket.name,
			width = config.popup.width - 2,
			icon = {
				string = "􁜎 ",
				font = config.widget.icon_font,
				color = config.popup.icon_color,
				padding_left = config.popup.icon_padding.left,
				padding_right = config.popup.icon_padding.right,
			},
			label = { string = "", color = config.widget.label_color },
		}),
		feels_like = sbar.add("item", "weather.feels_like", {
			position = "popup." .. weather_bracket.name,
			width = config.popup.width - 2,
			icon = {
				string = "􀇬",
				font = config.widget.icon_font,
				color = config.popup.icon_color,
				padding_left = config.popup.icon_padding.left,
				padding_right = config.popup.icon_padding.right,
			},
			label = { string = "Feels like ??°F", color = config.widget.label_color },
		}),
		humidity = sbar.add("item", "weather.humidity", {
			position = "popup." .. weather_bracket.name,
			width = config.popup.width - 2,
			icon = {
				string = "􁃛 ",
				font = config.widget.icon_font,
				color = config.popup.icon_color,
				padding_left = config.popup.icon_padding.left,
				padding_right = config.popup.icon_padding.right,
			},
			label = { string = "Humidity, ??%", color = config.widget.label_color },
		}),
		location = sbar.add("item", "weather.location", {
			position = "popup." .. weather_bracket.name,
			width = config.popup.width - 2,
			icon = {
				string = "􀮄 ",
				font = config.widget.icon_font,
				color = config.popup.icon_color,
				padding_left = config.popup.icon_padding.left,
				padding_right = config.popup.icon_padding.right,
			},
			label = {
				string = CITY .. ", " .. STATE .. " " .. ZIP_CODE,
				color = config.widget.label_color,
			},
		}),
		spacer = sbar.add("item", "weather.spacer", {
			position = "popup." .. weather_bracket.name,
			width = config.popup.width - 2,
			label = { string = " " },
		}),
		forecast_label = sbar.add("item", "weather.forecast_label", {
			position = "popup." .. weather_bracket.name,
			width = config.popup.width - 2,
			label = {
				string = "5 Day Forecast",
				color = config.popup.headers.color,
				padding_left = config.popup.headers.padding_left,
				font = { size = settings.font.size_map["Large"] },
			},
			y_offset = 12,
		}),
	}

	local forecast_items = {}
	for i = 1, 5 do
		local item = sbar.add("item", "weather.forecast" .. i, {
			position = "popup." .. weather_bracket.name,
			icon = { string = "", font = config.widget.icon_font, color = config.popup.icon_color },
			label = { string = "", color = config.widget.label_color },
			width = config.popup.width - 2,
			drawing = false,
		})
		table.insert(forecast_items, item)
	end

	local function toggle_popup()
		local is_visible = weather_bracket:query().popup.drawing == "on"
		weather_bracket:set({ popup = { drawing = not is_visible } })

		if not is_visible then
			for _, item in ipairs(forecast_items) do
				item:set({ drawing = false })
			end
		end
	end

	local function update_weather()
		fetch_weather(function(data)
			weather:set({
				icon = { string = data.icon },
				label = { string = data.temp .. DEGREE },
			})

			popup_items.condition:set({
				icon = { string = data.icon },
				label = { string = data.condition .. ", " .. data.temp .. DEGREE },
			})
			popup_items.feels_like:set({ label = { string = "Feels like, " .. data.feels_like .. DEGREE } })
			popup_items.humidity:set({ label = { string = "Humidity, " .. data.humidity .. "%" } })
			popup_items.location:set({ label = { string = data.location } })

			for i, forecast in ipairs(data.forecast) do
				if forecast_items[i] then
					forecast_items[i]:set({
						width = config.popup.width - 2,
						icon = {
							string = forecast.icon,
							padding_left = config.popup.icon_padding.left,
							padding_right = config.popup.icon_padding.right,
						},
						label = {
							string = forecast.day .. " " .. forecast.temp .. DEGREE .. ", " .. forecast.condition,
						},
						drawing = true,
					})
				end
			end
		end)
	end

	weather:subscribe("mouse.clicked", function(env)
		toggle_popup()
		if weather_bracket:query().popup.drawing == "on" then
			update_weather()
		end
	end)

	weather:subscribe("mouse.exited.global", function(env)
		if weather_bracket:query().popup.drawing == "on" then
			weather_bracket:set({ popup = { drawing = false } })
		end
	end)

	update_weather()
end

-- Initialize widget
create_weather_widget()
