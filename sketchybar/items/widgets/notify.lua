local icons = require("icons")
local colors = require("colors")
local settings = require("settings")

-- Padding item required because of bracket
sbar.add("item", { position = "right", width = settings.group_paddings })

local brew = sbar.add("item", "widgets.brew", 42, {
	position = "right",
	background = {
		height = 22,
		color = { alpha = 0 },
		border_width = 0,
		drawing = true,
	},
	icon = {
		string = "􀐚",
		color = colors.theme.widgets.green,
	},
	label = {
		string = "0",
		font = {
			family = settings.font.numbers,
			style = settings.font.default.style_map["Bold"],
		},
		align = "right",
		padding_right = 0,
	},
	update_freq = 5,
	padding_right = settings.paddings + 6,
})

local mail = sbar.add("item", "widgets.mail", 42, {
	position = "right",
	background = {
		height = 22,
		color = { alpha = 0 },
		border_width = 0,
		drawing = true,
	},
	icon = {
		string = "􀍖",
		color = colors.theme.widgets.green,
	},
	label = {
		string = "0",
		font = {
			family = settings.font.numbers,
			style = settings.font.default.style_map["Bold"],
		},
		align = "right",
		padding_right = 0,
	},
	update_freq = 5,
	padding_right = settings.paddings,
})

local messages = sbar.add("item", "widgets.messages", 42, {
	position = "right",
	background = {
		height = 22,
		color = { alpha = 0 },
		border_width = 0,
		drawing = true,
	},
	icon = {
		string = "􀼂",
		color = colors.theme.widgets.green,
	},
	label = {
		string = "0",
		font = {
			family = settings.font.numbers,
			style = settings.font.default.style_map["Bold"],
		},
		align = "right",
		padding_right = 0,
	},
	update_freq = 5,
	padding_right = settings.paddings,
})

sbar.add("bracket", "widgets.notifications.bracket", { brew.name, mail.name, messages.name }, {
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

-- Function to update brew count
local function update_brew_count()
	-- Use awk to sanitize the output of brew outdated and strip whitespace
	local brew_update_cmd = "brew outdated | wc -l | awk '{print $1}'"

	sbar.exec(brew_update_cmd, function(result, exit_code)
		if exit_code ~= 0 then
			-- Log error if the command fails
			print("Error fetching brew outdated count. Exit code: " .. tostring(exit_code))
			return
		end

		local brew_count = tonumber(result) or 0 -- Default to 0 if result is nil or invalid
		local color
		local label_padding

		-- Determine color and padding based on brew count
		if brew_count >= 30 then
			color = colors.theme.widgets.red
			label_padding = 1
		elseif brew_count >= 10 then
			color = colors.theme.widgets.yellow
			label_padding = 1
		elseif brew_count >= 1 then
			color = colors.theme.widgets.blue
			label_padding = 1
		else
			color = colors.theme.widgets.green
			label_padding = 0
		end

		-- Update the widget with the new count and color
		brew:set({
			label = {
				string = tostring(brew_count),
				padding_right = label_padding,
			},
			icon = {
				color = color,
			},
		})
	end)
end

-- Function to update mail count
local function update_mail_count()
	sbar.exec(
		[[lsappinfo info -only StatusLabel "Mimestream" | grep -o '"label"="[0-9]*"' | awk -F'"' '{print $4}']],
		function(count)
			local mail_count = tonumber(count) or 0
			local color

			-- Color logic based on unread email count
			if mail_count >= 30 then
				color = colors.theme.widgets.red
			elseif mail_count >= 10 then
				color = colors.theme.widgets.yellow
			elseif mail_count >= 1 then
				color = colors.theme.widgets.blue
			else
				color = colors.theme.widgets.green
			end

			mail:set({
				label = {
					string = tostring(mail_count),
				},
				icon = {
					color = color,
				},
			})
		end
	)
end

-- Function to update messages count
local function update_messages_count()
	local cmd =
		[[sqlite3 ~/Library/Messages/chat.db "SELECT COUNT(guid) FROM message WHERE NOT(is_read) AND NOT(is_from_me) AND text !=''"]]

	sbar.exec(cmd, function(count)
		local message_count = tonumber(count) or 0
		local icon_color

		-- Color logic based on unread count
		if message_count >= 30 then
			icon_color = colors.theme.widgets.red
		elseif message_count >= 10 then
			icon_color = colors.theme.widgets.yellow
		elseif message_count >= 1 then
			icon_color = colors.theme.widgets.blue
		else
			icon_color = colors.theme.widgets.green
		end

		messages:set({
			label = {
				string = tostring(message_count),
			},
			icon = {
				color = icon_color,
			},
		})
	end)
end

-- Subscribe to update events
sbar.subscribe("brew_update", update_brew_count)
sbar.subscribe("mail_check", update_mail_count)
sbar.subscribe("messages_check", update_messages_count)

-- Add these new event subscriptions
brew:subscribe({ "forced", "routine", "system_woke" }, update_brew_count)
mail:subscribe({ "forced", "routine", "system_woke" }, update_mail_count)
messages:subscribe({ "forced", "routine", "system_woke" }, update_messages_count)

local brew_update_helper = "$CONFIG_DIR/helpers/brew_update.sh"

brew:subscribe("mouse.clicked", function(env)
	if env.modifier == "cmd" then -- Command + Click to upgrade
		-- Upgrade all outdated packages using the helper script
		sbar.exec(brew_update_helper .. " upgrade")
		update_brew_count() -- Update the count after upgrade
	else -- Normal click updates the package list
		-- Update the Homebrew package list using the helper script
		sbar.exec(brew_update_helper .. " update")
		update_brew_count()
	end
end)

mail:subscribe("mouse.clicked", function(env)
	sbar.exec("open -a Mimestream.app")
end)

messages:subscribe("mouse.clicked", function(env)
	sbar.exec("open -a Messages.app")
end)

-- Initial count fetch
update_brew_count()
update_mail_count()
update_messages_count()
