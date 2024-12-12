local sbar = require("sketchybar")
local notifications = require("helpers.brackets.notifications")

local widget_modules = {
	require("items.widgets.notifications.brew"),
	require("items.widgets.notifications.mail"),
	require("items.widgets.notifications.messages"),
}

local widget_names = {}

-- Iterate over widget modules and collect widget names
for _, module in ipairs(widget_modules) do
	if module and type(module.setup) == "function" then
		local result = module.setup()
		if type(result) == "table" then
			for _, name in ipairs(result) do
				table.insert(widget_names, name)
			end
		end
	end
end

-- Create notifications bracket if there are valid widgets
if #widget_names > 0 then
	notifications.create_notifications_bracket(widget_names)
else
	sbar.exec("echo 'No widgets to create notifications bracket.'")
end
