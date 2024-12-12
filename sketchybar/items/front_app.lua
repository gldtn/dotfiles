local colors = require("colors")
local settings = require("settings")
local app_icons = require("helpers.app_icons")

local front_app = sbar.add("item", "front_app", {
	-- display = "active",
	position = "left",

	icon = {
		drawing = true,
		padding_left = 4,
		padding_right = 4,
		font = { family = settings.font.icons },
		color = colors.theme.highlight,
	},

	label = {
		color = colors.theme.text.vibrant,
		font = {
			style = settings.font.style_map["Black"],
		},
	},

	updates = true,
})

-- Define app groups and their fallback icons
local app_groups = {
	browser_apps = { icon = app_icons.browsers.web, apps = { "arc", "duckduckgo", "microsoft edge", "google chrome" } },
	mail_apps = { icon = app_icons.mail.default, apps = { "mail", "spark", "airmail", "outlook", "thunderbird" } },
	terminal_apps = { icon = app_icons.terminal.default, apps = { "iterm", "terminal", "wezterm", "alacritty" } },
	dev_apps = {
		icon = app_icons.dev.default,
		apps = {
			"zed",
			"vim",
			"emacs",
			"xcode",
			"neovim",
			"pycharm",
			"phpstorm",
			"webstorm",
			"intellij",
			"zed preview",
			"sublime text",
		},
	},
	ai_apps = { icon = app_icons.ai.default, apps = { "chatgpt", "openai" } },
	chat_apps = { icon = app_icons.chat.default, apps = { "messages" } },
	music_apps = { icon = app_icons.music.default, apps = { "itunes" } },
	settings_apps = {
		icon = app_icons.macos.cog,
		apps = { "settings", "system settings", "system information", "system preferences" },
	},
}

-- Function to normalize app names (case-insensitive comparison)
local function normalize_app_name(app_name)
	return string.lower(app_name:gsub(" ", "_"))
end

-- Function to find icon for the front app
local function resolve_icon(app_name)
	local normalized_name = normalize_app_name(app_name)

	-- Check for specific app icon in the app_icons table
	for _, icons in pairs(app_icons) do
		if icons[normalized_name] then
			return icons[normalized_name]
		end
	end

	-- Check for app group fallback
	for _, group in pairs(app_groups) do
		for _, app in ipairs(group.apps) do
			if normalize_app_name(app) == normalized_name then
				return group.icon
			end
		end
	end

	-- Fallback to default app icon
	return app_icons.general.app
end

-- Subscribe to `front_app_switched` event
front_app:subscribe("front_app_switched", function(env)
	local app_name = env.INFO or "Unknown App"
	local icon = resolve_icon(app_name)

	-- Update the front app item
	front_app:set({
		icon = { string = icon },
		label = { string = app_name },
	})
end)

-- Subscribe to mouse click event
---@diagnostic disable-next-line: unused-local
front_app:subscribe("mouse.clicked", function(env)
	sbar.trigger("swap_menus_and_spaces")
end)
