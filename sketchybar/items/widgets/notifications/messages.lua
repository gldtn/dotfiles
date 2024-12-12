local sbar = require("sketchybar")
local colors = require("colors")

local config = {
	icon = {
		read = colors.theme.widgets.messages.read,
		unread = colors.theme.widgets.messages.unread,
	},
	label = {
		read = colors.theme.widgets.label_muted,
		unread = colors.theme.widgets.label_highlight,
	},
}

local M = {}

function M.setup()
	local function update_messages_count()
		local messages_check_cmd =
			[[sqlite3 ~/Library/Messages/chat.db "SELECT COUNT(guid) FROM message WHERE NOT(is_read) AND NOT(is_from_me) AND text !=''"]]
		sbar.exec(messages_check_cmd, function(result, exit_code)
			-- Check for errors
			if exit_code ~= 0 then
				print("Error fetching messages count. Exit code: " .. tostring(exit_code))
				return
			end

			-- Parse results
			local messages_count = tonumber(result) or 0
			local is_highlighted = messages_count > 0

			-- Update widget
			sbar.set("widgets.messages", {
				icon = { highlight = is_highlighted },
				label = { string = tostring(messages_count), highlight = is_highlighted },
			})
		end)
	end

	-- Create widget
	local messages = sbar.add("item", "widgets.messages", {
		position = "right",
		icon = {
			string = "􀼂",
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
	messages:subscribe({ "forced", "routine", "system_woke" }, update_messages_count)
	messages:subscribe("mouse.clicked", function(env)
		-- Detect modifier from the environment
		local modifier = env.MODIFIER or "none"

		-- Determine the action based on the modifier
		if modifier == "cmd" then
			update_messages_count() -- Cmd-click triggers update
		else
			sbar.exec("open -a Messages.app") -- Normal click opens messages app
		end
	end)

	-- Perform the initial update
	update_messages_count()

	return { "widgets.messages" }
end

return M
