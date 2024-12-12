local sbar = require("sketchybar")
local colors = require("colors")

local config = {
	icon = {
		updated = colors.theme.widgets.brew.updated,
		outdated = colors.theme.widgets.brew.outdated,
	},
	label = {
		updated = colors.theme.widgets.label_muted,
		outdated = colors.theme.widgets.label_highlight,
	},
}

local M = {}

function M.setup()
	local function update_brew_count()
		local brew_update_cmd = "brew outdated | wc -l | awk '{print $1}'"
		sbar.exec(brew_update_cmd, function(result, exit_code)
			-- Check for errors
			if exit_code ~= 0 then
				print("Error fetching brew outdated count. Exit code: " .. tostring(exit_code))
				return
			end

			-- Parse results
			local brew_count = tonumber(result) or 0
			local is_highlighted = brew_count > 0

			-- Update widget
			sbar.set("widgets.brew", {
				icon = { highlight = is_highlighted },
				label = { string = tostring(brew_count), highlight = is_highlighted },
			})
		end)
	end

	local function handle_brew_action(action)
		local brew_cmd = action == "upgrade" and "/bin/zsh -c 'brew upgrade'" or "/bin/zsh -c 'brew update'"

		sbar.exec(brew_cmd, function(result, exit_code)
			result = result or ""

			-- Check for errors
			if exit_code == 0 then
				-- Notify user of success
				local notification = action == "upgrade" and "All packages have been upgraded."
					or "Brew package list has been updated."
				print("Success: " .. notification)
				sbar.exec("terminal-notifier -title 'Brew Notification' -message '" .. notification .. "'")
			else
				-- Notify user of failure
				local error_msg = action == "upgrade" and "Brew upgrade failed." or "Brew update failed."
				print("Error: " .. error_msg)
				sbar.exec("terminal-notifier -title 'Brew Notification' -message '" .. error_msg .. "'")
			end

			-- Update the brew count
			update_brew_count()
		end)
	end

	-- Create widget
	local brew = sbar.add("item", "widgets.brew", {
		position = "right",
		icon = {
			string = "􀦡",
			color = config.icon.updated,
			highlight_color = config.icon.outdated,
		},
		label = {
			string = "0",
			color = config.label.updated,
			highlight_color = config.label.outdated,
		},
		update_freq = 3600,
	})

	-- Subscribe to events
	brew:subscribe({ "forced", "routine", "system_woke" }, update_brew_count)

	-- Subscribe to mouse click events
	brew:subscribe("mouse.clicked", function(env)
		-- Detect modifier from the environment
		local modifier = env.MODIFIER or "none"

		-- Determine the action based on the modifier
		if modifier == "cmd" then
			handle_brew_action("upgrade") -- Command + Click triggers upgrade
		else
			handle_brew_action("update") -- Normal click triggers update
		end
	end)

	-- Perform the initial update
	update_brew_count()

	return { "widgets.brew" }
end

return M
