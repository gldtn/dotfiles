local sbar = require("sketchybar")
local systems_bracket = require("helpers.brackets.systems")

-- Widget modules
local widget_modules = {
	require("items.widgets.systems.volume"),
	require("items.widgets.systems.network"),
}

-- Initialize widgets
local widget_names = {}

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

-- Create the systems bracket if there are valid widgets
if #widget_names > 0 then
	systems_bracket.create_systems_bracket(widget_names)
else
	sbar.exec("echo 'No widgets to create systems bracket.'")
end
