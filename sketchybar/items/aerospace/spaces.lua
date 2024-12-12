local colors = require("colors")
local sbar = require("sketchybar")
local settings = require("settings")

local workspaces_metadata = {
	[1] = { id = 1, name = "Home", icon = "􀎟" },
	[2] = { id = 2, name = "Stage", icon = "􀎹" },
	[3] = { id = 3, name = "Misc", icon = "􀑇" },
	[4] = { id = 4, name = "Code", icon = "􀙚" },
	[5] = { id = 5, name = "Comms", icon = "􁒙" },
	[6] = { id = 6, name = "Mail", icon = "􀍖" },
}

local workspaces = {}
local monitors = {}
local update_workspace_highlights

-- Temp front.app.lua order fix untill
-- sbar supports ordering of items

local callback_on_completion

-- Set the completion callback
local function set_completion_callback(callback)
	callback_on_completion = callback
end

local function trigger_completion_callback()
	if callback_on_completion then
		callback_on_completion()
	end
end

-- the above can be removed once sbar supports ordering of items

-- Superscript ordinals
local function get_superscript(id)
	local superscripts = { "¹", "²", "³", "⁴", "⁵", "⁶" }
	return superscripts[id] or ""
end

-- Add a workspace to SketchyBar
local function add_workspace(monitor_id, workspace)
	local space = sbar.add("space", "space." .. workspace.id, {
		display = monitor_id,
		icon = {
			string = workspace.icon,
			padding_left = 8,
			padding_right = 8,
			color = colors.theme.icon.subtle,
			highlight_color = colors.theme.highlight,
			font = {
				family = settings.font.icons,
				size = settings.font.size_map["medium"],
			},
		},
		label = {
			string = workspace.name .. get_superscript(workspace.id),
			padding_right = 10,
			color = colors.theme.text.dimmed,
			highlight_color = colors.theme.highlight,
			font = {
				style = settings.font.style_map["Heavy"],
				size = settings.font.size_map["Small"],
			},
		},
		padding_right = 1,
		padding_left = 1,
		click_script = string.format("aerospace workspace %d; sketchybar --trigger space_change", workspace.id),
	})

	-- Store the workspace in the global `workspaces` table
	workspaces[workspace.id] = { item = space, monitor_id = monitor_id }

	-- Subscribe each workspace item to the space_change event
	space:subscribe("space_change", function()
		update_workspace_highlights()
	end)
end

-- Add bracket to workspace items
local function add_workspace_bracket(monitor_id, workspace_ids)
	local members = {}
	for _, id in ipairs(workspace_ids) do
		table.insert(members, "space." .. id)
	end

	sbar.add("bracket", "workspace_bracket." .. monitor_id, members, {
		background = {
			color = settings.bracket.color,
			height = settings.bracket.height,
			border_color = settings.bracket.border_color,
			border_width = settings.bracket.border_width,
			corner_radius = settings.bracket.corner_radius,
		},
	})
end

-- Update workspace highlights
update_workspace_highlights = function()
	for monitor_id, _ in pairs(monitors) do
		sbar.exec("aerospace list-workspaces --monitor " .. monitor_id .. " --visible", function(visible_output)
			local visible_workspaces = {}
			for workspace_id in visible_output:gmatch("%d+") do
				visible_workspaces[tonumber(workspace_id)] = true
			end

			-- Update colors for all workspaces on this monitor
			for workspace_id, space_data in pairs(workspaces) do
				if space_data.monitor_id == monitor_id then
					local is_focused = visible_workspaces[workspace_id] ~= nil
					space_data.item:set({
						icon = { highlight = is_focused },
						label = { highlight = is_focused },
					})
				end
			end
		end)
	end
end

-- Track pending async operations
local pending_execs = 0
-- Pending operations decrementer
local function decrement_exec_and_update()
	pending_execs = pending_execs - 1
	if pending_execs == 0 then
		update_workspace_highlights()
		-- Temp fix for front_app.lua order
		trigger_completion_callback()
	end
end

-- Retrieve monitors and workspaces
sbar.exec("aerospace list-monitors", function(monitor_output)
	for line in monitor_output:gmatch("[^\r\n]+") do
		local id, name = line:match("(%d+) | (.+)")
		if id and name then
			monitors[tonumber(id)] = name
		end
	end

	for monitor_id, _ in pairs(monitors) do
		local workspace_ids = {}
		-- Increment pending operations
		pending_execs = pending_execs + 1

		-- Retrieve and add workspaces for each monitor
		sbar.exec("aerospace list-workspaces --monitor " .. monitor_id, function(workspace_output)
			for workspace_id in workspace_output:gmatch("[^\r\n]+") do
				local workspace = workspaces_metadata[tonumber(workspace_id)]
				if workspace then
					add_workspace(monitor_id, workspace)
					table.insert(workspace_ids, workspace.id)
				end
			end
			add_workspace_bracket(monitor_id, workspace_ids)

			-- Decrement pending operations and trigger highlights if done
			decrement_exec_and_update()
		end)
	end
end)

-- Remove this once sbar fixes ordering of items
-- Register callback for front_app
set_completion_callback(function()
	require("items.front_app")
	sbar.exec("sketchybar --update")
end)

return workspaces
