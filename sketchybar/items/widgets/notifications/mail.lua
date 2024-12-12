local sbar = require("sketchybar")
local colors = require("colors")

local config = {
	icon = {
		read = colors.theme.widgets.mail.read,
		unread = colors.theme.widgets.mail.unread,
	},
	label = {
		read = colors.theme.widgets.label_muted,
		unread = colors.theme.widgets.label_highlight,
	},
}

local M = {}

function M.setup()
	local function update_mail_count()
		local mail_check_cmd =
			[[lsappinfo info -only StatusLabel "Mimestream" | grep -o '"label"="[0-9]*"' | awk -F'"' '{print $4}']]
		sbar.exec(mail_check_cmd, function(result, exit_code)
			-- Check for errors
			if exit_code ~= 0 then
				print("Error fetching mail count. Exit code: " .. tostring(exit_code))
				return
			end

			-- Parse results
			local mail_count = tonumber(result) or 0
			local is_highlighted = mail_count > 0

			-- Update widget
			sbar.set("widgets.mail", {
				icon = { highlight = is_highlighted },
				label = { string = tostring(mail_count), highlight = is_highlighted },
			})
		end)
	end

	-- Create widget
	local mail = sbar.add("item", "widgets.mail", {
		position = "right",
		icon = {
			string = "􀍖",
			color = config.icon.read,
			highlight_color = config.icon.unread,
		},
		label = {
			string = "0",
			color = config.label.read,
			highlight_color = config.label.unread,
		},
		update_freq = 3600,
	})

	-- Subscribe to events
	mail:subscribe({ "forced", "routine", "system_woke" }, update_mail_count)
	mail:subscribe("mouse.clicked", function(env)
		-- Detect modifier from the environment
		local modifier = env.MODIFIER or "none"

		-- Determine the action based on the modifier
		if modifier == "cmd" then
			update_mail_count() -- Cmd-click triggers update
		else
			sbar.exec("open -a Mimestream") -- Normal click opens mail app
		end
	end)

	-- Perform the initial update
	update_mail_count()

	return { "widgets.mail" }
end

return M
